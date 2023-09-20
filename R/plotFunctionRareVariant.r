makeOnePlot<-function(xAxis, data1, data2, selectedRows1, selectedRows2, columnIndexes, xLab, yLab, yFirst, yLast, xLabels, title, offset)
{

colors<-c("blue", "green", "cyan", "cyan", "purple",  "red", "green", "green","green", "red", "cyan", "black", "pink", "brown", "violet", "black", "brown", "green", "blue", "green", "aquamarine", "brown", "green", "violet", "violet")

hea<-c("Yate", "Yate1", "YateProp", "YateProp1", "Laplace1", "Laplace2", "Grouping", "singleTDT", "exactTDT", "exactPropTDT", "propTDTWithHomo", "TDTminFreq10", "propTDTminFreq10", "propTDTWithHomominFreq10", "EntTDT", "LC", "SR",
"green", "blue", "green", "aquamarine", "brown", "green", "permEntTDT", "permEntTDT") # from 19 to 28

ltyA<-c(1,2,3,4,5,6, 1, 3,2, 1,1,2,3,4, 6, 8, 4, 1,2,3,4,5,6, 5, 5)
pchA<-c(1,2,3,4,5,6, 21, 22,23, 21, 1,2,3,4, 10, 25, 24, 1,2,3,4,5,6, 10, 10)
cexA<-c(1,2,3,4,5,6, 2, 2,2, 2, 1,2,3,4, 2, 2, 2, 1,2,3,4,5,6, 2, 2)




#lines(x, data[first:second, offset+9*4], type="b", lty=5, pch=10, cex=2, col="violet")#entropy TDT
#lines(x, data[first:second, offset+16*4], type="b", pch=21, cex=2, lty=1, col="red")# grouping TDT
#lines(x, data[first:second, offset+17*4], type="b", pch=22, lty=3, cex=2, col="green")#single TDT
#lines(x, data[first:second, offset+18*4], type="b", pch=23, cex=2, lty=2, col="blue")#exact TDT
#lines(x, data[first:second, offset+0*4], type="b", pch=24, cex=2, lty=4, col="brown")#similarity
#lines(x, data[first:second, offset+1*4], type="b", pch=25, cex=2, lty=6, col="black")#rank test wilcoxon



selectedData1<-c(1:length(selectedRows1))
selectedData2<-c(1:length(selectedRows2))


for (i in 1:length(selectedRows1))
selectedData1[i]=data1[selectedRows1[i],columnIndexes[1]*4+offset+1]




    plot(xAxis, selectedData1, type="l", main=title, col="white",xlab=xLab, ylab=yLab, ylim=c(yFirst,yLast), axes=FALSE) #, 

    axis(1, at=xAxis, lwd=1, labels=xLabels, tick=TRUE, outer=FALSE)
    axis(2, at=yAxis, lwd=1, labels=yAxis, tick=TRUE, outer=FALSE)


   # colorIndex=0;
    for (columnIndex in columnIndexes){        
        #browser()


for (i in 1:length(selectedRows1))
selectedData1[i]=data1[selectedRows1[i],columnIndex*4+offset+1]

for (i in 1:length(selectedRows2))
selectedData2[i]=data2[selectedRows2[i],columnIndex*4+offset+1]


write(selectedData1,"")
write(selectedData2,"")




# lines(xAxis, selectedData, type="b", col=colors[columnIndex+1])# hetero in samples with also homo

write (ltyA[columnIndex+1],"")
write (pchA[columnIndex+1],"")
write (cexA[columnIndex+1],"")
write (colors[columnIndex+1],"")


lines(xAxis, selectedData1, type="l",col=colors[columnIndex+1])#single TDT
lines(xAxis, selectedData2, type="b",  pch=23, lty=1, cex=2,col=colors[columnIndex+1]) # hetero in samples with also homo
    
#lty=ltyA[columnIndex+1]  ) #
}

}



