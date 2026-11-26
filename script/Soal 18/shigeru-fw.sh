# Node Shigeru

cat > /root/shigeru-fw.sh <<'EOF'
#!/bin/bash
ipt() { iptables -C "$@" 2>/dev/null || iptables -A "$@"; }
ipt FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
ipt FORWARD -i eth0 -s 192.229.4.56/29 -p icmp --icmp-type echo-request -j ACCEPT
ipt FORWARD -i eth0 -j DROP
EOF
bash /root/shigeru-fw.sh
grep -q shigeru-fw /root/.bashrc || echo 'bash /root/shigeru-fw.sh' >> /root/.bashrc

