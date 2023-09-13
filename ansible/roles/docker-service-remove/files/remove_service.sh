#!/bin/bash

echo "Enter the service to be removed"
echo "1: docker_service, 2: docker_stack, 3: docker_network, 4: remove_all"
while :
do
  case $1 in
	1)
		docker service rm learner-service player_player content-service proxy_proxy api-manager_kong adminutil_adminutil api-manager_echo telemetry-logstash telemetry-service jenkins-slave_api-manager-jenkins-slave badger
		break
		;;
	2)
		docker stack rm monitor logger player proxy api-manager adminutil content_service
		break
		;;
	3)
		docker network rm api-manager_default application_default monitoring logger
		break
		;;
	4) 
		docker stack rm monitor logger player proxy api-manager adminutil content_service
		docker service rm learner-service content-service telemetry-logstash telemetry-service badger jenkins-slave_api-manager-jenkins-slave telemetry-logstash-datapipeline
		docker network rm api-manager_default application_default monitoring logger proxy_default	
		break
		;;
	*)
		echo "Wrong Input"
		break
		;;
		
  esac
done
echo 

