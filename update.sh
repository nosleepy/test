#!/bin/bash
cd /data/Note
git pull
rm -rf /data/nosleepy/source/_posts/*
cp /data/Note/* /data/nosleepy/source/_posts/
cd /data/nosleepy
netstat -tnlp | grep 80 > /data/temp.txt
pid=""
for line in `cat /data/temp.txt`
do
    str=$line
    if [[ $str == */hexo* ]]
    then
        pid=${str///hexo/}
    fi
done
echo "pid = $pid"
kill $pid
hexo server -p 80 &
echo "hexo start success"
