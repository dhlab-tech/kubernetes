#!/bin/bash

IPTABLES=/sbin/iptables

{% if iptables.flush_all %}
# Clean all
$IPTABLES -F
$IPTABLES -X
$IPTABLES -t nat -F
$IPTABLES -t nat -X
$IPTABLES -t mangle -F
$IPTABLES -t mangle -X
{% endif %}

function idempotent_add {
  RULE="$1"
  echo "Check rule $RULE"
  iptables-save | grep -- "$RULE"
  RC=$?
  if [[ $RC == 0 ]]; then
    echo "That rule already exists in rules list"
  else
    echo "That rule doesn't exists in rules list, add it"
    $IPTABLES $RULE
  fi
  return $RC
}

# Accept all from localhost
idempotent_add '-A INPUT -i lo -j ACCEPT'

# Allow established connections:
idempotent_add '-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT'

# Accept ICMP packets (it allows ping for example)
{% if iptables.icmp_allowed %}
idempotent_add '-A INPUT -p icmp -j ACCEPT'
{% endif %}

# Allow NTP traffic for time synchronization.
{% if iptables.ntp_allowed %}
idempotent_add '-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT'
idempotent_add '-A INPUT -p udp -m udp --sport 123 -j ACCEPT'
{% endif %}

# Allowed ports.
{% for port in iptables.default_allowed_tcp_ports %}
idempotent_add '-A INPUT -p tcp -m tcp --dport {{port}} -j ACCEPT'
{% endfor %}
{% for port in iptables.group_allowed_tcp_ports %}
idempotent_add '-A INPUT -p tcp -m tcp --dport {{port}} -j ACCEPT'
{% endfor %}
{% for port in iptables.host_allowed_tcp_ports %}
idempotent_add '-A INPUT -p tcp -m tcp --dport {{port}} -j ACCEPT'
{% endfor %}
{% for port in iptables.default_allowed_udp_ports %}
idempotent_add '-A INPUT -p udp -m udp --dport {{port}} -j ACCEPT'
{% endfor %}
{% for port in iptables.group_allowed_udp_ports %}
idempotent_add '-A INPUT -p udp -m udp --dport {{port}} -j ACCEPT'
{% endfor %}
{% for port in iptables.host_allowed_udp_ports %}
idempotent_add '-A INPUT -p udp -m udp --dport {{port}} -j ACCEPT'
{% endfor %}

# Raw rules
{% for rule in iptables.raw_rules %}
idempotent_add '{{rule}}'
{% endfor %}

# Drop all other
{% if iptables.deny_all_unallowed %}
$IPTABLES -t filter --policy INPUT DROP
{% endif %}
