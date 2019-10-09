#### Download Stream Data
Use the StreamFlowData.sh to download data for 4 NC sites.
The shell script is a for loop that goes through the 4 desired sites and downloads stream flow data from each site. 

```bash
#Usage bash StreamFlowData.sh
for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
```
The script then uses wget to download the data using time parameters and placing the variable name "$sitenumber" to specify the stations. The script creates individual text files for each station that includes the downloaded data. 
```bash
wget -O "$sitenumber".txt "https://nwis.waterdata.usgs.gov/nc/nwis/uv?cb_00060=on&format=rdb&site_no="$sitenumber"&period=&begin_date=2010-01-01&end_date=2019-10-07"
done
```
#### Generate Flow Report
Use CurrentFlow.sh to generate a report of the most recently observed flow for each site.

 ```bash
#Usage: bash CurrentFlow.sh 
 ```
Like StreamFlowData.sh, CurrentFlow.sh is a for loop that iterates through the desired site numbers. For each site, it finds the line with the site name to use as a header, then records the flow in cubic feet per second for the latest observation.
 ```bash
for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
	grep "#    USGS "$sitenumber $sitenumber.txt >> report.txt
	tail -n 1 $sitenumber.txt | cut -f 5 >> report.txt
done
 ```
 #### Master Script
 You can use `bash FlowMaster.sh` to run StreamFlowData.sh and CurrentFlow.sh in sequence.
