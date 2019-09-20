tvals = []
m = []
samples = 5;
rootsamples = sqrt(samples);

for i = 1:10000
  xs = stdnormal_rnd(samples,1);
  s = std(xs);
  t = rootsamples*mean(xs)/s;
  tvals(i) = t;
  m(i) = mean(xs);
endfor

hold on;
[f,x] = hist(tvals,500);

[fm,xm] = hist(m,50);

# ---- distribution of  the sample means

dxm = diff(xm(1:2));
AreaM = dxm * sum(fm)
bar(xm,fm/AreaM)

# ---- distribution of t values

dx = diff(x(1:2));
Area = dx * sum(f);
bar(x,f/Area);

# ----- t-distirubtion and normal distribution

x=[-4:0.1:4];
plot (x,normpdf(x,0,1));
plot(x, tpdf(x,samples));
axis([-4,4])
hold off;