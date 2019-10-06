# download_files.sh  
# Download all the stream flow data after 2010-01-01 from USGS NWIS website for the following 4 sites in NC.  
# [target sites]
# 02109500	 WACCAMAW RIVER AT FREELAND, NC  
# 02134500	 LUMBER RIVER AT BOARDMAN, NC  
# 02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC   		 
# 02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC  

# Usage: bash download_files.sh Today's_Date(yyyy-mm-dd) 
# Product: four text files with site numbers and site names in their filenames.  

for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
  echo "$sitenumber"
  wget -O ./"$sitenumber".txt -e robots=off -np -nd "https://nwis.waterdata.usgs.gov/nc/nwis/uv?cb_00060=on&format=rdb&site_no="$sitenumber"&period=&begin_date=2010-01-01&end_date="$1""
  mv ./"$sitenumber".txt ./"$(grep -E -m 1 -w "$sitenumber" "$sitenumber".txt | cut -d\  -f 6- | sed 's/\ /_/g')".txt
done


# Usage: select the most recent data from each of the stream loactions
# Product: site ID, most recent time of aquisition, and stream flow info for the four site locations.

tail -n -1 "02091814_NEUSE_RIVER_NEAR_FORT_BARNWELL,_NC.txt" "02105769_CAPE_FEAR_R_AT_LOCK_#1_NR_KELLY,_NC.txt" "02109500_WACCAMAW_RIVER_AT_FREELAND,_NC.txt" "02134500_LUMBER_RIVER_AT_BOARDMAN,_NC.txt"
