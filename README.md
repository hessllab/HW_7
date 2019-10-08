### Homework 7
#### Jamiee Pyron and Sara Schreder-Gomes
---------

#### Requirements
1. A partner for the exercise
2. Internet connection
3. Installation of Git Bash
4. Installation of wget

#### Assignment Summary
Goal: become familiar with using git and GitHub by working on a collaborative assignment. The assignment is to retrieve historical data and current data from the USGS website for the sites listed below:

```
02109500	 WACCAMAW RIVER AT FREELAND, NC
02134500	 LUMBER RIVER AT BOARDMAN, NC
02091814	 NEUSE RIVER NEAR FORT BARNWELL, NC 		 
02105769	 CAPE FEAR R AT LOCK #1 NR KELLY, NC
```

#### Tasks Distribution

1)	__Jaimee__: Use the fork-clone-branch system to create a new branch of this repo on Github.
2)  __Jaimee__: Invite the other partner to collaborate on the branch.
3)	__Sara and Jaimee__: Create a _README.md_ file that describes the project including a code and results snippets.
4)	__Sara__: Create an __bash__ script that downloads the historical to present (up to date) flow files for each river and saves them as text files.
5)	__Jaimee__: Create additional code that would report current flow for each river in a (single) separate text file.

---------

#### Usage
To retrieve historical to present stream flow data on the four locations, use the below bash script:
`bash historical_flow.sh $1`. 
Where the variable `$1` will be the current date in the format: YYYY-MM-DD

```bash
for site in "02109500" "02134500" "02091814" "02105769"
do
  wget -O "$site".txt "https://nwis.waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=${site}&referred_module=sw&period=&begin_date=2010-01-01&end_date=$1"
done
```

#### Products: Historical data
The result of this script is four text files corresponding with each locaiton specified. The data is downloaded from the USGS website. 
```
02109500.txt
02134500.txt
02091814.txt
02105769.txt
```

#### Sources
All data for this script can be found online through the USGS at https://waterdata.usgs.gov/nc/nwis/current/?type=flow 