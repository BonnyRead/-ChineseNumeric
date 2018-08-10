# -ChineseNumeric
This an simple function that can transform Chinese character into numeric format.

This function is inspired by steve chen,who post his idea in http://steve-chen.tw/?p=999

The function is pretty ease to use.And it is now under constructed. Feel free to summit any bug you find.

demo 1
Transfer only one word.

``
numberTrans("五十五")
``
And you will get an "55" in result.

demo 2
Transfer lots of words.

``
test=c("一千萬","一萬一","九十九","一千零一","十三萬兩千","十三萬零兩百")
``

``
unlist(lapply(test,function(x){numberTrans(x)}))
``

And the result shows

[1] 10000000    11000       99     1001   132000   130200
