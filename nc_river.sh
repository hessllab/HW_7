# Bash Script to Find the Historic flow and most recent flow of NC rivers. 
# Usage: nc_river.sh

# The listed stations are:
# 02109500	 WACCAMAW RIVER AT FREELAND, NC
# 02134500	 LUMBER RIVER AT BOARDMAN, NC
# 02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
# 02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
# wget will create text files named after the station number with all the record until the selected date. 

d=$(date +'%F')

echo "Downloading data from 2010-01-01 until "$d

for gauge in "02109500" "02134500" "02091814" "02105769" #Variables
do 
  wget -q -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no="$gauge"&referred_module=sw&period=&begin_date=1880-01-01&end_date="$d # getting daily TS of whole record
  wget -q -O c$gauge.txt "https://waterservices.usgs.gov/nwis/iv/?format=rdb&sites="$gauge"&period=P10D&modifiedSince=P1D&parameterCd=00060" # wget to get only last day in subdaily TS
  n=$(head -15 c$gauge.txt | tail -1) # Extracts the name of the station
  t=$(tail -1 c$gauge.txt | cut -f3 -d$'\t') # Extracts time stamp of the last record 
  r=$(tail -1 c$gauge.txt | cut -f5 -d$'\t') # Extracts Maximum height
  echo $n $t $r >> NC_current.txt # Creates a line with the name and the last record of the given station. 
done
rm c* #deleting files that where temporary.

  

