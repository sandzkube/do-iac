// ID identifying the cluster to create. Use your username so that resources created can be tracked back to you.
cluster_id = "kube"

// Domain of the cluster. This should be "${cluster_id}.${base_domain}".
cluster_domain = "kube.sandz2.com.ph"

// Base domain from which the cluster domain is a subdomain.
base_domain = "sandz2.com.ph"

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".
vsphere_server = "Vcenterdevops.sandz.com.ph"

// User on the vSphere server.
vsphere_user = "administrator@vsphere.local"

// Password of the user on the vSphere server.
vsphere_password = "P@ssw0rd"

// Name of the vSphere cluster. The dev cluster is "devel".
vsphere_cluster = "devops"

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = "Datacenter"

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = "DevOps"

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "rhcos-4.3.0"

// The machine_cidr where IP addresses will be assigned for cluster nodes.
// Additionally, IPAM will assign IPs based on the network ID. 
machine_cidr = "192.168.101.100/30"

vm_network = "No VLAN"

// The number of control plane VMs to create. Default is 3.
control_plane_count = 3

// The number of compute VMs to create. Default is 3.
compute_count = 1

// URL of the bootstrap ignition. This needs to be publicly accessible so that the bootstrap machine can pull the ignition.
bootstrap_ignition_url = "http://192.168.101.22/bootstrap.ign"

// Ignition config for the control plane machines. You should copy the contents of the master.ign generated by the installer.
control_plane_ignition = <<END_OF_MASTER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.kube.sandz2.com.ph:22623/config/master","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJV3pmYnBqb3hHYmN3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURJeE9UQTJNamswTUZvWApEVE13TURJeE5qQTJNamswTUZvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUE4S3JFUytTVU5vNTAKSW1nR1g0bFAyUmVwQW1td3Brbkl1MVpRdkV6cHc4WFRhMTFDSXM1SWJLY1lvWEFoWnk2czlkZlduOHo2S3JRagpBeUR5V2FlejRIKzBiMnYrTThrWW1wbW90VGFjeWtoZ3oxNnVranRKR29FM1pTVThqQWJ1NFlnOCtBSE1NVDV1CnpUdXQzbXJnU3BpeXVIUDZOU2kvYnVTcGNIcnYyTGZOMEkwOTNNNmpmVlBaZGF6N2hGTVhvOUtjeGdrSkRySmoKSWhUdG9XOXd3SkNxOTEzNjBTTld2cCtBcDZoNlBYQng1YzVEQWNMV2s0YWF6QnF2QXZoQXhtUFNDZjdiU0p6RQpiL0x6VU43cG5QcXRvekVpcCtQcEhla1hsUFhQLzY2ZVJ3dkZ6QnJ5RmFCa3NkaXdBUDBuRm90azdiZnFwc1FHCjdhNng5TE41aXdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVWNHOWk0bUtFb1hDOVphejZWd2FoaE5sWmI1NHdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUxkU3d5b3h6NmtZclZLR1IrdTNzMzNWUTh1enBtZ012TTlDRUdVclI0NWwyNmxvRER1cXU4cXo4cnAyCjZhOFZUby9ZbS9YOGJRc2pvYTgyeTBJbTFldWVxTittTjlGb2U4Z0tRbFhjMVJONEhVbmYyb1BHaHFyMHJNczIKdHJjOTlPUFlUUEVNWXdOTFRwdDlpRFlXelNOQjF5OWZsS0lWYUlxRmt6SlFJMmZHcDZUWVRXOTVEZW1sV05LNQptaS94ZEFiMS9sWWhnazJnMkJCaEczQTVRamh1VG1Od0xQUGNFT3JDcGtyRGJoMzZ5SUdHTGJuNFRmT08wTUpTCm9zb1Y2R1BNamhRcVRNckIxOVJpMDZpVVJVYWh6QzVMZ2pHeEpkQUxjNGFDQ3ZFTkl1TTdKMkxqb2g4STdmN2QKMUs3b3U4NTV2a3JlbWNpN09rdzdBU25wcWhzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_MASTER_IGNITION

