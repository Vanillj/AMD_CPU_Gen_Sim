%change these
%# of simulations
sims = 10;
%# of generations
gens = 5;

% rest of the script
init = 1;
A = [1.23 1.25 1.2];
step = zeros(sims, gens + length(A) + 1);

for j = 1:sims
    step(j,1) = init;
    step(j,2) = step(j,1) * A(1);
    step(j,3) = step(j,2) * A(2);
    step(j,4) = step(j,3) * A(3);
    nyA = A;
    for i = 1:gens
        m = mean(nyA);
        d = std(nyA);
        
        r = -d + 2*d*rand(1);
        nyA(end + 1) = r + m;
        
        steps = i + 4;
        step(j, steps) = step(j, steps - 1) * nyA(end);
    end
end

n = size(step, 2);

avg = mean(step(:,:));

%plot and drawings
plot(1:n, step);
hold on
plot(1:n, avg , 'x', 'color', 'g');
plot(1 + length(A), step(1,1 + length(A)), 'o')
txt = '\leftarrow We are here.';
text(1 + length(A),step(1,1 + length(A)),txt)
xlabel('year')
ylabel('% growth')
title('simulation of the next N generations AMD CPUs')