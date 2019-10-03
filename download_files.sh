# download_files.sh  
# Download all historical stream flow data (temporariry from 2019-06-05 to 2019-10-02) from USGS NWIS website for the following four sites in NC.  
# [target sites]
# 02109500	 WACCAMAW RIVER AT FREELAND, NC  
# 02134500	 LUMBER RIVER AT BOARDMAN, NC  
# 02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC   		 
# 02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC  

# Usage: bash download_files.sh  
# Product: four text files with site numbers and site names in their filenames.  

for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
  echo "$sitenumber"
  wget -q -O ./"$sitenumber".txt -e robots=off -np -nd "https://waterdata.usgs.gov/nc/nwis/uv?cb_00060=on&cb_00065=on&format=rdb&site_no="$sitenumber"&period=&begin_date=2019-06-05&end_date=2019-10-02"
  mv ./"$sitenumber".txt ./"$(grep -E -m 1 -w "$sitenumber" "$sitenumber".txt | cut -d\  -f 6- | sed 's/\ /_/g')".txt
done