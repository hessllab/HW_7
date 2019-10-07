#Usage: bash StreamFlowData.sh
for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
    wget -O "$sitenumber".txt "https://nwis.waterdata.usgs.gov/nc/nwis/uv?cb_00060=on&format=rdb&site_no="$sitenumber"&period=&begin_date=2010-01-01&end_date=2019-10-07"
done
