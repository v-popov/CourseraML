function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X,1)

for obs_ind = 1:m
    min_dist = inf;
    opt_cent = -1;
    for cent_ind = 1:K
        sq_dist = sum((X(obs_ind,:) - centroids(cent_ind,:)) .^ 2);
        if sq_dist < min_dist
            min_dist = sq_dist;
            opt_cent = cent_ind;
        end
    end
    idx(obs_ind) = opt_cent;
end



% =============================================================

end

