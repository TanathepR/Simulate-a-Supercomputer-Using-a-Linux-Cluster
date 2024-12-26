time ansible-playbook --inventory $(echo {login,torque}.pbs.toy node{1..4}.pbs.toy|tr " " ,) --connection podman 3.1.EnterpriseLinux9.yml
time ansible-playbook --inventory $(echo {login,torque}.pbs.toy node{1..4}.pbs.toy|tr " " ,) --connection podman 3.2.SSH.yml
time ansible-playbook --inventory $(echo {login,torque}.pbs.toy node{1..4}.pbs.toy|tr " " ,) --connection podman 3.3.HostBasedAuthentication.yml

podman exec --tty --interactive login.pbs.toy ps aux
podman exec --tty --interactive login.pbs.toy pstree --thread-names --arguments
podman exec --tty --interactive login.pbs.toy ping node2 -c 2
