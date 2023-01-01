# Istio

```bash
kubectl label namespace modern-dev istio-injection=enabled --overwrite
```

Injection occurs at pod creation time. Kill the running pod and verify a new pod is created with the injected sidecar. The original pod has 1/1 READY containers, and the pod with injected sidecar has 2/2 READY containers.