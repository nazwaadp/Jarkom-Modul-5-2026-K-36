# Node Casper

cat > /root/casper-route.sh <<'EOF'
#!/bin/bash
ip route replace default via 192.229.4.57
EOF