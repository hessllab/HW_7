# Script to download Stream Gauge Data to access the effect of Hurricane on Rivers in NC

This script downloads historical stream guage data (from 2010) for North Carolina from the USGS stream guage database and saves it in a textfile. To check the current flow of each river, this script also creates a text file called current_flow and saves the current flow readings for each river. 

## Prerequisites

To run this script `git bash` and `wget` is required

## Usage

Run the command below in the terminal to utilize the script.
The date is the most recent date in the form of year-month-date (for example: 2019-10-08)
```
bash flow.sh date
```

## Code
```bash
# Collect flow from 2010 to present
# Usage: bash flow.sh date (year-month-day)
mkdir NC_flow && cd NC_flow
for site in "02109500" "02134500" "02091814" "02105769"
do
 wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nc/nwis/uv/?cb_00060=on&format=rdb&site_no="$site"&period=&begin_date=2010-01-01&end_date="$1""
 tail -1 "$site".txt >> current_flow.txt
done
cd ..
```

## Product
The script downloads the stream guage reading for the following rivers from 2010 till date.
```
02109500	 WACCAMAW RIVER AT FREELAND, NC
02134500	 LUMBER RIVER AT BOARDMAN, NC
02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC  
02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
```
it saves this downloaded data in a directory called `NC_flow`. This data is in the form of a textfile with the name being the unique site numbers of each river. For example, the textfile for the `WACCAMAW RIVER` is called `02109500.txt`

The script then returns the most recent stream guage readings for each river and saves it in a textfile called `current_flow` where the column heading for the textfile is:
`agency_cd	site_no	datetime	tz_cd	89721_00060	89721_00060_cd`

The result of this textfile is below.
```
USGS	02109500	2019-10-06 23:45	EDT	93.0	P
USGS	02134500	2019-10-06 23:45	EDT	198	P
USGS	02091814	2019-10-06 23:45	EDT	774	P
USGS	02105769	2019-10-06 23:45	EDT	979	P
```

## Colaborators

[Zachary Grzywacz](https://github.com/zgrzywacz)
[Tobi Ore](https://github.com/tobi-ore)

## License

[This project is licensed under the MIT License](https://choosealicense.com/licenses/mit/)

## Acknowledgments

[Dr Amy Hessl](https://github.com/hessllab)
