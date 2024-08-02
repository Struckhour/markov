# The following is for generating simulated sequences with 2nd-order Markov Dependence
BBF11twotrainer = read.csv("BBF112ordertrainer.csv", sep=",",row.names=1)

singingBoutLength <- 611

NewSequence='F'
NewSequence[2]='D'

for(i in 2:singingBoutLength) {
    prevone = NewSequence[i]    
    prevtwo = NewSequence[i-1]
    comboprev = paste(prevtwo, prevone, sep = '') 
    NewSequence[i+1] = sample(colnames(BBF11twotrainer), size=1, prob=BBF11twotrainer[comboprev,])}

sequenceDF <- data.frame(NewSequence)  

for(j in 1:1000){
    for(i in 2:singingBoutLength) {
        prevone = NewSequence[i]    
        prevtwo = NewSequence[i-1]
        comboprev = paste(prevtwo, prevone, sep = '')
        
        NewSequence[i+1] = sample(colnames(BBF11twotrainer), size=1, prob=BBF11twotrainer[comboprev,])};
    sequenceDF<-cbind(sequenceDF,NewSequence)}

write.csv(sequenceDF, file = 'BBF112ordsims.csv')
