# Node Pen Pen

cat > /root/penpen-fw.sh <<'EOF'
#!/bin/bash
# Jadwal dalam WIB (script mengubahnya ke UTC karena iptables membaca UTC)
PILOT_START="08:00"
PILOT_STOP="16:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="17:00"
STAF_STOP="23:00"

PILOT="192.229.4.66,192.229.4.67,192.229.4.68,192.229.3.130"
STAF="192.229.4.74,192.229.4.75"
DUMMY="192.229.4.50,192.229.4.51,192.229.4.102"

to_utc() { date -u -d "@$(TZ=WIB-7 date -d "2000-01-02 $1" +%s)" +%H:%M; }
P1=$(to_utc "$PILOT_START"); P2=$(to_utc "$PILOT_STOP")
S1=$(to_utc "$STAF_START");  S2=$(to_utc "$STAF_STOP")

iptables -F INPUT

# Terduga Dummy System: selalu ditolak
iptables -A INPUT -s $DUMMY -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $DUMMY -p tcp --dport 80 -j REJECT --reject-with tcp-reset

# Pilot: hanya jam dan hari yang cocok
iptables -A INPUT -s $PILOT -p icmp --icmp-type echo-request -m time --timestart $P1 --timestop $P2 --weekdays $PILOT_DAYS -j ACCEPT
iptables -A INPUT -s $PILOT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $PILOT -p tcp --dport 80 -m time --timestart $P1 --timestop $P2 --weekdays $PILOT_DAYS -j ACCEPT
iptables -A INPUT -s $PILOT -p tcp --dport 80 -j REJECT --reject-with tcp-reset

# Staf Geofront: hanya jam yang cocok, setiap hari
iptables -A INPUT -s $STAF -p icmp --icmp-type echo-request -m time --timestart $S1 --timestop $S2 -j ACCEPT
iptables cat > /root/penpen-fw.sh <<'EOF'
#!/bin/bash
# Jadwal dalam WIB (script mengubahnya ke UTC karena iptables membaca UTC)
PILOT_START="08:00"
PILOT_STOP="16:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="17:00"
STAF_STOP="23:00"

PILOT="192.229.4.66,192.229.4.67,192.229.4.68,192.229.3.130"
STAF="192.229.4.74,192.229.4.75"
DUMMY="192.229.4.50,192.229.4.51,192.229.4.102"

to_utc() { date -u -d "@$(TZ=WIB-7 date -d "2000-01-02 $1" +%s)" +%H:%M; }
P1=$(to_utc "$PILOT_START"); P2=$(to_utc "$PILOT_STOP")
S1=$(to_utc "$STAF_START");  S2=$(to_utc "$STAF_STOP")

iptables -F INPUT

# Terduga Dummy System: selalu ditolak
iptables -A INPUT -s $DUMMY -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $DUMMY -p tcp --dport 80 -j REJECT --reject-with tcp-reset

# Pilot: hanya jam dan hari yang cocok
iptables -A INPUT -s $PILOT -p icmp --icmp-type echo-request -m time --timestart $P1 --timestop $P2 --weekdays $PILOT_DAYS -j ACCEPT
iptables -A INPUT -s $PILOT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $PILOT -p tcp --dport 80 -m time --timestart $P1 --timestop $P2 --weekdays $PILOT_DAYS -j ACCEPT
iptables -A INPUT -s $PILOT -p tcp --dport 80 -j REJECT --reject-with tcp-reset

# Staf Geofront: hanya jam yang cocok, setiap hari
iptables -A INPUT -s $STAF -p icmp --icmp-type echo-request -m time --timestart $S1 --timestop $S2 -j ACCEPT
iptables -A INPUT -s $STAF -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $STAF -p tcp --dport 80 -m time --timestart $S1 --timestop $S2 -j ACCEPT
iptables -A INPUT -s $STAF -p tcp --dport 80 -j REJECT --reject-with tcp-reset
EOF
bash /root/penpen-fw.sh
grep -q penpen-fw /root/.bashrc || echo 'bash /root/penpen-fw.sh' >> /root/.bashrc-A INPUT -s $STAF -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -s $STAF -p tcp --dport 80 -m time --timestart $S1 --timestop $S2 -j ACCEPT
iptables -A INPUT -s $STAF -p tcp --dport 80 -j REJECT --reject-with tcp-reset
EOF
bash /root/penpen-fw.sh
grep -q penpen-fw /root/.bashrc || echo 'bash /root/penpen-fw.sh' >> /root/.bashrc