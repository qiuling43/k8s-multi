GIT_SHA=$(git rev-parse HEAD)
docker build -t qiuling21/multi-client:latest -t qiuling21/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t qiuling21/multi-server:latest -t qiuling21/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t qiuling21/multi-worker:latest -t qiuling21/multi-worker:$GIT_SHA -f ./worker/Dokcerfile ./worker

docker push qiuling21/multi-client
docker push qiuling21/multi-server
docker push qiuling21/multi-worker

docker push qiuling21/multi-client:$GIT_SHA
docker push qiuling21/multi-server:$GIT_SHA
docker push qiuling21/multi-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployment/client-deployment client=qiuling21/multi-client:$GIT_SHA
kubectl set image deployment/server-deployment server=qiuling21/multi-server:$GIT_SHA
kubectl set image deployment/worker-deployment worker=qiuling21/multi-worker:$GIT_SHA
