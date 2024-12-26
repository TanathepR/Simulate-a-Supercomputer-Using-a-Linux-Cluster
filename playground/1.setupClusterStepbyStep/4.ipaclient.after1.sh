echo wait 150 seconds here until IPA server is up
podman logs ipa.pbs.toy | grep "FreeIPA server configured"
until [ $? -eq 0 ]; do 
sleep 10
echo let\'s wait for another 10 seconds
podman logs ipa.pbs.toy | grep "FreeIPA server configured"
done

podman exec --tty --interactive ipa.pbs.toy kadmin.local ktadd -norandkey admin
podman exec --tty --interactive ipa.pbs.toy kinit -k admin
podman exec --tty --interactive ipa.pbs.toy klist
podman exec --tty --interactive ipa.pbs.toy ipa user-add munge --first munge --last munge
podman exec --tty --interactive ipa.pbs.toy ipa user-add hpc --first hpc --last hpc
podman exec --tty --interactive ipa.pbs.toy ipa user-mod hpc --sshpubkey="ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBlpC4ImvIS6NryioaSB1gdHbCkYbV1AOv3FmhS1I/PFeplxl6dzdo8sddeuOOf6av+rPl5erCFsTExCs2h5kS8="
podman exec --tty --interactive ipa.pbs.toy ipa dnszone-mod pbs.toy. --allow-sync-ptr=True
podman exec --tty --interactive login.pbs.toy id munge
podman exec --tty --interactive login.pbs.toy dig -x 10.20.25.253 @10.20.25.253

ansible-playbook 4.IPAClient.yml --inventory $(echo {login,torque}.pbs.toy node{1..4}.pbs.toy|tr " " ,) --connection podman

podman exec --tty --interactive ipa.pbs.toy ipa host-find
podman exec --tty --interactive ipa.pbs.toy ipa user-find
podman exec --tty --interactive ipa.pbs.toy ipa dnszone-find
podman exec --tty --interactive ipa.pbs.toy ipa dnsrecord-find pbs.toy.

podman exec --tty --interactive login.pbs.toy id munge
podman exec --tty --interactive login.pbs.toy dig torque.pbs.toy @10.20.24.253
