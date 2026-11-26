# Node Tokyo3Core

cat >> /root/tokyo3core-fw.sh <<'EOF'
ipt INPUT -s 192.229.4.51 -p tcp -m multiport --dports 22,23,3306 -m conntrack --ctstate NEW -j LOG --log-prefix "SCAN-NERV: "
ipt INPUT -s 192.229.4.51 -p tcp -m multiport --dports 22,23,3306 -j REJECT --reject-with tcp-reset
EOF
bash /root/tokyo3core-fw.sh
