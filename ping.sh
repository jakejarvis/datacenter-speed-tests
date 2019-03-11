
echo "DigitalOcean Ping Test: \n"

for DC in NYC1 NYC2 NYC3 SFO1 SFO2 TOR1 LON1 FRA1 AMS2 AMS3 SGP1 BLR1
do
    echo "$DC: $(ping -i .2 -c 10 -q speedtest-$DC.digitalocean.com | awk -F/ '/^round|^rtt/{print $5}') ms"
done

echo ""
echo "Linode Ping Test: \n"

for DC in Newark Atlanta Dallas Fremont London Frankfurt Singapore Tokyo2
do
    echo "$DC: $(ping -i .2 -c 10 -q speedtest.$DC.linode.com | awk -F/ '/^round|^rtt/{print $5}') ms"
done

echo ""
echo "AWS Ping Test: \n"

for DC in us-east-1 us-west-1 us-west-2 eu-central-1 eu-west-1 eu-west-2 ap-northeast-1 ap-south-1 ap-southeast-1 ap-southeast-2 sa-east-1
do
    echo "$DC: $(ping -i .2 -c 10 -q ec2.$DC.amazonaws.com | awk -F/ '/^round|^rtt/{print $5}') ms"
done

echo ""
echo "GCP Ping Test: \n"

for DC in us-central1 us-east1 us-east4 us-west1 northamerica-northeast1 asia-east1 asia-east2 asia-northeast1 asia-south1 asia-southeast1 australia-southeast1 europe-north1 europe-west1 europe-west2 europe-west3 europe-west4 southamerica-east1
do
    echo "$DC: $(ping -i .2 -c 10 -q $DC-gce.cloudharmony.net | awk -F/ '/^round|^rtt/{print $5}') ms"
done


echo ""
echo "Vultr/Choopa Ping Test: \n"

for DC in nj-us il-us ga-us fl-us tx-us sjo-ca-us wa-us tor-ca fra-de ams-nl par-fr lon-gb syd-au sgp hnd-jp
do
    echo "$DC: $(ping -i .2 -c 10 -q $DC-ping.vultr.com | awk -F/ '/^round|^rtt/{print $5}') ms"
done
