#!/usr/bin/bash
newdir="../${PWD##*/}_UTF-8"
rm -rf $newdir
mkdir -p $newdir
for filename in *
do
    if [[ $(file $filename) =~ "ISO-8859" ]]
    then
        echo $filename
        iconv -s -f GBK -t UTF-8 $filename > $newdir/$filename
    else
        cp $filename $newdir/$filename
    fi
done
code $newdir
