#!/bin/bash
echo "============================================="
echo "A StatefulSet to be created."
echo "============================================="
cat ubuntu-sl.yaml
read line
echo "============================================="
echo "Creating the StatefulSet....."
echo "============================================="
echo "kubectl create -f ubuntu-sl.yaml"
kubectl create -f ubuntu-sl.yaml
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 3/8.)"
echo "======================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"8"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"8"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources'
read line
echo "=================================================================================="
echo "Resizing the pod (increasing the request of CPU to 7, which doesn't fit the host.)"
echo "=================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"7"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"7"}}}]}}}}'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 2/8.)"
echo "======================================================================================="
echo "kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"2"}, "limits":{"cpu":"8"}}}]}}}}'"
kubectl patch statefulset ubuntu-stset -p '{"spec":{"template":{"spec":{"containers":[{"name":"ubuntu-stset","resources":{"requests":{"cpu":"2"}, "limits":{"cpu":"8"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset ubuntu-stset -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset ubuntu-stset -o json | jq '.spec.template.spec.containers[0].resources'
