#20/4/22 weds 
#빅데이터수업 - 완전 기초 코드 연습
1+1
10-13
print("문과도 R을 활용한 빅데이터 공부한다")

getwd()
setwd("c:/users/writer/desktop/r")
getwd()

A = "홍길동"
A <- "홍길동"
B <- c(1,2)
C = "배비라"
B <- c("배셀라","배리라")
str(B)
DF=data.frame(A,B,C)
edit(DF)

#row 행 / column = 열

m <- matrix(1:12,nrow=3)
m2<-matrix(1:12,ncol=3)
edit(m)
edit(m2)
arr = array(1:24,c(2,3,4)) 
edit(arr)

d1<-c(1,2,3,4)
d2<-c("사과","바나나","오렌지","수박")
d3<-c(5,6,7,8)
df<-data.frame(d1,d2,d3)
edit(df)
df
d4=c("가","나","다","라")
df=data.frame(df,d4)
df
str(df)

df$d2=as.character(df$d2)
df$d4=as.character(df$d4)

# = <- 쓸때 뛰어쓰기 안해도 되는듯. =과 <-는 같이 사용가능한 듯

Sys.time()
data1 = as.Date(c("2020-04-01","2020-04-11"))
str(data1)
data1
edit(data1)
data1[2]-data1[1]

date2 <- as.Date("2020-04-01")
date3 <- as.Date("2020-04-11")
date3 - date2



# library(lubridate) :연 월 일 분할 _패키지

library(lubridate)
install.packages("lubridate")
y=lubridate::year(data1[1])

y2=lubridate::year(date2)
m=lubridate::month(data1[2])
d=lubridate::day(data1[2])

#베이커리 매출 데이터(엑셀 csv 파일) -> r 로 데이터 변형시켜보기

## 1. 현재 작업공간 확인하기
getwd()
setwd("c:/users/writer/desktop/r")

## 2. 데이터 불러오기 
### 엑셀의변수명을 첫번째 열에서 제외하려면 header = T / 첫번째 열에 포함시켜 데이터로 인식하려면 header= F)
### stirngASFactors = F 는 팩터를 받는것을 거짓으로 판단한다는 뜻, 즉 character 로 받게 된다.- 여기선 날짜 데이터를 캐릭터로 받아서 변형하기 위해 사용. 
bakery <-read.csv("bakery1.csv", header = T, stringsAsFactors = F)
bakery
str(bakery)

## 3.데이터변형 - 변수 추가하기 (날짜를 연월일로 쪼개기)
### $ 는 데이터 안의 변수를 나타냄 : bakery$date 는 베이커리데이터 안에 date라는 변수 의미.
### 또는 새로운 변수와 데이터를 동시에 추가하고 싶을때도 사용 가능 : bakery$sex <- female 없던 sex변수에 없던 female 값 생김 
### 먼저, 캐릭터로 되어있는 기존데이터의 날짜를 date로 읽어줌

bakery$date = as.Date(bakery$date)
bakery$year=lubridate::year(bakery$date)
bakery$month=lubridate::month(bakery$date)
bakery$day=lubridate::day(bakery$date)
bakery$weak=weekdays(bakery$date)


### 프로모션은 다시 factor로 변경해줌
bakery$promotion=as.factor(bakery$promotion)


