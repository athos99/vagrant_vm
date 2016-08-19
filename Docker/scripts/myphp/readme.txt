docker build -t myphp /vagrant/scripts/myphp/ --rm
docker run -d -p 80:80 --name myphp myphp

