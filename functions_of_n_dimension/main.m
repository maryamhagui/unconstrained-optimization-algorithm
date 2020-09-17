close all;
max_iter = 5000; % when reach to end of loop, evoke error
epsilon = 0.0001;  % for terminating condition
syms x y;
%my frist function 
%f = symfun((x + 10).^2 + (y + 10).^2 + exp(-x.^2 - y.^2), [x y]);
%my second function 
f = symfun((100000 * x.^2) + y.^2 + - (x.^2 + y.^2).^2 + (10^-5) * (x.^2 + y.^2 ) .^4, [x y]);

f_gradient = gradient(f);%calculate the gradient
f_hessian = hessian(f, [x y]);%calculate l'hussien

%point = [-12 16]; % initial point
point = -20 + (20 + 20) * rand(1,2); % random initial point

%[step_size,min_point, output, time, iter] = gradient_descent(f, f_gradient, point, epsilon, max_iter);
%fprintf(' Gradient Descent - It takes %fsec to generate minimum [%f] in (x,y)  = (%f,%f) for %d iter (xx,yy)=(%f,%f)  steeep size %f \n', time, output, min_point(1), min_point(2), iter,point(1),point(2),step_size);

%[min_point, output, time, iter] = newton_method(f, f_gradient, f_hessian, point, epsilon, max_iter);
%fprintf(' Newton - It takes %fsec to generate minimum [%f] in (x,y) = (%f,%f) for %d iter (xx,yy)=(%f,%f) \n', time, output, min_point(1), min_point(2), iter,point(1),point(2));

[step_size,min_point, output, time, iter] = quasi_newton_sr1_method(f, f_gradient, point, epsilon, max_iter);
fprintf('3. Quasi Newton''s SR1 Method - It takes %fsec to generate minimum [%f] in (x,y) = (%f,%f) for %d iter   (xx,yy)=(%f,%f)   step_size %f \n', time, output, min_point(1), min_point(2), iter ,point(1),point(2),step_size);

%[step_size,min_point, output, time, iter] = quasi_newton_bfgs_method(f, f_gradient, point, epsilon, max_iter);
%fprintf('4. Quasi Newton''s BFGS Method - It takes %fsec to generate minimum [%f] in (x,y) = (%f,%f) for %d iter (xx,yy)=(%f,%f) %f \n', time, output, min_point(1), min_point(2), iter,point(1),point(2),step_size);