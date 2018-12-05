# helloworld-k8s

用于演示k8s应用发布

* 打包应用程序：mvn clean package
* 构建镜像：
 
     docker build -t <your registry address>/repository/helloworld-k8s:<tag>
	 
* 基于kubernetes部署

   kubectl apply -f kubernetes/deployment.yaml
   
   kubectl apply -f kubernetes/service.yaml
   
   kubectl apply -f kubernetes/ingress.yaml