z = []
samples = 3;
rootsamples = sqrt(samples);

for i = 1:10000
  xs = stdnormal_rnd(samples,1);
  s = std(xs);
  t = rootsamples*mean(xs)/s;
  z(i) = t;
endfor
#z = randn(10000,1);
hold on;
[f,x] = hist(z,500);

#q = hist(z,30, 1);
#qs = sum(q);
dx = diff(x(1:2));
Area = dx * sum(f);
NewArea = dx* sum(f/Area)
bar(x,f/Area)
x=[-4:0.1:4];
plot (x,normpdf(x,0,1));
plot(x, tpdf(x,samples));
axis([-4,4])
hold off;