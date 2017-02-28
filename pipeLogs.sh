# This script passes the meteor app logs and puts then in the orion.hosting app.log file
while true; do
  sudo docker logs meteor --since 2s >> ~/app.log
  sleep 2s
done
