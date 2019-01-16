function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

options = [0.01 0.03 0.1 0.3 1 3 10 30];
error_max = inf;

C_opt = options(1);
sigma_opt = options(1);

for ind_C = 1:size(options,2)
    for ind_sigma = 1:size(options,2)
        model = svmTrain(X, y, options(ind_C), @(x1, x2) gaussianKernel(x1, x2, options(ind_sigma)));
        pred = svmPredict(model, Xval);
        error_new = mean(double(pred ~= yval));
        if error_new < error_max
            error_max = error_new;
            C_opt = options(ind_C);
            sigma_opt = options(ind_sigma);
        end
    end
end

C = C_opt;
sigma = sigma_opt;

% =========================================================================

end
