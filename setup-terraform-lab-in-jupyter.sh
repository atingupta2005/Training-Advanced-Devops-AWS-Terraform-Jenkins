# Create Virtual Environment
DIR="venv"
if ! [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  virtualenv $DIR
  source $DIR/bin/activate
  pip install jupyter
  pip install bash_kernel
  python -m bash_kernel.install
else
  echo "virtual env already created in your home directory"
fi

# Clone Git Repo
DIR="Training-Advanced-Devops-AWS-Terraform-Jenkins"
if ! [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  git clone https://github.com/atingupta2005/Training-Advanced-Devops-AWS-Terraform-Jenkins
  cd $DIR
else
  echo "repo already cloned"
  cd $DIR
  git stash
  git pull
fi


port=$(echo $USER | sed 's/.*\(..\)/\1/')
echo "Starting server on 88$port"
nohup jupyter notebook --ip 0.0.0.0 --port 88$port --MultiKernelManager.default_kernel_name=bash &
