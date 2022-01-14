# Case Study: Clustering using DataFrames
using CSVhouses = CSV.File("data/newhouses.csv") |> DataFramenames(houses)## Visually Representing Map DataWe will use Vega-Lite to visually represent the housing data on a map of california. Required packages will all be made available using the following code. Files are included in the `data` folder. ] add JSON] add VegaLite] add VegaDatasetsusing JSON
using VegaLite
using VegaDatasetscali_shape = JSON.parsefile("data/california-counties.json")
VV = VegaDatasets.VegaJSONDataset(cali_shape, "data/california-counties.json")@vlplot(width=500, height=300) +
@vlplot(
    mark={
        :geoshape,
        fill=:black,
        stroke=:white
    },
    data={
        values=VV,
        format={
            type=:topojson,
            feature=:cb_2015_california_county_20m
        }
    },
    projection={
        type=:albersUsa
    },
)+
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
                    
)## Division based on PriceLet's split the dataset into groups. Each group will be a multiple of 100k (according to price). bucketprice = Int.(div.(houses[!, :median_house_value], 100000))extrema(bucketprice)insertcols!(houses, 3, :cprice => bucketprice)@vlplot(width=500, height=300) +
@vlplot(
    mark={
        :geoshape,
        fill=:black,
        stroke=:white
    },
    data={
        values=VV,
        format={
            type=:topojson,
            feature=:cb_2015_california_county_20m
        }
    },
    projection={
        type=:albersUsa
    },
)+
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
    color="cprice:n" # this is different 
) ## K-means Clustering] add Clusteringusing Clusteringhouses = dropmissing(houses)X = houses[!, [:median_house_value]] # Select in-place. Don't create a copy. size(X) # currently a column vector C = kmeans(Matrix(X)', 5) # K-means needs a row vector insertcols!(houses, 3, :cluster_k => C.assignments)@vlplot(width=500, height=300) +
@vlplot(
    mark={
        :geoshape,
        fill=:black,
        stroke=:white
    },
    data={
        values=VV,
        format={
            type=:topojson,
            feature=:cb_2015_california_county_20m
        }
    },
    projection={
        type=:albersUsa
    },
)+
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
    color="cluster_k:n"
                    
)