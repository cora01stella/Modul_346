#!/bin/bash
#envsubst tool installieren
sudo yum install gettext
# Array mit den ARNs
task_id1=$(aws ecs list-tasks --cluster M_346_ECS_cluster --output yaml-stream | head -n2 | tail -n1 | cut -d'/' -f3)
task_id2=$(aws ecs list-tasks --cluster M_346_ECS_cluster --output yaml-stream | head -n3 | tail -n1 | cut -d'/' -f3)
task_id3=$(aws ecs list-tasks --cluster M_346_ECS_cluster --output yaml-stream | tail -n1 | cut -d'/' -f3)
export tictactoeip=$(aws ecs describe-tasks --cluster M_346_ECS_cluster  --tasks $task_id1  --query "tasks[].attachments[].details[] | [?name=='networkInterfaceId'].value" --output text | xargs -I {} aws ec2 describe-network-interfaces --network-interface-ids {} --query "NetworkInterfaces[].Association.PublicIp" --output text)
export pongip=$(aws ecs describe-tasks --cluster M_346_ECS_cluster  --tasks $task_id2  --query "tasks[].attachments[].details[] | [?name=='networkInterfaceId'].value" --output text | xargs -I {} aws ec2 describe-network-interfaces --network-interface-ids {} --query "NetworkInterfaces[].Association.PublicIp" --output text)
export snakeip=$(aws ecs describe-tasks --cluster M_346_ECS_cluster  --tasks $task_id3  --query "tasks[].attachments[].details[] | [?name=='networkInterfaceId'].value" --output text | xargs -I {} aws ec2 describe-network-interfaces --network-interface-ids {} --query "NetworkInterfaces[].Association.PublicIp" --output text)
envsubst < index.html | tee index.html
