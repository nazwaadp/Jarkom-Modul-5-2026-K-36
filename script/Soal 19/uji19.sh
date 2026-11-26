# Node Armisael

cat > /root/uji19.sh <<'EOF'
#!/bin/bash
for ip in 8.8.8.8 192.229.4.82 192.229.4.74 192.229.4.81; do
  ping -c 2 -W 2 $ip > /dev/null 2>&1 && echo "ping $ip OK" || echo "ping $ip GAGAL"
done
nc -w 3 8.8.8.8 53 < /dev/null > /dev/null 2>&1 && echo "nc Seele:53 OK" || echo "nc Seele:53 GAGAL"
nc -w 3 192.229.4.82 9000 < /dev/null > /dev/null 2>&1 && echo "nc Zeruel:9000 OK" || echo "nc Zeruel:9000 GAGAL"
nc -w 3 192.229.4.74 9000 < /dev/null > /dev/null 2>&1 && echo "nc Lilith:9000 OK" || echo "nc Lilith:9000 GAGAL"
EOF

# Node Zeruel

cat > /root/uji19.sh <<'EOF'
#!/bin/bash
for ip in 8.8.8.8 192.229.4.74 192.229.4.81 192.229.4.83; do
  ping -c 2 -W 2 $ip > /dev/null 2>&1 && echo "ping $ip OK" || echo "ping $ip GAGAL"
done
nc -w 3 8.8.8.8 53 < /dev/null > /dev/null 2>&1 && echo "nc Seele:53 OK" || echo "nc Seele:53 GAGAL"
nc -w 3 192.229.4.74 9000 < /dev/null > /dev/null 2>&1 && echo "nc Lilith:9000 OK" || echo "nc Lilith:9000 GAGAL"
nc -w 3 192.229.4.83 9000 < /dev/null > /dev/null 2>&1 && echo "nc Armisael:9000 OK" || echo "nc Armisael:9000 GAGAL"
EOF
