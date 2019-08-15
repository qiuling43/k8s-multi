docker build -t qiuling21/multi-client ./client/Dockerfile ./client
docker build -t qiuling21/multi-server ./server/Dockerfile ./server
docker build -t qiuling21/multi-worker ./worker/Dokcerfile ./worker
docker push qiuling21/multi-client
docker push qiuling21/multi-server
docker push qiuling21/multi-worker
kubectl apply -f k8s
kubectl set image deployment/client-deployment client=qiuling21/multi-client
