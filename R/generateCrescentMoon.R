#' Generate Crescent Moon dataset
#'
#' @examples
#' data<-generateCrescentMoon(150,1)
#' plot(data[,1],data[,2],col=data$Class,asp=1)
generateCrescentMoon<-function(n=100,d=2,var=1) {
  
  if (d!=2) { stop("Crescent Moon dataset is currently only available in 2D")}
  x<-runif(n,0,pi)
  c1<-cbind(5*cos(x)-2.5+rnorm(n)*sigma,10*sin(x)-2.5+rnorm(n)*sigma)
  x<-runif(n,pi,2*pi)
  c2<-cbind(5*cos(x)+2.5+rnorm(n)*sigma,10*sin(x)+2.5+rnorm(n)*sigma)
  y<-factor(c(rep("1",n),rep("2",n)))
  
  data.frame(rbind(c1,c2),Class=y)
}


