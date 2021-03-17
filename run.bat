docker run -e clientid=2083 -e port=83 -p 83:83 -d --name=2083 roopesht/ubuntu-python3.8-roopesh
docker run -e clientid=2084 -e port=84 -p 84:84 -d --name=2084 roopesht/ubuntu-python3.8-roopesh
docker run -e clientid=2085 -e port=85 -p 85:85 -d --name=2085 roopesht/ubuntu-python3.8-roopesh
docker run -e clientid=2086 -e port=86 -p 86:86 -d --name=2086 roopesht/ubuntu-python3.8-roopesh
docker run -e clientid=2087 -e port=87 -p 87:87 -d --name=2087 roopesht/ubuntu-python3.8-roopesh
timeout 5

docker start 2083
docker start 2084
docker start 2085
docker start 2086
docker start 2087

docker stop 2083
docker stop  2084
docker stop 2085
docker stop 2086
docker stop  2087

docker rm 2083
docker rm 2084
docker rm 2085
docker rm 2086
docker rm 2087
