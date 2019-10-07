#### Problem
Harry is interested in how a recent hurricane is affecting rivers in North Carolina.  He would like to download the stream gauge data for the historic record including the most current levels for each river from a list of rivers in North Carolina. He found a list of USGS stream gauges in NC [here](https://waterdata.usgs.gov/nc/nwis/current/?type=flow). Can you and a partner help Henry create a script that automatically downloads historic stream flow data for the following stream gauges and then reports on current levels?  Here is his list:

```
02109500	 WACCAMAW RIVER AT FREELAND, NC
02134500	 LUMBER RIVER AT BOARDMAN, NC
02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
```

#### Tasks:

Tasks should be divided among the two of you.  All data, scripts, links, and comments should be exchanged over __GitHub__. Avoid email or texting as you want a complete record of changes in your git history.

1)	Use the fork-clone-branch system to create a new branch of this repo on Github.
2)  Invite the other partner to collaborate on the branch.
2)	Create a _README.md_ file that describes the project including a code and results snippets.
3)	Create an __bash__ script that downloads the historical to present (up to date) flow files for each river and saves them as text files.
4)	Create additional code that would report current flow for each river in a (single) separate text file.

#### Submission Guidelines

Once you have merged all branches, make a pull request to the instructor for this homework.


---------
#### Retrieve historical data
To retrieve historical stream flow data on the four locations, use the below bash script `historical_flow.sh`.  

```bash
for site in "02109500" "02134500" "02091814" "02105769"
do
  wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=${site}&referred_module=sw&period=&begin_date=2010-01-01&end_date=2019-10-07"
done
```
The result of this script is four text files corresponding with each locaiton specified. The data range is from 01-01-2010 to present (10-07-2019) downloads from the USGS website. 
```
02109500.txt
02134500.txt
02091814.txt
02105769.txt
```

#### Sources
All data for this script can be found online through the USGS at https://waterdata.usgs.gov/nc/nwis/current/?type=flow 