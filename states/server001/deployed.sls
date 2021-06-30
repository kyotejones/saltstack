# Manual Steps:
# 
# curl -fsSL https://repo.saltproject.io/py3/redhat/8/x86_64/latest.repo | sudo tee /etc/yum.repos.d/salt.repo
# dnf install salt-master salt-minion
# systemctl enable salt-master
# systemctl enable salt-minion
# vim /etc/salt/minion.d/stratus.conf
    # [root@lvtjd1001 salt]# cat  /etc/salt/minion.d/stratus.conf
    # master: localhost
# firewall-cmd --add-port={4505/tcp,4506/tcp}
# firewall-cmd --add-port={4505/tcp,4506/tcp} --permanent

# vim /etc/salt/minion.d/stratus.conf
    # [root@lvtjd1001 salt]# cat /etc/salt/master.d/stratus.conf
    # use_superseded:
    #   - module.run

# python3 -m pip install -U pip
# python3 -m pip install pygit2
# vim /etc/salt/master.d/stratus.conf
    # fileserver_backend:
    #   - gitfs
    # gitfs_remotes:
    #   - https://github.com/kyotejones/saltstack:
    #     - root: states
# systemctl restart salt-master


# hostnamectl set-hostname lvtjd1001.jd1.demeron.com
{% set strTest = "lvtjd1001.jd1.demeron.com" %}
Change the hostname:
  module.run:
    - network.mod_hostname:
      - hostname: {{strTest}}
    - unless:
      - hostnamectl | grep {{strTest}}

# dnf update -y
Update all packages:
  pkg.uptodate:
    - refresh: True

# This makes the PS output more verbose for Salt.
PIP Install setproctitle:
  pip.installed:
    - name: setproctitle

# dnf install httpd
Install Apache:
  pkg.installed:
    - pkgs:
      - httpd

# systemctl enable httpd
# systemctl start httpd
Start and Enable HTTP Service:
  service.running:
    - name: httpd
    - enable: True

Open the Apache ports:
  firewalld.present:
    - name: public
    - services:
      - http
      - https

# mkdir /var/www/html/files
Create folders:
  file.directory:
    - name: /var/www/html/files
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    
Deploy an empty webpage:
  file.touch:
    - name: /var/www/html/index.html
    - unless:
      - ls -l /var/www/html/index.html