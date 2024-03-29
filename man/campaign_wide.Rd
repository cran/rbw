% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{campaign_wide}
\alias{campaign_wide}
\title{Wide-format Data on Negative Campaign Advertising in US Senate and Gubernatorial Elections}
\format{
A data frame with 113 rows and 26 columns: \describe{
  \item{demName}{name of the Democratic candidate}
  \item{camp.length}{length of the candidate's campaign (in weeks)}
  \item{deminc}{whether the candidate was an incumbent.}
  \item{base.poll}{Democratic share in the baseline polls}
  \item{base.und}{share of undecided voters in the baseline polls}
  \item{office}{type of office in contest. 0: governor; 1: senator}
  \item{demprcnt}{Democratic share of the two-party vote in the election}
  \item{year}{year of the election}
  \item{state}{state of the election}
  \item{id}{candidate id}
  \item{dem.polls_1}{Democratic share in week 1 polls}
  \item{dem.polls_2}{Democratic share in week 2 polls}
  \item{dem.polls_3}{Democratic share in week 3 polls}
  \item{dem.polls_4}{Democratic share in week 4 polls}
  \item{dem.polls_5}{Democratic share in week 5 polls}
  \item{d.gone.neg_1}{whether the candidate went negative in week 1}
  \item{d.gone.neg_2}{whether the candidate went negative in week 2}
  \item{d.gone.neg_3}{whether the candidate went negative in week 3}
  \item{d.gone.neg_4}{whether the candidate went negative in week 4}
  \item{d.gone.neg_5}{whether the candidate went negative in week 5}
  \item{neg.dem_1}{the proportion of advertisements that were negative in week 1 polls}
  \item{neg.dem_2}{the proportion of advertisements that were negative in week 2 polls}
  \item{neg.dem_3}{the proportion of advertisements that were negative in week 3 polls}
  \item{neg.dem_4}{the proportion of advertisements that were negative in week 4 polls}
  \item{neg.dem_5}{the proportion of advertisements that were negative in week 5 polls}
  \item{undother_1}{share of undecided voters in week 1 polls}
  \item{undother_2}{share of undecided voters in week 2 polls}
  \item{undother_3}{share of undecided voters in week 3 polls}
  \item{undother_4}{share of undecided voters in week 4 polls}
  \item{undother_5}{share of undecided voters in week 5 polls}
  \item{cum_neg}{the total number of campaign-weeks in which a candidate went negative}
  \item{ave_neg}{the average proportion of advertisements that were negative over the final five weeks of the campaign multiplied by ten}
  }
}
\usage{
campaign_wide
}
\description{
A dataset containing 32 variables and 113 unit records from Blackwell (2013).
}
\references{
Blackwell, Matthew. 2013. A Framework for Dynamic Causal Inference in
  Political Science. American Journal of Political Science 57(2): 504-619.
}
\keyword{datasets}
