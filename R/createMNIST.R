#' Create MNIST digit recognition dataset
#' 
#' Code heavily inspired by https://gist.github.com/brendano/39760
#' 
#' First 60000 is train set, last 10000 is test set.
#' 
#' formula(Class~.)
#' @export
createMNIST<-function(file=getfilepath("MNIST.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    con<-gzcon(url("http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz","rb"))
    data<-read_MNIST_bin_images(con)
    close(con)
    
    con<-gzcon(url("http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz","rb"))
    data<-rbind(data,read_MNIST_bin_images(con))
    close(con)
    
    con<-gzcon(url("http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz","rb"))
    y<-read_MNIST_bin_labels(con)
    close(con)
    
    con<-gzcon(url("http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz","rb"))
    y<-c(y,read_MNIST_bin_labels(con))
    close(con)
  
    data <- data.table(data, Class=factor(y))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}

read_MNIST_bin_images<-function(con) {
  readBin(con,'integer',n=1,size=4,endian='big')
  n <- readBin(con,'integer',n=1,size=4,endian='big')
  nrow <- readBin(con,'integer',n=1,size=4,endian='big')
  ncol <- readBin(con,'integer',n=1,size=4,endian='big')
  x <- readBin(con,'integer',n=n*nrow*ncol,size=1,signed=F)
  x <- matrix(x, ncol=nrow*ncol, byrow=T)
  x
}

read_MNIST_bin_labels<-function(con) {
  readBin(con,'integer',n=1,size=4,endian='big')
  n <- readBin(con,'integer',n=1,size=4,endian='big')
  y <- readBin(con,'integer',n=n,size=1,signed=F)
  y
}
# image(t(matrix(ret$x[23,],28,28)),asp=1)
