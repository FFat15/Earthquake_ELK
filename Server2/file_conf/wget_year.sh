#!/bin/sh


j=2;
for i in $(seq 1 6)
	do
		#echo ${i}
		j=$(expr $i + 1)
		#echo ${j}
		if [ $i -eq 1 ]
		    then
			     wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime=2020-'${i}'-01&endtime=2018-'${i}'-14'
			     wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime=2020-'${i}'-15&endtime=2018-'${j}'-01'
		else
		       wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime=2020-'${i}'-02&endtime=2018-'${i}'-14'
		       wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime=2020-'${i}'-15&endtime=2018-'${j}'-01'
		fi
	done



cat query* > 2020.csv
rm query*
