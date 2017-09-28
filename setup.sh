git clone https://github.com/AurelienGalicher/influxdb.git
cd influxdb
openssl genrsa -out etc/server.key 1024
touch etc/openssl.cnf
cat >> etc/openssl.cnf <<EOF
[ req ]
prompt = no
distinguished_name = req_distinguished_name

[ req_distinguished_name ]
C = GB
ST = Test State
L = Test Locality
O = Org Name
OU = Org Unit Name
CN = Common Name
emailAddress = test@email.com
EOF
openssl req -config etc/openssl.cnf -new -key etc/server.key -out etc/server.csr
openssl x509 -req -days 1024 -in etc/server.csr -signkey etc/server.key -out etc/server.crt
docker-compose up