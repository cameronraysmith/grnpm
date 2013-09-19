C = rand(3) + i*rand(3);
H = (C + ctranspose(C))/2
[V D]=eig(H)

