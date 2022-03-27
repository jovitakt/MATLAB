function c = cosine_rule (a,b,theta)
% {This function uses the law of cosines to compute the length of c, the third side of the triangle, given the lengths of the two other sides a and b, and the angle across it, theta, in degrees.}
c = sqrt (a^2 + b^2 - 2*a*b* cosd (theta));
end