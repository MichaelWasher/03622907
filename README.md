# Testing for 03622907
A small repository containing the scripts for testing the HAProxy Router in OpenShift.

Apply the Kubernetes Manifests using the following commands:
```bash
$ oc apply -k .
```

To perform the curl requests, use the `curl_script.sh` script:
```bash
$ oc project 03622907
$ oc get routes
NAME                 HOST/PORT                                                              PATH   SERVICES             PORT   TERMINATION   WILDCARD
deployment-example   deployment-example-03622907.apps.example.com                                  deployment-example   8080                 None


$ ./curl_script.sh 60 deployment-example-03622907.apps.example.com

Performing curl requests at 'deployment-example-03622907.apps.example.com'
13:17:04 HTTP/1.1 200 OK
13:17:04 HTTP/1.1 200 OK
13:17:04 HTTP/1.1 200 OK
13:17:04 HTTP/1.1 200 OK
13:17:04 HTTP/1.1 200 OK
13:17:04 HTTP/1.1 200 OK
13:17:06 HTTP/1.1 200 OK
13:17:06 HTTP/1.1 200 OK
13:17:06 HTTP/1.1 200 OK
13:17:06 HTTP/1.1 200 OK
```
