# Node Balthasar

cat > /root/balthasar-fw.sh <<'EOF'
#!/bin/bash
iptables -F INPUT
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -s 192.229.4.58,192.229.4.66,192.229.4.67,192.229.4.68,192.229.3.130 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -j REJECT --reject-with tcp-reset
EOF
bash /root/balthasar-fw.sh
grep -q balthasar-fw /root/.bashrc || echo 'bash /root/balthasar-fw.sh' >> /root/.bashrc

