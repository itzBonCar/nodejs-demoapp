## Deploy to EKS cluster

Have AWS CLI setup and configured.
Install kubectl and eksctl


### Setup ECR repo

Create ECR repo on console - web-apps/nodejs-demoapp

Get Auth Token

$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin `<aws arn>`

Push Image

$ docker build -t web-apps/nodejs-demoapp:1.0 .
$ docker tag web-apps/nodejs-demoapp:1.0 `<aws-arn>/web-apps/nodejs-demoapp:1.0`
$ docker push `<aws-arn>/web-apps/nodejs-demoapp:1.0`


### Setup EKS cluster

$ eksctl create cluster \\
--name nodejs-demo-cluster \\
--version 1.34 \\
--region us-east-1 \\
--nodegroup-name nodejs-demo-workers \\
--node-type t3.micro \\
--nodes 3 \\
--nodes-min 1 \\
--nodes-max 4 \
--managed

$ eksctl get cluster
$ eksctl get nodegroup --cluster nodejs-demo-cluster
$ eksctl scale nodegroup --cluster nodejs-demo-cluster --name nodejs-demo-workers --nodes 0 --nodes-max 1 --nodes-min 0
$ eksctl delete cluster --name nodejs-demo-cluster

Update Kubeconfig

$ aws eks --region us-east-1 update-kubeconfig --name nodejs-demo-cluster

Create IAM policy for ECR Access [name: ECRReadAccess] in aws console, give least priviledge 
Tips:
Effect:"Allow"
Action: ...
Resource: "*"

Create IAM role with IRSA binding
$ eksctl create iamserviceaccount \\
    --name ecr-access-sa \\
    --namespace default \\
    --cluster nodejs-demo-cluster \\
    --attach-policy-arn <arn:aws:iam::aws:policy/AmazonECRReadOnlyAccess> \\
    --approve \\
    --override-existing-serviceaccounts

Deploy

$ kubectl apply -f ./k8s/
$ kubectl get pods -o wide
$ kubectl get services


Access Application from ip of service

Note: Production usually use Ingress Controller (1LB for multiple services) + ClusterIP Services
        NOT separate LB for every service
        OR Hybrid is used sometimes