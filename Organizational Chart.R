library(networkD3)
library(jsonlite)
library(htmlwidgets)

library(magrittr)

##--read data

df <- read.csv('C:/Users/yipinl/Desktop/ORG/HR Analytics 7.27.csv', stringsAsFactors=FALSE)
df <- df[,c("ï..Company.Hired" ,"Name","Team.Leader.Name" )]

##--rename columns
colnames(df)[colnames(df) == "ï..Company.Hired"] <-  "Company Hired"
colnames(df)[colnames(df) == "Team.Leader.Name"] <-  "Team Leader Name"

##-- conduct subset
team_leader = "AD"
df3 <- df[which(df$`Team Leader Name` == team_leader),]

df3<- read.csv("C:/Users/yipinl/Desktop/Final Presentation/ORG_demo.csv")
colnames(df3)[colnames(df3) == "Company.Hired"] <-  "Company Hired"
colnames(df3)[colnames(df3) == "Team.Leader.Name"] <-  "Team Leader Name"

df3$merge <- paste(df3$`Company Hired`,df3$Name, sep = "_")
list1 <- list(name = team_leader, children = list())
set1 <- unique(df3$`Company Hired`)
set2 <- unique(df3$merge)


for (i in 1: length(set1)){
  temp_list1 = list(name = set1[i], children = list())
  for (j in 1: length(set2)){
    list2 <- unlist(strsplit(set2[j], "_"))
    if (set1[i] == list2[1]){
      temp_list2 = list(list(name = list2[2]))
      temp_list1$children <- append(temp_list1$children,temp_list2)
    }
  }
  list1$children <- append(list1$children,list(temp_list1))
}

radialNetwork(List = list1, fontSize = 25, opacity = 0.9)%>%
  saveNetwork(file = 'C:/Users/yipinl/Desktop/ORG/output/Net1.html')
diagonalNetwork(List = list1, fontSize = 20, opacity = 0.9, linkColour = "#ccc", nodeColour = "#fff",margin = 100)%>%
  saveNetwork(file = 'C:/Users/yipinl/Desktop/ORG/output/Net2.html')


