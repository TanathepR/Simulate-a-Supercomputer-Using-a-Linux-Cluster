ansible-playbook 9.GROMACS.yml --inventory $(echo node{1..4}.pbs.toy|tr " " ,) --connection podman
