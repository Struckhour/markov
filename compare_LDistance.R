# compare 1-grams (aka frequency of each song) between two sequences.
BBF11monotest = read.csv("BBF11monotest.csv", sep=",") 
testsettemp <- onegramdf

for(k in 1:612){ 
    j = paste0(BBF11monotest[k,1]);  
    testsettemp[j,1] = testsettemp[j,1] + 1
    }
testsettemp[,1] = testsettemp[,1]/612 
Ldistance = 0 

for(i in 1:1000)  
{
    Simtemp <- onegramdf 
    Sequence <- sequenceDF[,i] 

    for(k in 1:612){  
        j = paste0(Sequence[k]); 
        Simtemp[j,1] = Simtemp[j,1] + 1; 
    } 
    div <- Simtemp[,1]/612
    Ldistance[i] = sum(abs(testsettemp[,1]-div))  
}
write.csv(Ldistance, file = 'monogramLdistance.csv') 


# Code for comparing frequencies of 7-grams between two sequences. Can be easily adjusted for 1-6 grams. 

BBF11seventest=read.csv("BBF11seventest.csv", sep=",")

testsettemp <- sevengramdf 
for(k in 1:600){ 
    j = paste0(BBF11seventest[k,1], BBF11seventest[k,2], BBF11seventest[k,3], BBF11seventest[k,4], BBF11seventest[k,5], BBF11seventest[k,6], BBF11seventest[k,7]);  
    testsettemp[j,1] = testsettemp[j,1] + 1
    } 
testsettemp[,1] = testsettemp[,1]/600

start_time <- Sys.time() 
Ldistance = 0 

for(i in 1:1)  
{
    Simtemp <- sevengramdf 
    Sequence <- sequenceDF[,i] 
    for(k in 1:606){  
        j = paste0(Sequence[k], Sequence[k+1], Sequence[k+2], Sequence[k+3], Sequence[k+4], Sequence[k+5], Sequence[k+6]); 
        Simtemp[j,1] = Simtemp[j,1] + 1; 
    } 

    div <- Simtemp[,1]/606
    Ldistance[i] = sum(abs(testsettemp[,1]-div)) 
}

write.csv(Ldistance, file = 'sevengramLdistance.csv')
end_time <- Sys.time()
end_time - start_time 
