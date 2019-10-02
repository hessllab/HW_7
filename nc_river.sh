# Bash Script to Find the Historic flow and most recent flow of NC rivers. 
# Usage: nc_river.sh  


# 02109500	 WACCAMAW RIVER AT FREELAND, NC
# 02134500	 LUMBER RIVER AT BOARDMAN, NC
# 02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
# 02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC

for gauge in "02109500" "02134500" "02091814" "02105769"
do
    wget -q -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no="$gauge"&referred_module=sw&period=&begin_date=1946-03-03&end_date=2018-12-06"
done
