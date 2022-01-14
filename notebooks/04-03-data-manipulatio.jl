# Data Manipulation ## Loading Data and Different FormatsLet's read the CSV file into a better format - Apache Arrow! url = "https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original"
download(url, "data/auto.txt")readlines("data/auto.txt") # Just to see if it's thereusing CSV
using DataFramesdf = CSV.File(
    "data/auto.txt",
    delim=' ',
    ignorerepeated=true,
    header=[
        :mpg, 
        :cylinders, 
        :displacement, 
        :horsepower,
        :weight, 
        :acceleration, 
        :year, 
        :origin, 
        :name
    ],
    missingstring="NA"
) |> DataFrameThat didn't work well. So, let's try to fix this. raw_str = read("data/auto.txt", String)str_no_tab = replace(raw_str, '\t'=>' ')io = IOBuffer(str_no_tab)df = CSV.File(
    io,
    delim=' ',
    ignorerepeated=true,
    header=[
        :mpg, 
        :cylinders, 
        :displacement, 
        :horsepower,
        :weight, 
        :acceleration, 
        :year, 
        :origin, 
        :name
    ],
    missingstring="NA"
) |> DataFrame## Missing Values sum(count(ismissing, col) for col in eachcol(df))count(ismissing, Matrix(df)) # much cleaner mapcols(x -> count(ismissing, x), df)   
# take a column and send it to the function 
# this is more descriptive, of course ## Adding a Column based on Data Let's take the name and take it's first part for "brand". df.namesplit.(df.name)
df.brand = first.(split.(df.name))df[1:10, ["name", "brand"]]size(df)df2 = dropmissing(df)size(df2)mapcols(x -> count(ismissing, x), df2)   df2[df2.brand .== "saab", :] # index-style syntax# same as above 
filter(row -> row.brand == "saab", df2)## Saving For Future Use CSV.write("data/auto-cleaned.csv", df2)We will also use Arrow to save our data. Highly recommended for storing all data. Read more here: https://arrow.apache.org/] add Arrow using ArrowArrow.write("data/auto-cleaned.arrow", df2)## Further Data Manipulations df2 = Arrow.Table("data/auto-cleaned.arrow") |> DataFramegrouped_brands = groupby(df2, :brand)grouped_brands[("ford",)]       

# Notice the trailing comma!

# This has to be a tuple because we could've grouped 
#  by more than one cols using Statisticsbrand_mpg = combine(grouped_brands, :mpg => mean)ENV["LINES"] = 10 # I find the large number of rows annoying brand_mpg = combine(grouped_brands, :mpg => mean)

# takes the mean column from each group and 
# passes it to the mean function 
# creates a 'group_name' -> 'aggregate' We can also sort it based on the mean. sort!(brand_mpg, :mpg_mean, rev=true) # in-place sort## Piping and Data Wrangling There are usually many stages through which we want our data to go through. These are "assembled" or chained together. Piping makes this very readable for us. We want to read the data from our original data set, group it by brand and then use combine to calculate aggregates on it. df.origin # where the brand is from orig_brand = groupby(df, :brand)
orig_brand = combine(orig_brand, :origin => x -> length(unique(x)))

# notice the name of the resulting column# We can make this prettier and less error-prone. ] add Pipe using Pipeorig_brand = @pipe df |> 
    groupby(_, :brand) |> 
    combine(_, :origin => x -> length(unique(x)))# each brand should have an origin of 1. Let's verify. 
extrema(orig_brand.origin_function)We can also count the number of data points for each brand. origin_brand2 = @pipe df |>
    groupby(_, [:origin, :brand]) |>
    combine(_, nrow) |> 
    sort(_, :nrow, rev=true)origin_vs_brand = unstack(origin_brand2, :brand, :origin, :nrow)coalesce.(origin_vs_brand, 0)   
# replace missing values with 0 because 
# that makes sense here 