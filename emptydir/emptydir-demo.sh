#!/bin/bash
echo "============================================="
echo "This is the yaml file of a pod to be created."
echo "============================================="
cat emptydir-pod.yaml
read line
echo "============================================="
echo "Creating the pod....."
echo "============================================="
echo "kubectl create -f emptydir-pod.yaml"
kubectl create -f emptydir-pod.yaml
read line
echo "============================================="
echo "The resources allocated to the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq .spec.containers[0].resources, .status.conditions"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 4/16.)"
echo "                 (increasing the request/limit of Memory's limit to 2Gi/3Gi.)"
echo "======================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"4", "memory":"2Gi"}, "limits":{"cpu":"16","memory":"3Gi"}}}]}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'
read line
echo "=================================================================================="
echo "Resizing the pod (increasing the request of CPU to 15, which doesn't fit the host.)"
echo "=================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"15"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"15"}}}]}}'
read line
echo "============================================="
echo "The Status of the pod indicating the failure."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'
read line
echo "=================================================="
echo "Resizing the pod (reducing the request of CPU to 1)"
echo "=================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"1"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"1"}}}]}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 4/16.)"
echo "                 (increasing the request/limit of Memory's limit to 2Gi/3Gi.)"
echo "======================================================================================="
echo "kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"2", "memory":"1Gi"}, "limits":{"cpu":"12","memory":"2Gi"}}}]}}'"
kubectl patch pod ubuntu -p '{"spec":{"containers":[{"name":"ubuntu","resources":{"requests":{"cpu":"2", "memory":"1Gi"}, "limits":{"cpu":"12","memory":"2Gi"}}}]}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'"
kubectl get pod ubuntu -o json | jq '.spec.containers[0].resources, .status.conditions'
