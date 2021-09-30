virtualenv ./venv
source ./venv/bin/activate
pip install boto3
pip install jupyter

port=$(echo $USER | sed 's/.*\(..\)/\1/')
echo "Starting server on 98$port"
jupyter notebook --ip 0.0.0.0 --port 98$port --MultiKernelManager.default_kernel_name=bash
