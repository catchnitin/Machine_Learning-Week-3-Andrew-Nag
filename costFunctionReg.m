function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
% ====================== My code for Cost function ======================
H = sigmoid(X*theta);
T = y.*log(H) + (1 - y).*log(1 - H);
thetaf = theta(2:end).^2;
J1 = lambda / (2 * m)*sum(thetaf) ;
J2 = -1 / m*sum(T) ;
J = J1 + J2;

for i = 1 : m,
	grad = grad + (H(i) - y(i)) * X(i,:)';
end
temp = theta
temp(1)= 0;

gradold = 1/m*grad;
gradtemp = lambda / m * temp;
grad = gradold .+ gradtemp ;








% =============================================================

end
