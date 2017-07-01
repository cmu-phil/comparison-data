library("MASS");
library("pcalg");
   
path<-"/Users/user/tetrad/comparison-final";
simulation<-1;
     
subdir<-"pc.solve.confl.TRUE";
dir.create(paste(path, "/save/", simulation, "/", subdir, sep=""));

for (i in 1:10) {
    data<-read.table(paste(path, "/save/", simulation, "/data/data.", i, ".txt", sep=""), header=TRUE)
    n<-nrow(data)
    C<-cor(data)
    v<-names(data)
    suffStat<-list(C = C, n=n)
    pc.fit<-pc(suffStat=suffStat, indepTest=gaussCItest, alpha=0.001, labels=v,
                                   solve.conf=TRUE)
    A<-as(pc.fit, "amat")
    name<-paste(path, "/save/", simulation, "/", subdir, "/graph.", i, ".txt", sep="")
    print(name)
    write.matrix(A, file=name, sep="\t")
}