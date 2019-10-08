#### Usage: Historical data
To retrieve historical stream flow data on the four locations, use the below bash script as:
`bash historical_flow.sh`  

```bash
for site in "02109500" "02134500" "02091814" "02105769"
do
  wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=${site}&referred_module=sw&period=&begin_date=2010-01-01&end_date=2019-10-07"
done
```

Current flows can also be retrieved from `bash historical_flow.sh`. This code, as shown below, looks at all *.txt* files created from the last script. The line with the word "NC" is chosen and displayed in a textfile, called current_flow.txt, as it shows critical identifiers such as the name and location of the river. Finally, the most recent flow information is appended to the textfile.
```bash
for sites in *.txt
do
grep -hnr "NC" "$sites" >> current_flow.txt
cat "$sites" | tail -1 >> current_flow.txt
done
```

#### Products: Historical data
The result of this script is four text files corresponding with each locaiton specified. The data range is from 01-01-2010 to present (10-07-2019) and downloads from the USGS website. 
```
02109500.txt
02134500.txt
02091814.txt
02105769.txt
```

In considering most recent stream flow data, the expected output is below.
```
17:#    USGS 02091814 NEUSE RIVER NEAR FORT BARNWELL, NC
USGS    02091814        2019-10-07      722     P
17:#    USGS 02105769 CAPE FEAR R AT LOCK #1 NR KELLY, NC
USGS    02105769        2019-10-07                                      969     P
17:#    USGS 02109500 WACCAMAW RIVER AT FREELAND, NC
USGS    02109500        2019-10-07                                      88.1    P
17:#    USGS 02134500 LUMBER RIVER AT BOARDMAN, NC
USGS    02134500        2019-10-07                                      203     P
```
