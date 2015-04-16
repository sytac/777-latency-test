#!/bin/bash
# This script test the 777 latency

# Define a timestamp function
NOW=$(date +"%d-%m-%Y_%H-%M-%S")
WD=`pwd`
OUT=$WD/test-results/$NOW

echo "=============================================="
echo "STARTING:"
echo "The latency test on: $NOW"
echo "Results of this test are saved in:"
echo "$OUT"

# Create output dir
mkdir -p $OUT


# determine geolocation
echo "=============================================="
echo "Determine geolocation:"
echo "=============================================="
curl -H "Content-Type: application/json" -i "http://www.telize.com/geoip?callback=getgeoip" >  $OUT/geoip.json

# traceroute verbose
echo "=============================================="
echo "start traceroute test:"
echo "=============================================="
traceroute  -m30 klm.com > $OUT/traceroute.txt

# set JVM arguments
set JVM_ARGS="-Xms1024m -Xmx1024m -Dpropname=propvalue"

# start jmeter tests
echo "=============================================="
echo "start jmeter tests:"
echo "=============================================="
./bin/jmeter -n -t 777-latency-test.jmx -l $OUT/jmeter.jtl

echo "=============================================="
echo "FINISHED: The latency test"
