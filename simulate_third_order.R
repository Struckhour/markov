BBF11threetrainer = read.csv("BBF113ordertrainer.csv", sep=",",row.names=1)

# seeding the first three songs in the sequence
NewSequence='F'
NewSequence[2]='D'
NewSequence[3]='A'
singingBoutLength <- 611

for(i in 3:singingBoutLength) {
    	
    prevone = NewSequence[i]    
    
    prevtwo = NewSequence[i-1]
    prevthree = NewSequence[i-2]
    comboprev = paste(prevthree, prevtwo, prevone, sep = '')
    
    NewSequence[i+1] = sample(colnames(BBF11threetrainer), size=1, prob=BBF11threetrainer[comboprev,])}



sequenceDF <- data.frame(NewSequence)  

for(j in 1:1000){
  for(i in 3:singingBoutLength) {
    
    prevone = NewSequence[i]    
    
    prevtwo = NewSequence[i-1]
    prevthree = NewSequence[i-2]
    comboprev = paste(prevthree, prevtwo, prevone, sep = '')
    
    NewSequence[i+1] = sample(colnames(BBF11threetrainer), size=1, prob=BBF11threetrainer[comboprev,])};
    sequenceDF<-cbind(sequenceDF,NewSequence)}

write.csv(sequenceDF, file = 'BBF113ordsims.csv')
