LV_CoMu <- function(t, y, p){
  N <- y
  with(as.list(p), {
       dN1.dt <- (r[1] * N[1])/K[1] * (K[1]- (N[1] + a[1] * N[2]*(1- N[1]/K[1] * N[2]/K[2])))
       dN2.dt <- (r[2] * N[2])/K[2] * (K[2]- (N[2] + a[2] * N[1]*(1- N[1]/K[1] * N[2]/K[2])))
       return(list(c(dN1.dt, dN2.dt)))})
}

 