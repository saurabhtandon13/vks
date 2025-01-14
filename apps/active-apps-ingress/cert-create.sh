kubectl create ns activeapps

sleep 3

openssl req -x509 -nodes -days 365 \
-newkey rsa:4096 \
-out activeapps-ingress-tls.crt \
-keyout activeapps-ingress-tls.key \
-subj "/CN=activeapps.corp.internal/O=activeapps-ingress-tls"

kubectl create secret tls activeapps-ingress-tls --key activeapps-ingress-tls.key --cert activeapps-ingress-tls.crt -n activeapps
