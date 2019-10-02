# Bash Script to Find the Historic flow and most recent flow of NC rivers. 
# Usage: nc_river.sh 'date'
# Date must be given in format YYYY-MM-DD

# The listed stations are:
# 02109500	 WACCAMAW RIVER AT FREELAND, NC
# 02134500	 LUMBER RIVER AT BOARDMAN, NC
# 02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
# 02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
# wget will create text files named after the station number with all the record until the selected date. 

for gauge in "02109500" "02134500" "02091814" "02105769" #Variables
do 
  wget -q -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00065=on&format=rdb&site_no="$gauge"&referred_module=sw&period=&begin_date=1880-01-01&end_date="$1
  head -17 $gauge.txt | tail -1 > name.txt # Extracts the name of the station
  tail -1 $gauge.txt | cut -c 25-30 > record.txt # Extracts the last record of Maximum height 
  paste name.txt record.txt >> NC_current.txt # Creates a line with the name and the last record of the given station. 
done
