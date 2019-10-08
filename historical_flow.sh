# Objective: obtain USGS streamflow data for four locations in NC using wget
# Usage: bash historical_flow.sh 

for site in "02109500" "02134500" "02091814" "02105769"
do
  wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=${site}&referred_module=sw&period=&begin_date=2010-01-01&end_date=$1"
done