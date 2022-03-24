
#!bin/bash
apt-get update
apt-get -y install wget gnupg


# Installing Elastic Search from apt repo 

apt-get -y install apt-transport-https 

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

apt-get update && apt-get -y install elasticsearch

apt-get update && apt-get -y install kibana

sed -i "s/#http.port: 9200/http.port: 9200/" /etc/elasticsearch/elasticsearch.yml
sed -i "s/#network.host: 192.168.0.1/network.host: localhost/" /etc/elasticsearch/elasticsearch.yml

sed -i "s/#elasticsearch.hosts: [\"http:\/\/localhost:9200\"]/elasticsearch.hosts: [\"http:\/\/localhost:9200\"]/" /etc/kibana/kibana.yml
sed -i "s/#server.host: \"localhost\"/server.host: 0.0.0.0/" /etc/kibana/kibana.yml
sed -i "s/#server.port: 5601/server.port: 5601/" /etc/kibana/kibana.yml


apt-get update && apt-get install metricbeat

