ntok=read.csv("C:/Users/Dell/git/R_project/R_tem_project/NittetoKarla.csv")
ktom=read.csv("C:/Users/Dell/git/R_project/R_tem_project/KarlatoManipal.csv")
mtou=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Manipal to udupi.csv")
utokp=read.csv("C:/Users/Dell/git/R_project/R_tem_project/udupi_to_kapu.csv")
kptop=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Kapu_to_padubidri.csv")
ptob=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Padubidri_to_Belman.csv")
bton=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Belman to Nitte.csv")
ntob=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Nitte to Belman.csv")
btop=read.csv("C:/Users/Dell/git/R_project/R_tem_project/BelmantoPadubidri.csv")
ptokp=read.csv("C:/Users/Dell/git/R_project/R_tem_project/PadubidritoKapu.csv")
kptou=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Kapu_to_udupi.csv")
utom=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Kapu_to_udupi.csv")
mtok=read.csv("C:/Users/Dell/git/R_project/R_tem_project/Manipal to karkala.csv")
kton=read.csv("C:/Users/Dell/git/R_project/R_tem_project/karlatonitte24.csv")          # All CSV files are Invoked Here

btime = function (z = Sys.time(), bustime = ntok) {                      #  function to return time at the destination 
  #by taking time and dataframe as  argument
  z = format(z, format = "%H:%M")                                        #  converting into a format of hours:min
  c = 0                                                                  #  initializing count variable to 0
  j=0                                                                    #  Initializing j=0 which keeps track in which row i is
  t=r=format("00:00",format = "%H:%M")                                   #  training t and r to hold the values of time format
  for (i in bustime[[3]]) {                                              #  loop to take one bustime at a time to do linear search 
    #for a time which is just greater than the given time
    j=j+1                                                               # A int value to keep track of in which column the search is 
    #happening.It will come handy to take the name of the bus as 
    #well as the reaching time at the next stop
    if (c < 2) {                                                        # Since we are printing 2 bus we need to keep track of how many 
      #times its already printed
      if (i > z) {                                                      # Comparing the given time with the time taken form the data set 
        #at a respective loop
        t=i
        t=format(strptime(t,format="%H:%M"),format = "%I:%M")           #formatting t with the value of i to 12hr format
        cat("Available bus is", bustime[[1]][[j]], "AT:",t,"\n")           #printing the appropriate message
        
        c = c + 1
        if(c==1){
          r=bustime[[4]][[j]]                                         #keeping the reaching time of the first bus
        }
      }
      
    } else  break
  }
  if(c==0){
    cat("Your next bus is Tomorrow at : ",bustime[[3]][[1]],"\n")
    cat("Bus is :",bustime[[1]][[1]],"\n")
    cat("Your next bus is Tomorrow at : ",bustime[[3]][[2]],"\n")
    cat("Bus is :",bustime[[1]][[2]],"\n")
  }                                                                     #when no bus is available today
  return(r)                                                             #returning the reaching time
}

main = function() {
  l1 = list("Nitte",ntok,ntob)
  l2=list("Karkala",ktom,kton)
  l3=list("Manipal",mtou,mtok)
  l4=list("Udupi",utokp,utom)
  l5=list("Kapu",kptop,kptou)
  l6=list("Padubidri",ptob,ptokp)
  l7=list("Belman",bton,btop)
  x = array(c(l1,l2,l3,l4,l5,l6,l7),dim = c(3,7))                       #Creating the array of lists with name of the place and corresponding data set of that place
  btime()                                                               #Calling the function with default argument
  repeat {
    cat("From :\n1->Nitte\n2->Karkala\n3->Manipal\n4->Udupi\n5->Kapu\n6->Padubidri\n7->Belman\n8->Quit\n")
    obj1 = as.integer(readline())
    if(obj1==8)  break
    cat("To :\n1->Nitte\n2->Karkala\n3->Manipal\n4->Udupi\n5->Kapu\n6->Padubidri\n7->Belman\n8->Quit\n")
    obj2 = as.integer(readline())
    if(obj2==8)  break
    cat("Enter the time : ")
    z = strptime(readline(), format = "%H:%M")
    cat("Enter AM/PM :")
    f=readline()                                                                                        #taking all the inputs like form and to place and time with AM or PM
    if((f[[1]]=="PM"||f[[1]]=="Pm"||f[[1]]=="pm") && z<strptime("12:00",format="%H:%M")){
      z=z+43200
    }                                                                                                   
    else if(z>=strptime("12:00",format="%H:%M") && f[[1]]=="AM") z=z-43200              #if it is afternoon then we will convert it into 24hr pattern else if it is greater 
    #than or equal to 12:00 at morning conver it into 24 hr pattern
    if ((obj2 - obj1) >= 0) {
      i=obj1
      while (i < obj2) {
        print(x[1,i][[1]])
        z = btime(z, x[2,i][[1]])
        i = i + 1
        cat("\n")
      }
    }else{
      i=obj1
      while (i > obj2) {
        print(x[1,i][[1]])
        z = btime(z, x[3,i][[1]])
        i = i - 1
        cat("\n")
      }                                                                                 #if the d/f is positive go in usual way else in the opposite way
      
    }
    z=format(strptime(z,format("%H:%M")),format="%I:%M")
    cat("\nYou will reach the destnation at",z,"\n")
    cat("Have a nice Journey\n\n")
  }
}

main()
