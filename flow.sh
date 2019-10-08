# Collect flow from 2010 to present
# Usage: bash flow.sh date (year-month-day)
mkdir NC_flow && cd NC_flow
for site in "02109500" "02134500" "02091814" "02105769"
do
 wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nc/nwis/uv/?cb_00060=on&format=rdb&site_no="$site"&period=&begin_date=2010-01-01&end_date="$1""
 tail -1 "$site".txt >> current_flow.txt
done
cd ..