docker build -t kimlvu/multi-client:latest -t kimlvu/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kimlvu/multi-server:latest -t kimlvu/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kimlvu/multi-worker:latest -t kimlvu/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push kimlvu/multi-client:latest
docker push kimlvu/multi-server:latest
docker push kimlvu/multi-worker:latest
docker push kimlvu/multi-client:$SHA
docker push kimlvu/multi-server:$SHA
docker push kimlvu/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=kimlvu/multi-server:$SHA
kubectl set image deployments/client-deployment client=kimlvu/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=kimlvu/multi-worker:$SHA