#cat ~/.ssh/id_rsa.pub | ssh root@192.168.100.198 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
#cat ~/.ssh/id_rsa.pub | ssh root@192.168.100.200 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
#cat ~/.ssh/id_rsa.pub | ssh root@192.168.100.201 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
#cat ~/.ssh/id_rsa.pub | ssh root@192.168.100.202 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
#cat ~/.ssh/id_rsa.pub | ssh root@192.168.100.197 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
ssh-copy-id root@192.168.101.40
ssh-copy-id root@192.168.101.41
ssh-copy-id root@192.168.101.42
ssh-copy-id root@192.168.101.43
ssh-copy-id root@192.168.101.45
ssh-copy-id root@192.168.101.46
