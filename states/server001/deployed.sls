# vim /etc/salt/master.d/stratus.conf
    # [root@lvtjd1001 salt]# cat /etc/salt/master.d/stratus.conf
    # use_superseded:
    #   - module.run

# hostnamectl set-hostname lvtjd1001.jd1.demeron.com
network.mod_hostname:
  module.run:
    - network.mod_hostname:
      - hostname: lvtjd1001.jd1.demeron.com

# dnf update -y
Update all packages:
  pkg.uptodate:
    - refresh: True

# This makes the PS output more verbose for Salt.
PIP Install setproctitle:
  pip.installed:
    - name: setproctitle == 1.2.2

# curl -fsSL https://repo.saltproject.io/py3/redhat/8/x86_64/latest.repo | sudo tee /etc/yum.repos.d/salt.repo
# dnf install salt-master salt-minion
# systemctl enable salt-master
# systemctl enable salt-minion
# vim /etc/salt/minion.d/stratus.conf
    # [root@lvtjd1001 salt]# cat  /etc/salt/minion.d/stratus.conf
    # master: localhost

# dnf install httpd
Install Apache:
  pkg.installed:
    - pkgs:
      - httpd

# mkdir /var/www/html/files
Create folders:
  file.directory:
    - name: /var/www/html/files
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    
