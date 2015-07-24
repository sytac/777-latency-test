# 777-latency-test
Triple-7 Wi-Fi latency test

## Features

- jMeter 2.13
- sh script that runs the tests
  - jMeter test script
  - Detection of current geolocation
  - Traceroute

### Prerequisite:
- Java 6 JVM (default installed on OSX)

Results are being stored in folder test-results/{timestamp}

### Setting once the execution rights of the script:
```bash
$ chmod +x 777.sh
```

### Run the tests once
```bash
$ ./777.sh
```
The Test ends itself when being done.

### Continuous testing with a 5 minute interval
```bash
$ ./run.sh
```
