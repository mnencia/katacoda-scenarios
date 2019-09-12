while [ ! -f /tmp/k8s-ready.sh ]
do
  sleep .2
done
/tmp/k8s-ready.sh
