#!/bin/sh

date
for host in swarmm-agentpublic-4942022500000E swarmm-agentpublic-49420225000000 swarmm-agentpublic-4942022500000M swarmm-agentpublic-4942022500000O swarmm-agentpublic-4942022500000V swarmm-agentpublic-4942022500000H swarmm-agentpublic-4942022500000C swarmm-agentpublic-49420225000007 swarmm-agentpublic-4942022500000Y swarmm-agentpublic-4942022500000A swarmm-agentpublic-49420225000002 swarmm-agentpublic-4942022500000X swarmm-agentpublic-4942022500000W swarmm-agentpublic-4942022500000N swarmm-agentpublic-4942022500000F swarmm-agentpublic-49420225000001 
do
 echo $host
 ssh $host 'sudo service docker restart' 
done
