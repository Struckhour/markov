fourordtrainer=read.csv("fourordtrainer.csv", sep=",")
fourordtrainerdf <- data.frame(fourordtrainer, row.names = 1)	//makes the left column into names rather than values.

singingBoutLength <- 611
NewSequence='F'
NewSequence[2]='D'
NewSequence[3]='A'
NewSequence[4]='H'

for(i in 4:singingBoutLength) {
    prevone = NewSequence[i]    
    
    prevtwo = NewSequence[i-1]
    prevthree = NewSequence[i-2]
	prevfour = NewSequence[i-3]
    comboprev = paste(prevfour, prevthree, prevtwo, prevone, sep = '')
    
    NewSequence[i+1] = sample(colnames(fourordtrainerdf), size=1, prob=fourordtrainerdf[comboprev,])}



sequenceDF <- data.frame(NewSequence)  

for(j in 1:1000){
for(i in 4:singingBoutLength) {
    prevone = NewSequence[i]    
    
    prevtwo = NewSequence[i-1]
    prevthree = NewSequence[i-2]
	prevfour = NewSequence[i-3]
    comboprev = paste(prevfour, prevthree, prevtwo, prevone, sep = '')
    
    NewSequence[i+1] = sample(colnames(fourordtrainerdf), size=1, prob=fourordtrainerdf[comboprev,])}

 sequenceDF<-cbind(sequenceDF,NewSequence)}

write.csv(sequenceDF, file = 'fourordsims.csv')
