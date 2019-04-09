######choose the csv file########

plate<-read.table(file.choose(),header=T,dec=",", sep=";")
plate

str(plate)

plate$X..<-NULL
plate

######define Cpos amd Cneg cells#

a<- readline(prompt="Enter row of pos control: ")
b<- readline(prompt="Enter column of pos control: ")
c<- readline(prompt="Enter row of neg control: ")
d<- readline(prompt="Enter column of neg control: ")

pos<-plate[a,b]
pos

neg<-plate[c,d]
neg

v<-pos/neg
v  

if(v<0.4){
  print("Low positive Control optical density")
} else{
  print("positive Control optical density ok")
}

if(v>3){
  print("Validity ok")
} else{
  print("No validity")
}


r40=(0.4*(pos-neg))+neg
r40

r30=(0.3*(pos-neg))+neg
r30

plate[plate<r30] = "-"
plate
plate[plate>r40] = "+"
plate

View(plate)

