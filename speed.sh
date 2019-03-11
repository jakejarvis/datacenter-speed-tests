echo -e "DigitalOcean Speed Test: (100MB each) \n"

for DC in NYC1 NYC2 NYC3 SFO1 SFO2 TOR1 LON1 FRA1 AMS2 AMS3 SGP1 BLR1
do
    echo "$DC: $(wget -O /dev/null http://speedtest-$DC.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')"
done

echo ""
echo -e "Linode Speed Test: (100MB each) \n"

for DC in newark atlanta dallas fremont london frankfurt singapore tokyo2
do
    echo "$DC: $(wget -O /dev/null http://speedtest.$DC.linode.com/100MB-$DC.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')"
done

echo ""
echo -e "AWS Speed Test: (10MB each) \n"

for DC in us-east-1 us-west-1 us-west-2 eu-central-1 eu-west-1 eu-west-2 ap-northeast-1 ap-south-1 ap-southeast-1 ap-southeast-2 sa-east-1
do
    echo "$DC: $(wget -O /dev/null http://$DC-ec2.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')"
done

echo ""
echo -e "GCP Speed Test: (10MB each) \n"

for DC in us-central1 us-east1 us-east4 us-west1 northamerica-northeast1 asia-east1 asia-east2 asia-northeast1 asia-south1 asia-southeast1 australia-southeast1 europe-north1 europe-west1 europe-west2 europe-west3 europe-west4 southamerica-east1
do
    echo "$DC: $(wget -O /dev/null http://$DC-gce.cloudharmony.net/probe/test10mb.jpg 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')"
done

echo ""
echo -e "Vultr/Choopa Speed Test: (100MB each) \n"

for DC in nj-us il-us ga-us fl-us tx-us sjo-ca-us wa-us tor-ca fra-de ams-nl par-fr lon-gb syd-au sgp hnd-jp
do
    echo "$DC: $(wget -O /dev/null http://$DC-ping.vultr.com/vultr.com.100MB.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')"
done