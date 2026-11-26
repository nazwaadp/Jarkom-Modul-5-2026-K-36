# Node Shigeru

cat >> /root/shigeru-fw.sh <<'EOF'
ins() { c=$1; shift; iptables -C $c "$@" 2>/dev/null || iptables -I $c 1 "$@"; }
ins FORWARD -d 192.229.4.83 -j DROP
ins FORWARD -s 192.229.4.83 -j DROP
ins INPUT -s 192.229.4.83 -j DROP
ins OUTPUT -d 192.229.4.83 -j DROP
EOF
bash /root/shigeru-fw.sh
