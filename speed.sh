#!/bin/bash

function spinner()
{
    local lines='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $1)" ]; do
        local temp=${lines#?}
        printf "\r [%c]  " "$lines"
        local lines=$temp${lines%"$temp"}
        sleep 0.15
    done
    printf "\r"
}

printf "DigitalOcean Speed Test: (100MB each)\n\n"

for DC in NYC1 NYC2 NYC3 SFO1 SFO2 TOR1 LON1 FRA1 AMS2 AMS3 SGP1 BLR1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://speedtest-$DC.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nLinode Speed Test: (100MB each)\n\n"

for DC in newark atlanta dallas fremont london frankfurt singapore tokyo2
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://speedtest.$DC.linode.com/100MB-$DC.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nAWS Speed Test: (10MB each)\n\n"

for DC in us-east-1 us-west-1 us-west-2 eu-north-1 ca-central-1 eu-central-1 eu-west-1 eu-west-2 ap-northeast-1 ap-south-1 ap-southeast-1 ap-southeast-2 sa-east-1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-ec2.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nGCP Speed Test: (10MB each)\n\n"

for DC in us-east1 us-east4 us-west1 us-central1 northamerica-northeast1 asia-east1 asia-east2 asia-northeast1 asia-south1 asia-southeast1 australia-southeast1 europe-north1 europe-west1 europe-west2 europe-west3 europe-west4 southamerica-east1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-gce.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nVultr/Choopa Speed Test: (100MB each)\n\n"

for DC in NJ-US IL-US GA-US FL-US TX-US SJO-CA-US WA-US TOR-CA FRA-DE AMS-NL PAR-FR LON-GB SYD-AU SGP HND-JP
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-ping.vultr.com/vultr.com.100MB.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done
