library("rstan")
library("ggplot2")
library("StanHeaders")
library("jsonlite")

rstan_options(auto_write=TRUE)
stan_data <- fromJSON("examples/m1/data.json")
fit <- stan(file = "examples/m1/m1.stan",
	    data=stan_data, verbose=TRUE, model_name="m1")
