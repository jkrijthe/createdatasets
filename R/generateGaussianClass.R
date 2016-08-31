#' Create Classification problem with gaussian classes
#' 
#' Task: formula(Class~.)
#' 
#' @param n Number of objects
#' @param var variance of the class
#' @param d Number of features
#' 
#' @examples
#' df <- generateGaussianClass(n=100,d=2,var=0.1)
#' plot(df$V1,df$V2,col=df$Class,asp=1)
#' @export
generateGaussianClass<-function(n=100, d=2, var=1) {
  
  X<-rbind(mvrnorm(n/2,rep(-1,d),diag(rep(var,d))),mvrnorm(n/2,rep(1,d),diag(rep(var,d))))
#   X<-rbind(rep(-1,d)+rmvt(n/2,diag(rep(var,d)),df=2),rep(1,d)+rmvt(n/2,diag(rep(var,d)),df=2))
# TODO:Gamma distribution
  y<-factor(c(rep(1,n/2),rep(2,n/2)))

  return(data.table(Class=y,X))
}
