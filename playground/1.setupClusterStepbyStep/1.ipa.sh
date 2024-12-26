sync; echo 3 > /proc/sys/vm/drop_caches

ansible-playbook 1.IPA.yml -i localhost,

podman logs ipa.pbs.toy
