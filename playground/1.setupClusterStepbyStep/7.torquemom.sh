ansible-playbook 7.TorqueMon.yml --inventory $(echo node{1..4}.pbs.toy|tr " " ,) --connection podman
