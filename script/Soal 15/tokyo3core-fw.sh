# Node Tokyo3Core

cat > /root/tokyo3core-fw.sh <<'EOF'
#!/bin/bash
ipt() { iptables -C "$@" 2>/dev/null || iptables -A "$@"; }
ipt INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT
ipt INPUT -p icmp --icmp-type echo-request -j DROP
EOF
bash /root/tokyo3core-fw.sh
grep -q tokyo3core-fw /root/.bashrc || echo 'bash /root/tokyo3core-fw.sh' >> /root/.bashrc


