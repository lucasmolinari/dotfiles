for q in $(sudo rabbitmqctl list_queues -p / name | tail -n +2); do
  sudo rabbitmqctl delete_queue -p / "$q"
done
