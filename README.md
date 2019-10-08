##### The script `download_files.sh` is made specifically for the 4 gauge stations in NC. The first command block will download the streamflow data and tailor output filenames. Then, the second block will report the most recent data of the 4 stations.  

### Usage  
```  
bash download_files.sh Today's_DATE(yyyy-mm-dd)  
```  
-------------------------------------------------------------------------------  

### Download Streamflow Data  
##### In the for loop, `sitenumber` is set as a variable for the station numbers. `echo "$sitenumber"` is placed at the beginning so that the computer can tell us which station data is currently in process.  
```  
for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
  echo "$sitenumber"
```  

##### The URL within `wget` command defines data parameter, output format, target gauge station, and target period for download. For the data parameter, `cb_00060=on` indicates discharge data. `format=rdb` will set output format as tab spaced. `site_no="$sitenumber"` will specify gauge stations, in which the variable `$sitenumber` is used here. `period=&begin_date=2010-01-01&end_date="$1""` will confine the data period as early as 2010-01-01. The latest date will be set as the most rescent date, specified by users with an argument `"$1"`.  
```  
  wget -O ./"$sitenumber".txt -e robots=off -np -nd "https://nwis.waterdata.usgs.gov/nc/nwis/uv?cb_00060=on&format=rdb&site_no="$sitenumber"&period=&begin_date=2010-01-01&end_date="$1""
```  

##### Output filename is talored by combining `wget -O ./"$sitenumber".txt` and `mv ./"$sitenumber".txt ./"$(grep -E -m 1 -w "$sitenumber" "$sitenumber".txt | cut -d\  -f 6- | sed 's/\ /_/g')".txt`. First, `wget -O ./"$sitenumber".txt` will make the output filenames as 8 digit numbers unique to the each station. Then, a set of commands within `"$()"` in the `mv` command line will create a new filename with _8 digit station number_ and _station name_. `grep` with `-m 1` and `-w "$sitenumber"` will return the first encountered line that contains 8 digit station numbers in the text. This is always within the headder part and is organized as _#    USGS 02109500 WACCAMAW RIVER AT FREELAND, NC_ for example. This expression will be piped to `cut -d\  -f 6-` to cut off texts before the station numbers. Then, the next `sed 's/\ /_/g'` will replace all the white spaces into underscores.  
```  
  mv ./"$sitenumber".txt ./"$(grep -E -m 1 -w "$sitenumber" "$sitenumber".txt | cut -d\  -f 6- | sed 's/\ /_/g')".txt
done
```  

##### Thus, the result of the for loop is the following 4 textfiles, each named with a unique station number and site name and contains discharge data from 2010-01-01 to the most recent date. 
```  
02091814_NEUSE_RIVER_NEAR_FORT_BARNWELL,_NC.txt
02105769_CAPE_FEAR_R_AT_LOCK_#1_NR_KELLY,_NC.txt
02109500_WACCAMAW_RIVER_AT_FREELAND,_NC.txt
02134500_LUMBER_RIVER_AT_BOARDMAN,_NC.txt
```  


### Exstract the Latest Data  



