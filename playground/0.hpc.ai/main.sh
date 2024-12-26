time ansible-playbook main1.yml -i hosts.yml

echo Wait 200 seconds here until IPA server is up
podman logs ipa.hpc.ai | grep "FreeIPA server configured"
time until [ $? -eq 0 ]; do 
  sleep 10
  echo Let\'s wait for another 10 seconds
  podman logs ipa.hpc.ai | grep "FreeIPA server configured"
done

time ansible-playbook main2.yml -i hosts.yml
