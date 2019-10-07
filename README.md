## HW_7 Collaborating using Git to write a script for current flows of NC rivers.

### Goal
The goal of this assignment is to collaborate with a partner using git, to create a woking script for downloading stream flow data from the USGS. Using git, we were able to divide tasks, work remotely and in the end merge our tasks to 
complete the assignment.

Tasks were divided as follows:
1) Luis: Script
2) Shaun: Check working script, edit if needed
3) Shaun: Write ReadMe
4) Luis: Check ReadMe, edit if needed

All tasks were completed using Git.

### Problem
The problem of this assignment is to download historic stream gauge data for a 
set of rivers in North Carolina. The stream gauge data is hosted by the USGS and 
can be downloaded [here](https://waterdata.usgs.gov/nc/nwis/current/?type=flow).
To solve this problem, a script was developed in R to automatically download
historic stream gauge data from the specified rivers and create individual text files containing all the data for each river. The script then extracted the most current river flows for each river and then compiled the data into another text file.


The Rivers of interest and their respective stream gauge numbers are reported below.
```
02109500	 WACCAMAW RIVER AT FREELAND, NC
02134500	 LUMBER RIVER AT BOARDMAN, NC
02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
```
### The Script
The script developed utilized wget and other commands to extract historic stream flow data from the USGS repository and report the most up to date flow from each river. 

The first line of code created a variable d, which represents the current date and will download stream flow data to that current date.
```
d=$(date +'%F')
echo "Downloading data until "$d
```

The following for loop downloads stream flow data from 4 specified rivers, using their stream gauge numbers as variables. The loop first downloads the entire daily record of stream flow from each gauge and then the following line of code downloads the last day of data from the subdaily recored so it can report the most current flow. These first 2 lines of code that use wget, create individual text files for each of the streams named after their gauge number that contain all of their data. The last 4 lines of the for loop use a set of commands to extract the wanted data from each of the rivers text files and then complies the data into one text file named NC_current.txt. This text file contains the stream gauge number followed by the stream name, current date and most current flow. 
```
for gauge in "02109500" "02134500" "02091814" "02105769"
do 
  wget -q -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no="$gauge"&referred_module=sw&period=&begin_date=1880-01-01&end_date="$d 
  wget -q -O c$gauge.txt "https://waterservices.usgs.gov/nwis/iv/?format=rdb&sites="$gauge"&period=P10D&modifiedSince=P1D&parameterCd=00060"
  n=$(head -15 c$gauge.txt | tail -1)
  t=$(tail -1 c$gauge.txt | cut -f3 -d$'\t')  
  r=$(tail -1 c$gauge.txt | cut -f5 -d$'\t')
  echo $n $t $r >> NC_current.txt  
done
```
This last commands deletes any temporary files that were created in the for loop.
```
rm c* 
```


### Results
The resulting information from the text file NC_current.txt created from the for loop is reported below.

```
# USGS 02109500 WACCAMAW RIVER AT FREELAND, NC 2019-10-06 11:15 99.6
# USGS 02134500 LUMBER RIVER AT BOARDMAN, NC 2019-10-06 11:00 218
# USGS 02091814 NEUSE RIVER NEAR FORT BARNWELL, NC 2019-10-06 10:30 848
# USGS 02105769 CAPE FEAR R AT LOCK #1 NR KELLY, NC 2019-10-06 11:45 1020
```


### Finalizing the assignment

Once the tasks assigned were completed, our separate branches that contain the finalized script and Readme were merged and pushed to our repository on Github. We then created a pull request for our professor to see our HW_7.

