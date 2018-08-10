library(mgsub)
library(stringr)
numberTrans=function(number){
        cN = c("一","二","三","四","五","六","七","八","九","壹","貳","參","肆","伍","陸","柒","捌","玖","兩")
        eN = c(rep(1:9,2),2)
        cNm= c("十","拾","百","佰","千","仟","萬")
        eNm = c(rep(c(10,100,1000),each=2),10000)
        names(eN)=cN
        names(eNm)=cNm
        numLength=str_length(number)
        ans=0
        if(number=="零"){
                ans=0
        }else if(numLength==1){
                ans=mgsub(substr(number,1,1), c(cN), c(eN)) %>% as.numeric
        }else if(substr(number,1,1)=="十"){
                ans=10
                for(i in 2:numLength){
                        if(substr(number,i,i)%in%cN){
                                num=mgsub(substr(number,i,i), cN, eN) %>% as.numeric
                                if(substr(number,i+1,i+1)%in%cNm[1:3] & is.null(ans)){
                                        ans=num*(mgsub(substr(number,i+1,i+1), cNm, eNm) %>% as.numeric)
                                }else if(substr(number,i+1,i+1)%in%cNm[1:3] & !is.null(ans)){
                                        ans=ans+num*(mgsub(substr(number,i+1,i+1), cNm, eNm) %>% as.numeric)
                                }else if(substr(number,i+1,i+1)=="" & substr(number,i-1,i-1)=="零"){
                                        ans=ans+num
                                }else if(substr(number,i+1,i+1)=="" & substr(number,i-1,i-1)!=""){
                                        ans=ans+num*(mgsub(substr(number,i-1,i-1), cNm, eNm) %>% as.numeric)/10
                                }else{
                                        ans=ans+num
                                }
                        }else if(substr(number,i,i)%in%"萬"){
                                ans=ans*10000
                        }
                }
        }else{
                for(i in 1:numLength){
                        if(substr(number,i,i)%in%cN){
                                num=mgsub(substr(number,i,i), cN, eN) %>% as.numeric
                                if(substr(number,i+1,i+1)%in%cNm[1:3] & is.null(ans)){
                                        ans=num*(mgsub(substr(number,i+1,i+1), cNm, eNm) %>% as.numeric)
                                }else if(substr(number,i+1,i+1)%in%cNm[1:3] & !is.null(ans)){
                                        ans=ans+num*(mgsub(substr(number,i+1,i+1), cNm, eNm) %>% as.numeric)
                                }else if(substr(number,i+1,i+1)=="" & substr(number,i-1,i-1)=="零"){
                                        ans=ans+num
                                }else if(substr(number,i+1,i+1)=="" & substr(number,i-1,i-1)!=""){
                                        ans=ans+num*(mgsub(substr(number,i-1,i-1), cNm, eNm) %>% as.numeric)/10
                                }else{
                                        ans=ans+num
                                }
                        }else if(substr(number,i,i)%in%"萬"){
                                ans=ans*10000
                        }
                }
        }
        return(ans)
}
