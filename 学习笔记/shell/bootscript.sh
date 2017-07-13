#killall svnserve
#/usr/bin/svnserve --listen-port 7963 -d -r /home/svndata

#开启SSH服务
sudo systemctl start sshd.service

#开放防火墙端口
#sudo firewall-cmd --add-port=8080/tcp



#关闭防火墙
#sudo systemctl stop firewalld.service
