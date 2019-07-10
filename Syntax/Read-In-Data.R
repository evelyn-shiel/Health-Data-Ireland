library("readr")
library("tidyverse")

ref_2015<-read.csv("Data/general-referrals-by-hospital-department-2015.csv")
ref_2016<-read.csv("Data/general-referrals-by-hospital-department-2016.csv")
ref_2017<-read.csv("Data/general-referrals-by-hospital-department-2017.csv")
ref_2018<-read.csv("Data/general-referrals-by-hospital-department-2018.csv")
ref_2019<-read.csv("Data/general-referrals-by-hospital-department-2019.csv")

names(ref_2018)<-names(ref_2019)

ref_2015<-ref_2015 %>% 
  mutate(Year=as.Date(paste0('1-', factor(Month_Year)), '%d-%b-%y'))

ref_2016<-ref_2016 %>% 
  mutate(Year=as.Date(paste0('1-', factor(Month_Year)), '%d-%b-%y'))

ref_2017<-ref_2017 %>% 
  mutate(Year=as.Date(paste0('1-', factor(Month_Year)), '%d-%b-%Y'))

ref_2018<-ref_2018 %>% 
  mutate(Year=as.Date(paste0('1-', factor(Month_Year)), '%d-%b-%Y'))

ref_2019<-ref_2019 %>% 
  mutate(Year=as.Date(paste0('1-', factor(Month_Year)), '%d-%b-%Y'))

HDG<-as_tibble(read.csv("Data/Hospital-Department-Groups.csv"))




all_referrals<-as_tibble(rbind(ref_2015,ref_2016,ref_2017,ref_2018,ref_2019))

rm(ref_2015,ref_2016,ref_2017,ref_2018,ref_2019)

all_referrals<-all_referrals %>% 
  left_join(HDG, by="Hospital_Department")

write.csv(all_referrals,"Data/All-Referrals.csv")


