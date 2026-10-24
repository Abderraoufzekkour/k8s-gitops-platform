# k3s Cluster Architecture

## Overview
Single-node k3s cluster running on Ubuntu 22.04 (VMware).

## Components
| Component | Version | Purpose |
|---|---|---|
| k3s | v1.36.5+k3s1 | Lightweight Kubernetes distribution |
| CoreDNS | built-in | Internal cluster DNS |
| local-path-provisioner | built-in | Dynamic volume provisioning |
| metrics-server | built-in | Resource metrics collection |

## Configuration Decisions
- **Traefik disabled** - replaced with ingress-nginx later
- **kubeconfig mode 0644** - kubectl access without sudo
- **Node labels** - environment=local, platform=k3s

## Cluster Info
- Node: ubuntu-workstation
- Role: control-plane
- CNI: Flannel (k3s default)
