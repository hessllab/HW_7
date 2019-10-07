for sitenumber in "02109500" "02134500" "02091814" "02105769"
do 
wget -O https://nwis.waterdata.usgs.gov/nc/nwis/uv/?cb_00060=on&cb_00065=on&format=gif_default&site_no=02109500&period=&begin_date=2010-01-01&end_date=2019-10-07 >> "$sitenumber".txt
done