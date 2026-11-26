# Node Pen-Pen, Zeruel, Armisael, Lilith

cat > /root/listener9000.sh <<'EOF'
#!/bin/bash
pgrep -f "nc -l -p 9000" > /dev/null || (while true; do nc -l -p 9000 >> /root/pesan-9000.log; done &)
EOF
bash /root/listener9000.sh
grep -q listener9000 /root/.bashrc || echo 'bash /root/listener9000.sh' >> /root/.bashrc
