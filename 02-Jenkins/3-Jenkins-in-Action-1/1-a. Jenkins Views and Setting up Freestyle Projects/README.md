# Jenkins Views and Setting up Freestyle Projects

## In order to run the scripts in this path, follow the instructions below:

1. Ensure you have at least Python 3.8+ installed
2. The scripts require no virtual environment to run
3. Run the scripts on your terminal as: python scriptname.py. E.g. python sample.py


- Install Python and Pyttest
```
sudo apt install python3
apt install python-pytest
```

- Create a new freestyle project
  - Repo: https://github.com/atingupta2005/jenkins-python-test
- Build -> Execute Shell: pytest sample.py
- Run
