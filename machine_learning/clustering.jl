using DataFrames
using CSV
using JSON
using VegaLite
using VegaDatasets
using FileIO


houses = CSV.File("../data/newhouses.csv") |> DataFrame

# show columns
# names(houses)

cali_shape = JSON.parsefile("../data/california-counties.json")
W = VegaDatasets.VegaJSONDataset(cali_shape, "../data/california-counties.json")

@vlplot(width=500, height=300) +
@vlplot(
    mark={
        :geoshape, 
        fill=:black, 
        stroke=:white
        },
    data={
        values=W, 
        format={
            type=:topojson, 
            feature=:cb_2015_california_county_20m
            }
        },
    projection={
        type=:albersUsa
        },
    ) +
@vlplot(
    :circle,
    data=houses,
    projection={
        type=:albersUsa
        },
    longitude="longitude:q",
    latitude="latitude:q",
    size={
        value=12
        },
    color="median_house_value:q"                
) |> FileIO.save("../img/clustering.png")