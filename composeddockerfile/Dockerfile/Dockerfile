FROM fedora
RUN yum -y update && yum clean all
RUN yum -y install openjdk && yum clean all
WORKDIR ~/AMQ_home
COPY . ~/amq-broker-7.4.0/bin/artemis
WORKDIR ~/amq-broker-7.4.0/bin/artemis
RUN artemis 
CMD ["artemis","create","--user","Admin","--password","swordfish","--role","admin", "--allow-anonymous","y", "~/AMQ_home/"]
WORKDIR ~/AMQ_home/bin
RUN ./artemis-service 
CMD ["artemis-service", "start"] 
EXPOSE 80 

#RUN kubectl get nodes 
#CMD ["kubectl", "get" , "node"]
#RUN kubectl create deployment my-amq --image=github.com/yuriprym/my-amq-hello
#CMD ["kubectl" , "create", "deployment", "my-amq" "image=https://github.com/yuriprym/my-amq-hello"]
#RUN kubectl get deployments
#RUN kubectl proxy
#curl http://loccalhost:8001/version
#RUN export POD_NAME= $(kubectl get -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
#RUN echo "NAME of the Pod: $POD_NAME
#RUN kubectl get pods
#RUN kubectl describe pods
#RUN kubectl get services 
#RUN kubectl logs $POD_NAME
#RUN kubectl exec $POD_NAME env
#RUN kubectl exec $POD_NAME bash
#RUN kubectl artemis producer 
#CMD ["kubectl" ,"artemis" ,"producer"]
