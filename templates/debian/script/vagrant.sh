date > /etc/vagrant_box_build_time

if ! id -u vagrant >/dev/null 2>&1; then
    # Vagrant user
    /usr/sbin/groupadd vagrant
    /usr/sbin/useradd vagrant -g vagrant -G sudo -d /home/vagrant -s /bin/bash --create-home
    echo "vagrant:vagrant" | chpasswd
fi

if [ -f /etc/debian_version ] && [[ `cat /etc/debian_version` == 5* ]]; then
    sed 's/vagrant ALL=(ALL) ALL/%vagrant ALL=NOPASSWD:ALL/' /etc/sudoers > /tmp/vagrant
    chmod 0440 /tmp/vagrant
    mv /tmp/vagrant /etc/sudoers
else
    echo "%vagrant ALL=NOPASSWD:ALL" > /tmp/vagrant
    chmod 0440 /tmp/vagrant
    mv /tmp/vagrant /etc/sudoers.d/
fi

# Install vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
