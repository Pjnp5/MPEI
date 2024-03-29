function signatures = minHash (Set)
  
  nS = length(Set);  %Total ammount of Set elements
  nHash = 100;       %Total ammount of Hash Functions we'll usejava
  prime = 113;    %High prime number, used in our Hash Function
  aVals = randi([1, (prime-1)], 1, nHash);
  bVals = randi([1, (prime-1)], 1, nHash);
  
  signatures = zeros(nHash, nS); %Each Row -> A Set entry ; Each Col -> Hashing of That Set's Entry
  
  h = waitbar(0,'Calculating');
  
  for i = 1 : nS
    waitbar(i/nS, h);
    for j = 1 : nHash
      hK = zeros(length(Set(i)));
      for k = 1 : length(Set(i))
        hK(k) = mod(31 * h + Set{i}, 2^32 -1) ;
        hK(k) = mod(aVals(j) * Set{i}(k) + bVals(j), prime)
      end
      signatures(j, i) = min(hK);
    end
  end

  imagesc(signatures)

  delete (h)
  
  
end