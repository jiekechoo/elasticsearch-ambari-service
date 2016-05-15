export SERVICE=ELASTICSEARCH
export PASSWORD='talent(!@#ambari'
export AMBARI_HOST=localhost
export CLUSTER=tongjibigdata

curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Stop ELASTICSEARCH via REST"}, "Body": {"ServiceInfo": {"state": "INSTALLED"}}}' http://$AMBARI_HOST:8080/api/v1/clusters/$CLUSTER/services/$SERVICE

curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X DELETE http://$AMBARI_HOST:8080/api/v1/clusters/$CLUSTER/services/$SERVICE

yum erase elasticsearch -y

rm -rf /etc/elasticsearch
