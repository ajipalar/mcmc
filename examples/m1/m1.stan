data {
int<lower=1> N;
real y[N];
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model {
sigma ~ exponential(1);
mu ~ normal(0, 50);

for (i in 1:N) {
  y[i] ~ normal(mu, sigma);
};
}

generated quantities {
  real y_pp[N];
  for (i in 1:N) {
    y_pp[i] = normal_rng(mu, sigma); 
  }; 
}
