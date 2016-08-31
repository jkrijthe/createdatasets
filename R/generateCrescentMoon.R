#' Generate Crescent Moon dataset
#'
#' @param n Number of objects per class
#' @param sigma variance of the class
#' @examples
#' data<-generateCrescentMoon(150,1)
#' plot(data[,1],data[,2],col=data$Class,asp=1)
#' @export
generateCrescentMoon<-function(n=100,sigma=1) {
  
  x<-runif(n,0,pi)
  c1<-cbind(5*cos(x)-2.5+rnorm(n)*sigma,10*sin(x)-2.5+rnorm(n)*sigma)
  x<-runif(n,pi,2*pi)
  c2<-cbind(5*cos(x)+2.5+rnorm(n)*sigma,10*sin(x)+2.5+rnorm(n)*sigma)
  y<-factor(c(rep("1",n),rep("2",n)))
  
  data.frame(Class=y, rbind(c1,c2))
}


