#!/bin/sh


j=2;
for k in $(seq 2000 2019)
   do
	for i in $(seq 1 11)
		do
			j=$(expr $i + 1)
			if [ $i -eq 1 ]
		    	then
			     wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-'${i}'-01&endtime='${k}'-'${i}'-14' -P ./querys
			     wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-'${i}'-15&endtime='${k}'-'${j}'-01' -P ./querys
			else
		             wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-'${i}'-02&endtime='${k}'-'${i}'-14' -P ./querys
		             wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-'${i}'-15&endtime='${k}'-'${j}'-01' -P ./querys
			fi
		done

	wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-12-02&endtime='${k}'-12-15' -P ./querys
	wget 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=csv&starttime='${k}'-12-16&endtime='${k}'-12-31' -P ./querys

   done	
cat ./querys/query* > 2000_2019.csv
rm -r ./querys
