docker build -t brucebotes/multi-client:latest -t brucebotes/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t brucebotes/multi-server:latest -t brucebotes/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t brucebotes/multi-worker:latest -t brucebotes/multi-worker:$SHA  -f ./worker/Dockerfile ./worker
docker push brucebotes/multi-client:latest
docker push brucebotes/multi-client:$SHA
docker push brucebotes/multi-server:latest
docker push brucebotes/multi-server:$SHA
docker push brucebotes/multi-worker:latest
docker push brucebotes/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/client-deployment client=brucebotes/multi-client:$SHA
kubectl set image deployment/server-deployment server=brucebotes/multi-server:$SHA
kubectl set image deployment/worker-deployment worker=brucebotes/multi-worker:$SHA

