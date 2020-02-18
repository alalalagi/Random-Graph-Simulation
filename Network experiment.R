#This is a simulation of Graph theory

#---------------------------------------------------------------------
count_max = function(n,bondnum){ #回傳最大串包含多少個nodes
  #n=10
  #bondnum = 20
  connect = matrix(0,nrow = n,ncol = n) #create a bonding matrix of 0s
  totalbdnum = n*(n-1)/2
  bond = sample(totalbdnum,bondnum) #隨機產出bondnum個bond,不重複
  
  bondcount = 1
  chains = list()
  #根據亂數產出bond,順便把同一堆的加成一坨called chains
  for (i in c(2:n)){
    for (j in c(1:(i-1))){ #i,j是針對bond matrix,共Cn取2個
      if(bondcount %in% bond){
        connect[i,j] = 1
        if(length(chains) == 0) chains = list(c(i,j))
        find = 0
        for (k in c(1:length(chains))){ #檢查i,j在哪個list
          if(i %in% chains[[k]]){
            if(!(j %in% chains[[k]])) chains[[k]] = append(chains[[k]],j) #i在j不在
            find = 1
            break
          }
          else if(j %in% chains[[k]]){
            if(!(i %in% chains[[k]])) chains[[k]] = append(chains[[k]],i) #j在i不在
            find = 1
            break
          }
        }
        if(find == 0){ #j,j都沒有在任何鍊子也就是新的東西
          chains = c(chains,list(c(i,j)))
        }
      }
      bondcount = bondcount + 1
      #print(bondcount)
    }
  }
  #return(chains)
  return(max(lengths(chains))) #隨手抓，最大把
}

#newy = count_max(30,20)
#newy
#newy[[1]][1]

#Main-----------------------------------------------------------------
par(mfrow = c(3,2))
nums = c(10,30,60,90,120,150)
for(n in nums){
  bdnum = 4*n
  x = numeric(bdnum)
  y = numeric(bdnum)
  for (i in c(1:bdnum)){ #現在一次實驗還沒有做很多次(有var)
    x[i] = i/n
    y[i] = count_max(n,i)/n
  }
  plot(x,y,
       xlab = "# of total bonds / # of nodes",ylab = "% of nodes in largest chain",
       main = paste0("n = ",n),
       col = 1)
}
