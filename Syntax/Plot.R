library("tidyverse")
library("lubridate")
library("zoo")

freq<-all_referrals %>% 
  count(Year) 

 
all_referrals_summary<-all_referrals%>% 
  filter(Hospital_Name=="University Hospital Galway") %>% 
  filter(Year>="2018-01-01") %>% 
  group_by(Year) %>% 
  summarise(TotalReferrals=sum(TotalReferrals)) %>% 
  ungroup()

# Basic line plot with points
plot<-ggplot(data=all_referrals_summary, aes(x=Year, y=TotalReferrals, group=1)) +
  geom_line()+
  scale_y_continuous(limits = c(0,NA))+
  scale_x_date(date_breaks = "3 months" , date_labels = "%b-%y")

print(plot)

