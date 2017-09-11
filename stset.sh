#!/bin/bash
echo "============================================="
echo "A StatefulSet to be created."
echo "============================================="
cat ubuntu.yaml
read line
echo "============================================="
echo "Creating the StatefulSet....."
echo "============================================="
echo "kubectl create -f ubuntu.yaml"
kubectl create -f ubuntu.yaml
read line
echo "============================================="
echo "The resources allocated to the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources, .status"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources, .status'
read line
echo "======================================================================================="
echo "Resizing the pod (decreasing the request/limit of CPU to 3/16.)"
echo "======================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"16"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"16"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources, .status"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources, .status'
read line
echo "=================================================================================="
echo "Resizing the pod (increasing the request of CPU to 15, which doesn't fit the host.)"
echo "=================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"15"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"15"}}}]}}}}'
read line
echo "============================================="
echo "The Status of the pod indicating the failure."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources, .status"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources, .status'
read line
echo "=================================================="
echo "Resizing the pod (reducing the request of CPU to 1)"
echo "=================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"1"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"1"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources, .status"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources, .status'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 3/16.)"
echo "======================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"16"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"16"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources, .status"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources, .status'
