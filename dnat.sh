# Generador de reglas DNAT para iptables GNU/LINUX
# Usando como ejemplo DNAT para RDP port
# DNAT rule generator for GNU / LINUX iptables
# ./ip.sh <numero de ips>
# ./ip.sh 100 -> 100 ips
# Autor:@morpheusec
#!/bin/bash
I=0
for OUTPUT in $(seq $1)
do
if [ $I -le 252 ]; then
printf "iptables -t nat -A PREROUTING -i eno1 -p tcp --dport %d -j DNAT --to  10.10.10.%d:3389\n" $((3389+$I)) $(($I+2))
let I++
fi
done
