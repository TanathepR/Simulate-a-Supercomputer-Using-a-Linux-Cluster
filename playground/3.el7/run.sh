time ansible-playbook --inventory node4.pbs.toy, --connection podman el7.yml
#time ansible-playbook --inventory $(echo {login,torque}.hpc.ai node{1..4}.hpc.ai|tr " " ,) --connection podman el7.yml
#time ansible-playbook --inventory $(echo {login,torque}.pbs.toy node{1..4}.pbs.toy|tr " " ,) --connection podman el7.yml
