# Classification ] add RDatasets] add MLBaseusing RDatasets
using MLBaseiris = dataset("datasets", "iris")X = Matrix(iris[:, 1:4])
irislabels = iris[:, 5]irislabelsmap = labelmap(irislabels)y = labelencode(irislabelsmap, irislabels) # convert this to numeric counterparts using Randomfunction perclass_splits(y, p)
    uids = unique(y)
    keepids = []

    for ui in uids
        curids = findall(y.==ui)
        rowids = randsubseq(curids, p) 
        push!(keepids,rowids...)

    end
    return keepids
endtrain_ids = perclass_splits(y, 0.7)test_ids = setdiff(1:length(y), train_ids)@show size(train_ids)
@show size(test_ids)function assign_class(predictedvalue)
    return argmin(abs.(predictedvalue .- [1, 2, 3])) # return whichever value the predicted value is closest to 
end # to clarify for predicted value of 3.1: 
argmin([2.1, 1.1, 0.9])   assign_class(2.2)## Using Classifiers ## Decision Trees ] add DecisionTreeusing DecisionTreemodel = DecisionTreeClassifier(max_depth=2)DecisionTree.fit!(model, X[train_ids, :], y[train_ids])q = X[test_ids, :]
predictions_DT = DecisionTree.predict(model, q)function findaccuracy(predictedvals, groundtruthvals)
    sum(predictedvals .== groundtruthvals) / length(groundtruthvals)
end findaccuracy(predictions_DT, y[test_ids])### Random Forests model = RandomForestClassifier(n_trees=20)
DecisionTree.fit!(model, X[train_ids, :], y[train_ids])q = X[test_ids, :]
predictions_RF = DecisionTree.predict(model, q)
findaccuracy(predictions_RF, y[test_ids])### Support Vector Machines ] add LIBSVM using LIBSVMXtrain = X[train_ids, :]
ytrain = y[train_ids]model = svmtrain(Xtrain', ytrain)predictions_SVM, decision_values = svmpredict(model, X[test_ids, :]')
findaccuracy(predictions_SVM, y[test_ids])