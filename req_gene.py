# Requirements.txt Generator for Julia
import os
import sys


# Module Extractor
class ModuleExtractor:
    def julia(self, source) -> list:
        result = list()
        source_list = source.split("\n")
        for line in source_list:
            if line.startswith("using"):
                module = line.split(" ")[1]
                if not module.startswith("."):
                    module = module.split(".")[0]
                    module = module.replace(":", "").replace(";", "")
                    result.append(module)   

        return result             

class RequirementsGenerator:
    # initialize valiables and run function
    def __init__(self, dir_name: str) -> None:
        self.all_dir: list = [dir_name]
        self.all_file = list()
        self.base_dir = dir_name

        self.get_dirs(dir_name)
        self.get_files()
        self.main()

    # Of course I know that there is "os.walk". But...
    # Get all directories in the selected directory.
    def get_dirs(self, path) -> list:
        middle = list()
        base = os.listdir(path)
        files_dir = [f for f in base if os.path.isdir(os.path.join(path, f))]
        for dir in files_dir:
            self.all_dir.append(f"{path}/{dir}")
            middle += self.get_dirs(f"{path}/{dir}")

        return middle

    # Retrieves a specific file in the retrieved directory.
    def get_files(self) -> None:
        for dir in self.all_dir:
            base = os.listdir(dir)
            files = [f for f in base if os.path.isfile(os.path.join(dir, f))]
            files = list(filter(lambda f: f.endswith("jl"), files))
            files = list(map(lambda f: f"{dir}/{f}", files))
            self.all_file += files

    # Main process(generate)
    def main(self) -> None:
        # Module extract
        module_extractor = ModuleExtractor()
        module_list = list()
        for file_path in self.all_file:
            with open(file_path, "r", encoding="utf-8") as f:
                source = f.read()
            module_list += getattr(module_extractor, "julia")(source)

        # Generate
        module_list = list(set(module_list))
        module_list.sort()
        with open(f"{self.base_dir}/requirements.txt", "w", encoding="utf-8") as f:
            data = "\n".join(module_list)
            f.write(data)

#  - Usage - 
# $ python3 req_gene.py <Directory name>
RequirementsGenerator(sys.argv[1])