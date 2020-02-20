export GOVC_URL='Vcenterdevops.sandz.com.ph'
export GOVC_USERNAME='administrator@vsphere.local'
export GOVC_PASSWORD='P@ssw0rd'
export GOVC_INSECURE=1
export GOVC_DATASTORE='DevOps'
export GOVC_NETWORK='No VLAN'
export GOVC_RESOURCE_POOL=/Datacenter/host/devops/Resources/do
govc about
govc import.spec ~/Downloads/rhcos-4.3.0-x86_64-vmware.ova | python -m json.tool > rhcos.json
#govc import.spec ~/Downloads/rhcos-4.3.0-x86_64-vmware.ova | python -m json.tool > nsx-manager.json
govc import.ova -options=rhcos.json -name=rhcos-4.3.0 \
 -pool=/Datacenter/host/devops/Resources/do ~/Downloads/rhcos-4.3.0-x86_64-vmware.ova
govc vm.markastemplate do/rhcos-4.3.0
scp bootstrap.ign root@192.168.101.22:/usr/share/nginx/html
scp bootstrap.ign root@lb.kube.sandz2.com/ph:/var/www/html/
curl -I http://lb.kube.sandz2.com.ph:8080/bootstrap.ign
terraform init
terraform plan
terraform apply -auto-approve

openshift-install --dir=. wait-for bootstrap-complete --log-level debug

terraform destroy -auto-approve

guest_network: 'No VLAN'
guest_netmask: '255.255.255.0'
guest_gateway: '192.168.101.12'
guest_dns_server: '192.168.101.5'
guest_domain_name: 'kube.sandz.com.ph'

bootstrap_ip = "192.168.101.100"
control_plane_ips = ["192.168.101.101", "192.168.101.102", "192.168.101.103"]
compute_ips = ["192.168.101.104","192.168.101.105"]
haproxy-lb-0.kube.sandz.com.ph has address 192.168.101.26
haproxy-lb-1.kube.sandz.com.ph has address 192.168.101.79
haproxy-lb-2.kube.sandz.com.ph has address 192.168.101.78

sudo ifconfig eth0 192.168.101.100 netmask 255.255.255.0
sudo route add default gw 192.168.101.12 eth0