function val = leiPoisson (lambda, k)
%valor que acontece em média -> lambda
%valor que pretendemos que aconteça -> k
  val = (lambda.^k / factorial(k)) * exp(-lambda);
end
