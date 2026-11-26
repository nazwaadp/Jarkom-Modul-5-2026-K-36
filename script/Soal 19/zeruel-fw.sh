# Node Zeruel

cat > /root/zeruel-fw.sh <<'EOF'
#!/bin/bash
iptables -C INPUT -s 192.229.4.83 -j DROP 2>/dev/null || iptables -I INPUT 1 -s 192.229.4.83 -j DROP
iptables -C OUTPUT -d 192.229.4.83 -j DROP 2>/dev/null || iptables -I OUTPUT 1 -d 192.229.4.83 -j DROP
EOF
bash /root/zeruel-fw.sh
grep -q zeruel-fw /root/.bashrc || echo 'bash /root/zeruel-fw.sh' >> /root/.bashrc