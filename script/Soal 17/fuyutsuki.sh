# Node Fuyutsuki

cat > /root/fuyutsuki-nat.sh <<'EOF'
#!/bin/bash
iptables -t nat -C PREROUTING -i eth1 -s 192.229.4.58 -d 192.229.4.82 -p tcp -j DNAT --to-destination 192.229.3.194 2>/dev/null || iptables -t nat -A PREROUTING -i eth1 -s 192.229.4.58 -d 192.229.4.82 -p tcp -j DNAT --to-destination 192.229.3.194
EOF
bash /root/fuyutsuki-nat.sh
grep -q fuyutsuki-nat /root/.bashrc || echo 'bash /root/fuyutsuki-nat.sh' >> /root/.bashrc

