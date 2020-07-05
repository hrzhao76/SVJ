#!/bin/bash

path="/your-script" 

echo "Start Running"

i=1
while [ $i != 11 ]
do
   echo i=$i

   date +"%Y %b %m"
   date +"%r"
   echo "s-channel"

   ./bin/mg5_aMC $path/schannel.txt > $path/schannel_"$i".log

  
   date +"%Y %b %m"
   date +"%r"
   i=$(($i+1))

done

echo "Finish"

date
