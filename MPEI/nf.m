x  = 1:6
px = 1/6*ones(1,6)
medx = x*px'
Xelevado2 = sum(x.^2 .* px)
varX = Xelevado2 - medx^2
