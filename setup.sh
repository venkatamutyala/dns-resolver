docker stop dns --force || true
docker rm dns --force || true
docker build -t my-resolver .
docker run -d \
  --name dns \
  --restart always \
  -p 53:53/udp \
  -p 53:53/tcp \
  my-resolver