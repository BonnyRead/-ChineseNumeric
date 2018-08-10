floor=c("二十二層","五層","二十八層","二十二層","三層","十六層","二十四層","十一層","層","十五層","十五層","七層")
floor = gsub("層","",floor)
unlist(lapply(floor,function(x){numberTrans(x)}))
#22  5 28 22  3 16 24 11  0 15 15  7
test=c("一千萬","一萬一","九十九","一千零一","十三萬兩千","十三萬零兩百")
unlist(lapply(test,function(x){numberTrans(x)}))
#10000000    11000       99     1001   132000   130200