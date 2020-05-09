## Commands

1. Apply deploymnet file
```
$ kubectl apply -f client-deployment.yaml
deployment.apps/client-deployment configured

$ kubectl get deployments
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
client-deployment   3/3     1            3           4m23s

## cleaning deployment
$ kubectl delete deployments client-deployment
deployment.extensions "client-deployment" deleted
```
2. Apply ipservice file

```
$ kubectl apply -f client-cluster-ip-service.yaml
service/client-cluster-ip-service created

$ kubectl get services
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
client-cluster-ip-service   ClusterIP   10.98.184.125   <none>        3000/TCP   31s
kubernetes                  ClusterIP   10.96.0.1       <none>        443/TCP    22m

# clean up if required
$ kubectl delete service client-cluster-ip-service
service "client-cluster-ip-service" deleted
```

3. Command to apply all files in a directory
```
# k8s is a directory with all config files
$ kubectl apply -f k8s
service/client-cluster-ip-service unchanged
deployment.apps/client-deployment unchanged

```

4. Multipl configurations can be clubbed in a single file. refer server_config for reference

5. create secrets
```
kubectl create secret <type of secret> <secret_name> --from-literal key=value

eg:
$ kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword
secret/pgpassword created

$ kubectl get secret
NAME                  TYPE                                  DATA   AGE
default-token-wd7l4   kubernetes.io/service-account-token   3      24h
pgpassword            Opaque                                1      26s

```

#### Open web ui

1. download config file
```
curl -O https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
```
2. Open up the downloaded file in your code editor and find line 116. Add the following two lines underneath --auto-generate-certificates:
```
args:
  - --auto-generate-certificates
  - --enable-skip-login
  - --disable-settings-authorizer
```
3. Run the following command inside the directory where you downloaded the dashboard yaml file a few steps ago:
```
kubectl apply -f kubernetes-dashboard.yaml
```
4. Start the server by running the following command:
```
kubectl proxy
```
5. You can now access the dashboard by visiting:
```
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```
6. on the pop up window click skip 

Note: The repo already has the downloaded file. (skip first 2 steps and start from 3rd step)