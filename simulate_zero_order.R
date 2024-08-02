
# the zero-order table produces simulations based on overall frequency of each song in the singing bout. Read in whatever order of pivot table is required.
zerotable = read.csv("zerotable.csv", sep=",",row.names=1) 
# create newSequence and put 'F' in it 
newSequence = 'F'      

# in this case the length of the singing bout is 611. Change as needed.
length_of_bout = 611
for(i in 1:length_of_bout) 
{prev=newSequence[i] 
newSequence[i+1] = sample(colnames(zerotable), size=1, prob=zerotable[prev,])};  

sequenceDF <- data.frame(newSequence)    

for(j in 1:1000){ 
for(i in 1:length_of_bout) 
{prev=newSequence[i] 
newSequence[i+1] = sample(colnames(zerotable), size=1, prob=zerotable[prev,])}; 
sequenceDF <-cbind(sequenceDF,newSequence)} 

write.csv(sequenceDF, file = 'zerosims.csv')

