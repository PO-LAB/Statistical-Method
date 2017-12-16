#========================================================================
# Regression ============================================================

require(datasets)    #載入資料集
str(cars)            #確認資料結構
head(cars)           #查看cars前六筆資料
summary(cars)        #查看資料分布
plot(x=cars$speed,   #將X資料放cars中的speed
     y=cars$dist,    #將Y資料放cars中的dist
     pch=7,          #點的樣式挑選7號
     col=9)          #顏色挑選9號
boxplot(cars,        #將資料放cars
        col=5:6)     #顏色挑選5號與6號

regression <- lm(cars$dist~cars$speed , #以dist作為應變數(Y)，以speed作為自變數(X)
                         data = cars)   #資料為cars
summary(regression)
#========================================================================
# Decision tree =========================================================
HRdata <- read.csv('C:/Users/User/Desktop/R/hr.csv') #讀取資料，並且命名為HRdata
str(HRdata)                                          #觀察資料型態
summary(HRdata)                   #觀察資料分布
install.packages("rpart")         #安裝rpart套件
require(rpart)                    #載入rpart套件
HR.model <- rpart(left~. ,        #將left放入應變數(Y)並且將其餘變數放入自變數(X)，並且建立在HR.model裡
                  data = HRdata)  #資料取自於HRdata
install.packages("partykit")      #安裝partykit套件
require(partykit)                 #載入partykit套件
HR.tree <- as.party(HR.model)     #將HR.model轉換為樹的型態
plot(HR.tree)                     #畫出HR.tree
#========================================================================