set -v
image=hcn-adapter
docker rmi $image || true
docker build --rm=true -t $image .
