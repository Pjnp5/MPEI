[users,Set] = createSet("u.data");

signatures = minHash(Set);

threshold = 0.4;
minHashSimilars(users,signatures,threshold);
