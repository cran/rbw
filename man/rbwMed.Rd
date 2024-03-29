% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rbwMed.R
\name{rbwMed}
\alias{rbwMed}
\title{Residual Balancing Weights for Causal Mediation Analysis}
\usage{
rbwMed(
  treatment,
  mediator,
  zmodels,
  data,
  baseline_x,
  interact = FALSE,
  base_weights,
  max_iter = 200,
  tol = 1e-04,
  print_level = 1
)
}
\arguments{
\item{treatment}{A symbol or character string for the treatment variable in \code{data}.}

\item{mediator}{A symbol or character string for the mediator variable in \code{data}.}

\item{zmodels}{A list of fitted \code{lm} or \code{glm} objects for
post-treatment confounders of the mediator-outcome relationship. If there's no
post-treatment confounder, set it to be \code{NULL}.}

\item{data}{A data frame containing all variables in the model.}

\item{baseline_x}{(Optional) An expression for a set of baseline confounders stored in \code{data} or
a character vector of the names of these variables.}

\item{interact}{A logical variable indicating whether baseline and post-treatment covariates
should be balanced against the treatment-mediator interaction term(s).}

\item{base_weights}{(Optional) A vector of base weights (or its name).}

\item{max_iter}{Maximum number of iterations for Newton's method in entropy minimization.}

\item{tol}{Tolerance parameter used to determine convergence in entropy minimization.
See documentation for \code{\link{eb2}}.}

\item{print_level}{The level of printing. See documentation for \code{\link{eb2}}.}
}
\value{
A list containing the results.
 \item{weights}{A vector of residual balancing weights.}
 \item{constraints}{A matrix of (linearly independent) residual balancing constraints}
 \item{eb_out}{Results from calling the \code{\link{eb2}} function}
 \item{call}{The matched call.}
}
\description{
\code{rbwMed} is a function that produces residual balancing weights for estimating
controlled direct/mediator effects in causal mediation analysis. The user supplies
a (optional) set of baseline confounders and a list of model objects for the conditional
mean of each post-treatment confounder given the treatment and baseline confounders.
The weights can be used to fit marginal structural models for the joint effects of the
treatment and a mediator on an outcome of interest.
}
\examples{
# models for post-treatment confounders
m1 <- lm(threatc ~ ally + trade + h1 + i1 + p1 + e1 + r1 +
  male + white + age + ed4 + democ, data = peace)

m2 <- lm(cost ~ ally + trade + h1 + i1 + p1 + e1 + r1 +
  male + white + age + ed4 + democ, data = peace)

m3 <- lm(successc ~ ally + trade + h1 + i1 + p1 + e1 + r1 +
  male + white + age + ed4 + democ, data = peace)

# residual balancing weights
rbwMed_fit <- rbwMed(treatment = democ, mediator = immoral,
  zmodels = list(m1, m2, m3), interact = TRUE,
  baseline_x = c(ally, trade, h1, i1, p1, e1, r1, male, white, age, ed4),
  data = peace)

# attach residual balancing weights to data
peace$rbw_cde <- rbwMed_fit$weights

# fit marginal structural model
if(require(survey)){
  rbw_design <- svydesign(ids = ~ 1, weights = ~ rbw_cde, data = peace)
  msm_rbwMed <- svyglm(strike ~ democ * immoral, design = rbw_design)
  summary(msm_rbwMed)
}
}
