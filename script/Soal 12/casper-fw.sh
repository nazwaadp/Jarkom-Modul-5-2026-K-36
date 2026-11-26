# Node Casper

cat > /root/casper-fw.sh <<'EOF'
#!/bin/bash
iptables -F INPUT
iptables -F OUTPUT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
iptables -P INPUT DROP
grep -q "nameserver 8.8.8.8" /etc/resolv.conf || echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF
bash /root/casper-fw.sh
grep -q casper-fw.sh /root/.bashrc || echo 'bash /root/casper-fw.sh' >> /root/.bashrc

