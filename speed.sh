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

# https://www.digitalocean.com/docs/platform/availability-matrix/
for DC in NYC1 NYC2 NYC3 SFO1 SFO2 SFO3 TOR1 LON1 FRA1 AMS2 AMS3 SGP1 BLR1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://speedtest-$DC.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nLinode Speed Test: (100MB each)\n\n"

# https://www.linode.com/speed-test/
for DC in newark atlanta dallas fremont london frankfurt singapore tokyo2 syd1 toronto1 mumbai1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://speedtest.$DC.linode.com/100MB-$DC.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nAWS Speed Test: (10MB each)\n\n"

# https://cloudharmony.com/speedtest-for-aws:ec2
for DC in us-east-1 us-east-2a us-east-2b us-west-1 us-west-2 ca-central-1 eu-north-1 eu-central-1 eu-west-1 eu-west-2 eu-west-3 eu-north-1 eu-south-1 ap-east-1 ap-northeast-1 ap-northeast-2 ap-south-1 ap-southeast-1 ap-southeast-2 sa-east-1 me-south-1 af-south-1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-ec2.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nGCP Speed Test: (10MB each)\n\n"

# https://cloudharmony.com/speedtest-for-google:compute
for DC in us-east1 us-east4 us-west1 us-west2-a us-west2-b us-west3 us-central1 northamerica-northeast1 asia-east1 asia-east2 asia-northeast1 asia-northeast2 asia-south1 asia-southeast1 australia-southeast1 europe-north1 europe-west1 europe-west2 europe-west3 europe-west4 europe-west6 southamerica-east1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-gce.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done


printf "\n\nVultr/Choopa Speed Test: (100MB each)\n\n"

# https://www.vultr.com/resources/faq/#downloadspeedtests
for DC in NJ-US IL-US GA-US FL-US TX-US SJO-CA-US LAX-CA-US WA-US TOR-CA FRA-DE AMS-NL PAR-FR LON-GB SYD-AU SGP HND-JP SEL-KOR
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://$DC-ping.vultr.com/vultr.com.100MB.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done

printf "\n\nCoreWeave Speed Test: (100MB each)\n\n"

# https://docs.coreweave.com/data-center-regions
for DC in las1 lga1 ord1
do
    printf "$DC: \e\n"
    printf "$(wget -O /dev/null http://http.speedtest.$DC.coreweave.com/100M 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')\e\n" & spinner $!
done
