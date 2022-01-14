# Arrays, Matrices & TensorsArrays are the most powerful and useful features in Julia. Let's start with some basics. students = ["jack", "jill", "john"]typeof(students)String defines the type of the elements and 1 is the dimension of the array. So, this is a **"1D array of string values"**.fib = [1, 1, 2, 3, 5, 8, 13]typeof(fib)push!(fib, 21)@show fib; pop!(fib)@show fib;## 2D Arraysmat = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9, 24]
]typeof(mat)Notice the type! It's not a 2D matrix. It's a 1D array but each element within it is a 1D array itself! These are useful in certain cases, but we are usually interested in 2D arrays in data science and machine learning.

Let's create a 2D array. ## Matrices x = [1 2 3]       # notice the lack of commas (and the dimensions) x'                # turn this into a column vector mat = [
       [1  2  3] 
       [4  5  6] 
       [7  8  9]
      ]typeof(mat)### Sizes (Shapes) and Reshaping size(mat)     # extremely important in modern machine learning size(x)size(fib)     # Important difference X = [
       [1   2   3] 
       [4   5   6] 
       [7   8   9]
       [10  11  12]
      ]X = reshape(X, 2, 6)X = reshape(X, 12, 1)X = reshape(X, 4, 3)## Helper Functions ### Creating Random Matricesrand(4, 3)mat = rand(4, 3)mat_2 = mat;mat_2[1, 1] = 100.0mat_2mat### Copying Arrays mat_3 = copy(mat)  
# this creates a copy of the values mat_3[1, 1] = 999.0matmat_3## Comprehensions We can also do nested loops with comprehensions. [i^2 for i in 1:10][(i, j) for i in 1:5, j in 6:10]      # cartesian product (or nested loop)[(i^2, j+1//2) for i in 1:5, j in 6:10]## Matrix Operations A = rand(10:20, 3, 3)


# 3x3 matrix with each value between 10 and 20 A = rand(10.:20, 3, 3) 
# Changing the range changes the type to Float64Instead of random values, we can provide a specific value using the fill method. x = fill(10.0, (3, ))A*x 
# this is the usual matrix-vector multiplication 
# of course, this requires a 'size match'### Transpose, Trace, DeterminantA'A' * AA'A      # shortcut ... typical with Julia tr(A)     # the trace of A using LinearAlgebradet(A)    # determinant needs the LinearAlgebra package inv(A)## Solving Linear Equations Directly A = rand(3, 3)xb = A*xA\b  # Solve for b ## More ... We can create n-dim arrays easily too. These tensors will come in handy when we get to machine learning.  rand(4, 3, 2, 5)More operations can be seen in the LinearAlgebra package. https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/

We will get to these if and when we need more. 