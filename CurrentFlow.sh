echo "# Current discharge in cubic feet per second" > report.txt
for sitenumber in "02109500" "02134500" "02091814" "02105769"
do
	grep "#    USGS "$sitenumber $sitenumber.txt >> report.txt
	tail -n 1 $sitenumber.txt | cut -f 5 >> report.txt
done
