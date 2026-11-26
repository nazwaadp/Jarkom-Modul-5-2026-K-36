# Node Casper

cat > /root/casper-fw.sh <<'EOF'
#!/bin/bash
iptables -C INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null || iptables -I INPUT 1 -p icmp --icmp-type echo-request -j DROP
EOF
bash /root/casper-fw.sh
grep -q casper-fw.sh /root/.bashrc || echo 'bash /root/casper-fw.sh' >> /root/.bashrc
