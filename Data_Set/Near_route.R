ntok = read.csv("~/R_project/bus24.csv")
ktou = read.csv("~/R_project/karlatoudp24.csv")
ntop = read.csv("~/R_project/Nitte to Padubidri.csv")
ptou =read.csv("~/R_project/Padubidri to udupi.csv")
#finding the difference in seconds from(NITTE---KARKALA)
halfdis_nk=ntok
from1=halfdis_nk[[3]][[1]]
to1=halfdis_nk[[4]][[1]]
val1=as.numeric(as.difftime(c(from1),format="%H:%M",units = "secs"))
val2=as.numeric(as.difftime(c(to1),format="%H:%M",units = "secs"))
result1=val2-val1
print(result1)
              #(NITTE---KARLALA  OVER)


#finding the difference in seconds from(KARKALA---UDUPI)
anhalfdis_ku=ktou
from1=anhalfdis_ku[[3]][[1]]
to1=anhalfdis_ku[[4]][[1]]
val1=as.numeric(as.difftime(c(from1),format="%H:%M",units = "secs"))
val2=as.numeric(as.difftime(c(to1),format="%H:%M",units = "secs"))
result2=val2-val1
print(result2)
            #(KARLALA---UDUPI  OVER)

 #total time required to move from nitte to udupi(KARKALA) in seconds
total1=result1+result2 
print(total1)
                     
# ONE WAY OF ROUTE COMPLETED

#finding the time difference in seconds from(NITTE---PADUBIDRE)
halfdis_np=ntop
from1=halfdis_np[[3]][[1]]
to1=halfdis_np[[4]][[1]]
val1=as.numeric(as.difftime(c(from1),format="%H:%M",units = "secs"))
val2=as.numeric(as.difftime(c(to1),format="%H:%M",units = "secs"))
result3=val2-val1
print(result3)
              #(NITTE---PADUBIDRE  OVER)

#finding the time difference in seconds from(PADUBIDRE----UDUPI)
halfdis_pu=ptou
from1=halfdis_pu[[3]][[1]]
to1=halfdis_pu[[4]][[1]]
val1=as.numeric(as.difftime(c(from1),format="%H:%M",units = "secs"))
val2=as.numeric(as.difftime(c(to1),format="%H:%M",units = "secs"))
result4=val2-val1
print(result4)
             #(PADUBIDRE----UDUPI  OVER)


#total time required to move from nitte to udupi(PADUBIDRE) in seconds
total2=result3+result4
print(total2)
           # SECOND WAY OF ROUTE COMPLETED

near_route=function(t1,t2)
{
    if(t1>t2)
    {
      cat("Near distance is from Nitt to Udupi is through PADUBIDRE")
    }
  else
  {
    cat("Near distance is from Nitt to Udupi is through KARKALA")
  }
  
}
near_route(total1,total2)





