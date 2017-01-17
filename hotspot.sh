#!/bin/bash

# Check if running in privileged mode
if [ ! -w "/sys" ] ; then
    echo "[Error] Not running in privileged mode."
fi

function dnsmasq_main() {
    # Default values
    #

    # Generate config file for dnsmasq
    rm /etc/dnsmasq.conf
    if [ ! -f "/etc/dnsmasq.conf" ] ; then
        cat > "/etc/dnsmasq.conf" <<EOF
interface=${INTERFACE}
dhcp-range=10.0.0.10,10.0.0.250,12h
dhcp-option=3,10.0.0.1
dhcp-option=6,10.0.0.1
server=8.8.8.8
log-queries
log-dhcp
EOF

  fi
}

function hostapd_main() {
    # Default values
    true ${SUBNET:=192.168.254.0}
    true ${AP_ADDR:=192.168.254.1}
    true ${SSID:=g8}
    true ${CHANNEL:=11}
    true ${WPA_PASSPHRASE:=passw0rd}
    true ${HW_MODE:=g}
    true ${DRIVER:=nl80211}

    # Generate config file for hostapd
    mkdir -p "/etc/hostapd"
    if [ ! -f "/etc/hostapd/hostapd.conf" ] ; then
        cat > "/etc/hostapd/hostapd.conf" <<EOF
interface=${INTERFACE}
driver=${DRIVER}
ssid=${SSID}
hw_mode=${HW_MODE}
channel=${CHANNEL}
wpa=1
wpa_passphrase=${WPA_PASSPHRASE}
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP CCMP
wpa_ptk_rekey=600
EOF
fi
}

function start_hotspot() {
  #nmcli radio wifi off
  #rfkill unblock wlan
  # Configure IP address for WLAN
  ifconfig ${INTERFACE} 10.0.0.1/24 up
  # Start DHCP/DNS server
  #sudo dnsmasq -C /etc/dnsmasq.conf -H /etc/fakehosts.conf -d
  cat /etc/dnsmasq.conf
  service dnsmasq restart
  # Enable routing
  sysctl net.ipv4.ip_forward=1
  # Enable NAT
  iptables -t nat -A POSTROUTING -o ${OUTGOINGS} -j MASQUERADE
  # route traffic through MITMproxy
  # sudo iptables -t nat -A PREROUTING -i ${INTERFACE} -p tcp --dport 443 -j REDIRECT --to-port 8080
  # sudo iptables -t nat -A PREROUTING -i ${INTERFACE} -p tcp --dport 80 -j REDIRECT --to-port 8080
  # Run access point daemon
  hostapd /etc/hostapd/hostapd.conf
  # Stop
  # Disable NAT
  iptables -D POSTROUTING -t nat -o ${OUTGOINGS} -j MASQUERADE
  # Delete routing rules for mitmproxy
  # sudo iptables -t nat -D PREROUTING -i ${INTERFACE} -p tcp --dport 443 -j REDIRECT --to-port 8080
  # sudo iptables -t nat -D PREROUTING -i ${INTERFACE} -p tcp --dport 80 -j REDIRECT --to-port 8080
  # Disable routing
  sysctl net.ipv4.ip_forward=0
  # Disable DHCP/DNS server
  service dnsmasq stop
  service hostapd stop

}

# Check environment variables
if [ "${INTERFACE}" ] ; then
    hostapd_main
    dnsmasq_main
    start_hotspot
else
    echo "[Error] An interface must be specified."
fi
