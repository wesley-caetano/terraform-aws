#!/bin/bash

apt update -y
apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
apt install ansible -y
apt install nfs-common -y
sudo mkdir -p /var/www/html/wp-content/uploads
echo "${efs_endpoint}:/ /var/www/html/wp-content/uploads nfs4 defaults,_netdev 0 0" | sudo tee -a /etc/fstab
sudo mount -a
cd /home/ubuntu
git clone https://github.com/wesley-caetano/ansible.git
cd ansible/
sed -i "s/seudbname/${db_name}/g" roles/wordpress/templates/wp-config.php.j2
sed -i "s/seudbuser/${db_username}/g" roles/wordpress/templates/wp-config.php.j2
sed -i "s/seudbsenha/${db_password}/g" roles/wordpress/templates/wp-config.php.j2
sed -i "s/seudbaddress/${db_address}/g" roles/wordpress/templates/wp-config.php.j2
sed -i "s/seudbmemcached/${memcached_endpoint}/g" roles/wordpress/templates/wp-config.php.j2
ansible-playbook wordpress.yml

#fim do codigo