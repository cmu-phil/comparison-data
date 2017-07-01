library("MASS");
library("pcalg");
   
path<-"/Users/user/tetrad/comparison-final";
simulation<-1;
     
subdir<-"bnlearn.mmhc";
dir.create(paste(path, "/save/", simulation, "/", subdir, sep=""));

for (i in 1:10) {
    data<-read.table(paste(path, "/save/", simulation, "/data/data.", i, ".txt", sep=""), header=TRUE)

    bn <- mmhc(data, alpha = 0.001)

    name<-paste(path, "/save/", simulation, "/", subdir, "/graph.", i, ".txt", sep="")
    print(name)
    write.matrix(bn$arcs, file=name, sep="\t")
}