// Ignition config for the compute machines. You should copy the contents of the worker.ign generated by the installer.
compute_ignition = <<END_OF_WORKER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.kube.sandz2.com.ph:22623/config/worker","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJV3pmYnBqb3hHYmN3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURJeE9UQTJNamswTUZvWApEVE13TURJeE5qQTJNamswTUZvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUE4S3JFUytTVU5vNTAKSW1nR1g0bFAyUmVwQW1td3Brbkl1MVpRdkV6cHc4WFRhMTFDSXM1SWJLY1lvWEFoWnk2czlkZlduOHo2S3JRagpBeUR5V2FlejRIKzBiMnYrTThrWW1wbW90VGFjeWtoZ3oxNnVranRKR29FM1pTVThqQWJ1NFlnOCtBSE1NVDV1CnpUdXQzbXJnU3BpeXVIUDZOU2kvYnVTcGNIcnYyTGZOMEkwOTNNNmpmVlBaZGF6N2hGTVhvOUtjeGdrSkRySmoKSWhUdG9XOXd3SkNxOTEzNjBTTld2cCtBcDZoNlBYQng1YzVEQWNMV2s0YWF6QnF2QXZoQXhtUFNDZjdiU0p6RQpiL0x6VU43cG5QcXRvekVpcCtQcEhla1hsUFhQLzY2ZVJ3dkZ6QnJ5RmFCa3NkaXdBUDBuRm90azdiZnFwc1FHCjdhNng5TE41aXdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVWNHOWk0bUtFb1hDOVphejZWd2FoaE5sWmI1NHdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUxkU3d5b3h6NmtZclZLR1IrdTNzMzNWUTh1enBtZ012TTlDRUdVclI0NWwyNmxvRER1cXU4cXo4cnAyCjZhOFZUby9ZbS9YOGJRc2pvYTgyeTBJbTFldWVxTittTjlGb2U4Z0tRbFhjMVJONEhVbmYyb1BHaHFyMHJNczIKdHJjOTlPUFlUUEVNWXdOTFRwdDlpRFlXelNOQjF5OWZsS0lWYUlxRmt6SlFJMmZHcDZUWVRXOTVEZW1sV05LNQptaS94ZEFiMS9sWWhnazJnMkJCaEczQTVRamh1VG1Od0xQUGNFT3JDcGtyRGJoMzZ5SUdHTGJuNFRmT08wTUpTCm9zb1Y2R1BNamhRcVRNckIxOVJpMDZpVVJVYWh6QzVMZ2pHeEpkQUxjNGFDQ3ZFTkl1TTdKMkxqb2g4STdmN2QKMUs3b3U4NTV2a3JlbWNpN09rdzdBU25wcWhzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_WORKER_IGNITION

// Set ipam and ipam_token if you want to use the IPAM server to reserve IP
// addresses for the VMs.

// Address or hostname of the IPAM server from which to reserve IP addresses for the cluster machines.
//ipam = "192.168.101.252"

// Token to use to authenticate with the IPAM server.
//ipam_token = "TOKEN_FOR_THE_IPAM_SERVER"


// Set bootstrap_ip, control_plane_ip, and compute_ip if you want to use static
// IPs reserved someone else, rather than the IPAM server.

// The IP address to assign to the bootstrap VM.
//bootstrap_ip = "10.0.0.10"

// The IP addresses to assign to the control plane VMs. The length of this list
// must match the value of control_plane_count.
//control_plane_ips = ["10.0.0.20", "10.0.0.21", "10.0.0.22"]

// The IP addresses to assign to the compute VMs. The length of this list must
// match the value of compute_count.
//compute_ips = ["10.0.0.30", "10.0.0.31", "10.0.0.32"]
bootstrap_ip = "192.168.101.100"
control_plane_ips = ["192.168.101.101", "192.168.101.102", "192.168.101.103"]
compute_ips = ["192.168.101.104"]
