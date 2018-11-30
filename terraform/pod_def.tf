locals {
  blue_ocean = <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: blueocean-master
  labels:
    app: blueocean
spec:
  containers:
    - name: blueocean-master
      image: jenkinsci/blueocean:1.9.0
      ports:
      - containerPort: 8080
    - name: nginx-proxy
      image: nginx:1.15.7
      ports:
      - containerPort: 80
      volumeMounts:
        - name: nginx-config
          mountPath: /etc/nginx/nginx.conf
          subPath: nginx.conf
  volumes:
    - name: nginx-config
      configMap:
        name: confnginx
EOF
}
