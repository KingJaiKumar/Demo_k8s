#!/bin/bash

if [ "$#" -eq  "0" ];
  then
    echo "No arguments supplied"
    exit 1
elif [ "$#" -eq  "1" ];
  then
    newSlot=$1
fi

if [ $newSlot == "blue" ]; then
    #kill -9 `cat /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt`
     #rm /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt
    helm upgrade deploy-test . --set productionSlot=blue --reuse-values --debug
    #nohup kubectl port-forward deployment/deploy-test-bg-deploy-blue 8080:8080  >> test.log 2>&1 &
     #echo $! > /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt
elif [ $newSlot == "green" ]; then
    #kill -9 `cat /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt`
     #rm /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt
    helm upgrade deploy-test . --set productionSlot=green --reuse-values --debug
    #nohup kubectl port-forward deployment/deploy-test-bg-deploy-green 8080:8080 >> test1.log 2>&1 &
     #echo $! > /home/ec2-user/blue-green/blue-green-helm-chart/save_pid.txt
fi
