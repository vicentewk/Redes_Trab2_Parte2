#Regras do iptables
#INPUT - Entrada
#Limitação de acesso à porta 443 nas conexões de entrada
#sudo iptables -A INPUT -p tcp --destination-port 443 -j DROP
#Abre a porta 22 para conexão por qualquer dispositivo
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#Limitação de aceso à porta 80 nas conexões de entrada
#sudo iptables -A INPUT -p tcp --destination-port 80 -j DROP

#FORWARD - Redirecionamento
#Direcionamento de todas as solicitações realizadas pela faixa 122.1 para o localhost do firewall
sudo iptables -t nat -I PREROUTING -p tcp -d 192.168.0.0/24  --dport 80 -j DNAT --to-destination 127.0.0.1:80

#OUTPUT - Saída
#limitação de acesso ao G1 - Drop de conexão
sudo iptables -A OUTPUT -d g1.globo.com -j DROP


sudo iptables-save