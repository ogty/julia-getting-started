import os
import json


all_file = []

parent: list = os.listdir("C:\\Users\\dadad\\Desktop\\GettingStarted\\jlgs\\ipynb")
files = [f for f in parent if os.path.isfile(os.path.join("C:\\Users\\dadad\\Desktop\\GettingStarted\\jlgs\\ipynb", f))]
filtered_files_path = list(filter(lambda path: path.endswith("ipynb"), files))
file_full_path = list(map(lambda path: os.path.join("C:\\Users\\dadad\\Desktop\\GettingStarted\\jlgs\\ipynb", path), filtered_files_path))
all_file += file_full_path

print(all_file)

for file_path in all_file:
    with open(file_path, "r", encoding="utf-8") as f:
        source = f.read()

        source_list = []
        ipynb_data: object = json.loads(source)
        for cell in ipynb_data["cells"]:
            source_list += cell["source"]
        source = "".join(source_list)

        file_path = file_path.rstrip(".ipynb")
        with open(f"{file_path}.jl", "w", encoding="utf-8") as g:
            g.write(source)
