FROM fedora


RUN yum -y update && yum clean all
RUN dnf -y install java-1.8.0-openjdk libaio && dnf clean all
RUN dnf -y install git && dnf clean all
RUN dnf -y install gcc-c++ make && dnf clean all

CMD /bin/curl -sL https://rpm.nodesource.com/setup_10.x | -E bash -

RUN dnf -y install nodejs && dnf clean all


WORKDIR /usr/local/bin/AMQ_home

COPY . /usr/local/bin/artemis
COPY . /usr/local/bin/artemis.cmd

WORKDIR /usr/local/

CMD /bin/artemis create --user Admin --password swordfish --role admin --allow-anonymous y /usr/local/bin/AMQ_home/]
WORKDIR /usr/local/bin/AMQ_home/
CMD  /bin/artemis-service start 

COPY server.js .

CMD node server.js

EXPOSE 8080 

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
