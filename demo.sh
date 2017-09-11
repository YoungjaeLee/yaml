#!/bin/bash
echo "============================================="
echo "This is the yaml file of a pod to be created."
echo "============================================="
cat pod.yaml
read line
echo "============================================="
echo "Creating the pod....."
echo "============================================="
echo "kubectl create -f pod.yaml"
kubectl create -f pod.yaml
read line
echo "============================================="
echo "The resources allocated to the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq .spec.containers[0].resources, .spec.nodeName, .status.conditions"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the cpu's request to 4 and the the memory's request to 2Gi.)"
echo "                 (increasing the cpu's limit to 16 and the the memory's limit to 3Gi.)"
echo "======================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'
read line
echo "=================================================================================="
echo "Resizing the pod (increasing the cpu's request to 15, which doesn't fit the host.)"
echo "=================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"15"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"15"}}}]}}'
read line
echo "============================================="
echo "The Status of the pod indicating the failure."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the cpu's request to 4 and the the memory's request to 1Gi.)"
echo "                 (increasing the cpu's limit to 12 and the the memory's limit to 2Gi.)"
echo "======================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .spec.nodeName, .status.conditions'
