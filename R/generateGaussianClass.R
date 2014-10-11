#' Create Classification problem with gaussian classes
#' 
#' Task: formula(Class~.)
#' 
#' @examples
#' d<-createGaussianClass(n=100,var=0.1)
#' plot(d$V1,d$V2,col=d$Class,asp=1)
#' @export
generateGaussianClass<-function(n=100, d=2, var=1) {
  require(MASS)
  X<-rbind(mvrnorm(n/2,rep(-1,d),diag(rep(var,d))),mvrnorm(n/2,rep(1,d),diag(rep(var,d))))
#   X<-rbind(rep(-1,d)+rmvt(n/2,diag(rep(var,d)),df=2),rep(1,d)+rmvt(n/2,diag(rep(var,d)),df=2))
# TODO:Gamma distribution
  y<-factor(c(rep(1,n/2),rep(2,n/2)))

  return(data.table(X,Class=y))
}
