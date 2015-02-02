using KDtree

dims = 3
n_points = [10^i for i in 3:6]
ks = [1, 3, 10, 50, 100, 500]

times = Array(Float64, length(ks), length(n_points))

# Compile it
tree = KDTree(randn(2,2))
k_nearest_neighbours(tree, zeros(2), 1)


i = 0
for k in ks
    j = 0
    i+=1
    for n_point in n_points
        j+=1
        data = randn(dims, n_point)
        tree = KDTree(data)
        times[i,j]  = @elapsed k_nearest_neighbour(tree, zeros(dims), k)
    end
end


#=
2015-02-02:
[2.3015e-5 2.1771e-5 7.0288e-5 6.0958e-5
 2.7368e-5 3.5143e-5 8.957e-5 7.7752e-5
 6.0647e-5 5.0072e-5 0.000104499 0.000111029
 0.000194691 0.000216772 0.000293591 0.000318472
 0.000385027 0.000359835 0.000650316 0.000582517
 0.003119404 0.005313561 0.006453713 0.006805152]
 =#
