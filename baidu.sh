#!/bin/bash
rake generate
if [ x$1 != x ]
then
  if [ x$1 != xall ]
  then
    head -n $1 public/urls.txt | tr -s '\n' > baidu_urls.txt
  else
    cat public/urls.txt | tr -s '\n' > baidu_urls.txt
  fi
else
  head public/urls.txt | tr -s '\n' > baidu_urls.txt
fi
echo "ready to push to Baidu - "
cat baidu_urls.txt
curl -H 'Content-Type:text/plain' --data-binary @baidu_urls.txt "http://data.zz.baidu.com/urls?site=www.nietongxue.xyz&token=4kV6RKT2Wt62Su9d"
