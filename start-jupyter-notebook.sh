source ~/venv/bin/activate
port=$(echo $USER | sed 's/.*\(..\)/\1/')
echo "Starting server on 88$port"
nohup jupyter notebook --ip 0.0.0.0 --port 88$port --MultiKernelManager.default_kernel_name=bash &
