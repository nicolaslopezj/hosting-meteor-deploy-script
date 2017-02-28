while true; do
  sudo docker logs meteor --since 5s > ~/app.log
  sleep 5
done
