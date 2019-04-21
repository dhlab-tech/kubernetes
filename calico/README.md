# dhlab.calico

Ansible role to install [Project Calico][1] to the k8s cluster.

[1]: https://www.projectcalico.org/

## Requirements

K8s cluster has to be installed and ETCD has to be running.

## Role Variables

Can be found in `defaults/main.yml`

## Dependencies

None.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: k8s
      roles:
         - { role: dhlab.calico, tags: calico }

## License

Apache License.

## Author Information

Stan Bogatkin (https://sbog.ru)
