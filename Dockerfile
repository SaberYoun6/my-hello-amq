FROM fedora


RUN yum -y update && yum clean all
RUN dnf -y install java-1.8.0-openjdk libaio && dnf clean all
RUN yum -y install git && yum clean all
RUN yum -y install gcc-c++ make && yum clean all
RUN yum -y install python-qpid-proton python-qpid-proton-docs && yum clean all 


CMD pip install flask


WORKDIR /usr/local/bin/AMQ_home

COPY . /usr/local/bin/artemis
COPY . /usr/local/bin/artemis.cmd

WORKDIR /usr/local/

CMD /bin/artemis create --user Admin --password swordfish --role admin --allow-anonymous y /usr/local/bin/AMQ_home/]
WORKDIR /usr/local/bin/AMQ_home/
CMD  /bin/artemis-service start 

CMD /bin/artemis queue create --name examples --auto-create-address --anycast

EXPOSE 5000 

COPY send.py .

COPY recieve.py .

CMD python send.py amqp:://localhost queue1 hello

CMD python recieve.py amqp://localhost queue1


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
