for (( i=1; i>0; i++ ))
do
    curl 'https://www.google.com/voice/b/0/service/post' -H 'origin: https://www.google.com' -H 'dnt: 1' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.8,en;q=0.6' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36' -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' -H 'accept: */*' -H 'referer: https://www.google.com/voice/b/0' -H 'authority: www.google.com' -H 'cookie: gv=.........; GV_NR=1;-eVupmL6qR...........ncdG7vO' --data 'sid=...' --compressed

    sleep 3s
done
