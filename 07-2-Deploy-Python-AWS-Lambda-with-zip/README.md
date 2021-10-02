# Deploy Python Lambda functions with .zip file archives
- Your AWS Lambda function's code consists of scripts or compiled programs and their dependencies.
- You use a deployment package to deploy your function code to Lambda
- Lambda supports two types of deployment packages:
    - container images
    - .zip file archives

## Deployment package without dependencies
- Create the .zip file for your deployment package.
- Steps
   - Create a directory
   ```
   cd
   mkdir ~/my-math-function
   cd ~/my-math-function
   ```
   - Copy the contents of the sample Python code from [GitHub](https://raw.githubusercontent.com/awsdocs/aws-doc-sdk-examples/master/python/example_code/lambda/boto_client_examples/lambda_handler_basic.py) and save it in a new file named lambda_function.py
   - Add the lambda_function.py file to the root of the .zip file.
   ```
   sudo apt install -y zip
   zip my-deployment-package.zip lambda_function.py
   ```
   - This generates a my-deployment-package.zip file in your project directory.

## Deploy your .zip file to the function
 - Using AWS console UI, create a lambda function named- MyLambdaFunction1
 - To deploy the new code to your function, you upload the new .zip file deployment package.
```
aws lambda update-function-code --function-name MyLambdaFunction1 --zip-file fileb://my-deployment-package.zip
```


## Deployment package with dependencies
- Create the .zip file for your deployment package.
- Steps
    - Create a directory
    ```
    cd
    mkdir ~/my-sourcecode-function
    cd ~/my-sourcecode-function
    ```
    - Copy the contents of the following sample Python code and save it in a new file named lambda_function.py:
```
import requests
def main(event, context):   
    response = requests.get("https://www.youtube.com/")
    print(response.text)
    return response.text
def lambda_handler(event, context):
    main('', '')
```
  - Install the requests library to a new package directory.
  ```
  pip install --target ./package requests
  ```
  - Create a deployment package with the installed library at the root.
  ```
  cd package
  zip -r ../my-deployment-package.zip .
  ```
  - This generates a my-deployment-package.zip file in your project directory. The command produces the following output:
  ```
  adding: chardet/ (stored 0%)
  adding: chardet/enums.py (deflated 58%)
  ...
  ```
  - Add the lambda_function.py file to the root of the zip file.
  ```
  cd ..
  zip -g my-deployment-package.zip lambda_function.py
  ```

## Deploy your .zip file to the function
 - Using AWS console UI, create a lambda function named- MyLambdaFunction2
 - To deploy the new code to your function, you upload the new .zip file deployment package.
```
aws lambda update-function-code --function-name MyLambdaFunction2 --zip-file fileb://my-deployment-package.zip
```


# AWS Lambda function errors in Python
- When your code raises an error, Lambda generates a JSON representation of the error
- This error document appears in the invocation log and, for synchronous invocations, in the output.
- We can view Lambda function invocation errors for the Python runtime using the Lambda console and the AWS CLI.

## Using the Lambda console
- You can invoke your function on the Lambda console by configuring a test event and viewing the output
- The output is captured in the function's execution logs

## Using the AWS Command Line Interface (AWS CLI)
- The following invoke command example demonstrates how to invoke a function and write the invocation response to an output.txt file.
```
aws lambda invoke --function-name MyLambdaFunction1 --payload '{"action": "square", "number": 5 }' output.txt
```
- You should see the AWS CLI response in your command prompt
- You should see the invocation response in your command prompt
- You should also see the function invocation response in the output.txt file
