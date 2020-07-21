| | release | version |
|---|---|---|
| CNI | https://github.com/containernetworking/cni | v0.6.0 |
| CNI-plugins | https://github.com/containernetworking/plugins | 0.8.0 |
| CRI-O | https://github.com/cri-o/cri-o | v1.15.2 |
| crictl | https://github.com/kubernetes-sigs/cri-tools | v1.15.0 |
| runc | https://github.com/opencontainers/runc | v1.0.0-rc5 |
| calico plugin | https://github.com/projectcalico/cni-plugin | v3.7.2 |
| calico ipam plugin | https://github.com/projectcalico/cni-plugin | v3.7.2 |

##build CRI-O
```bash
git clone https://github.com/cri-o/cri-o
cd cri-o
make binaries
```
