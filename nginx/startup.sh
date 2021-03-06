echo "begin startup"

# version
version=$1
if [ -z "$version" ];then
    version="latest"
fi
echo "current version is ${version}"


# pull image
echo "sudo docker pull xiaozhi90/nginx:${version}"
sudo docker pull xiaozhi90/nginx:${version}

# start
docker_name=nginx
sudo docker ps -a -q --filter "name=${docker_name}" |grep -q . && docker stop ${docker_name} && docker rm -fv ${docker_name}
sudo docker run -itd --name ${docker_name} -p 80:80 xiaozhi90/nginx:${version}

# -v /mnt/15t:/mnt/15t
#java -jar -Xmx1G -Xmx1G -Dspring.profiles.active=$PROFILE -Dserver.port=9006 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=~/logs/oom -server  -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:~/logs/gc/nlp-api.log sentinel-0.0.1-SNAPSHOT.jar
#docker run -itd --name nginx1 -p 80:80

echo "end startup"