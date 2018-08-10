floor=c("二十二層","五層","二十八層","二十二層","三層","十六層","二十四層","十一層","層","十五層","十五層","七層")
floor = gsub("層","",floor)
unlist(lapply(floor,function(x){numberTrans(x)}))