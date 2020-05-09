#!/bin/bash

for name in deployments services PersistentVolumeClaim Ingress
do
list=$(kubectl get $name | awk 'NR>1' | awk '{print $1}')
for i in $list
    do
        if [ $i != "kubernetes" ] 
        then
        kubectl delete $name $i
        fi 
    done
done
