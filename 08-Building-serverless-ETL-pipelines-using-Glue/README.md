# AWS Glue for ETL (extract, transform and load) processes
- Building serverless ETL pipelines using Amazon Glue.

# Code Repo:
 - https://github.com/atingupta2005/aws-glue-etl-pipeline

## AWS Glue
 - Automatically discovers and categorise your data and make it immediately searchable and query-able using Amazon Athena, Amazon Redshift or Amazon EMR.

## Use Case
 - Let's explore how to use AWS Glue to transform your data stored in S3 buckets and query using Athena.

### Create required resources
- We will use Terraform to create the role needed with the required permissions

- Also, we need an S3 Bucket to put the files to process, the output results and some other files managed by Glue.

- Remember to run:
```
terraform init
terraform apply
```

- To copy some example logs (nginx_logs.txt in project folder) execute:
```
aws s3 cp ./nginx_logs.txt s3://{bucket}/data/raw/nginx_logs.txt
```

- First, we need to create the database within Glue Data Catalog.

- Then, you must create a “Crawler” to populate the AWS Glue Data Catalog with tables.
    - A crawler connects to a data store, progresses through a prioritized list of classifiers to determine the schema for your data, and then creates metadata tables in your data catalog.
- Once, the crawler was created you need to run it.
- After that, the data catalog was updated and you can see the table schema and other information.

#### Athena
  - A serverless service that makes really easy to analyze data in Amazon S3 using standard SQL.

- At this point we are ready to perform an ETL job over the data, in this case, the Apache logs we use in this example project
- The purpose of the next step is to extract only some fields and them save it in a parquet format file

- When the job is created, execute it and wait for a while. This process could take some minutes.
- Once the process is finished, you must be able to see the data output in your S3 bucket.
- Execute once again the crawler and you will see your data catalog updated with the new table.

### Using Custom Classifiers
- You might need to define a custom classifier if your data doesn’t match any built-in classifiers, or if you want to customize the tables that are created by the crawler.
- We’ll use a custom file with a very simple information.

```
"Ipad mini",EU,50.0,2
"Lenovo Ideapad",AU,350.0,1
"Huawei Y9 2019",UE,120.0,2
"MSI",LATAM,500.0,6
"Samsung 27-VA",CA,50.0,3
```

- Copy the file to your S3 bucket using:
```
aws s3 cp ./custom_data.csv s3://{bucket}/sales/custom_data.csv
```

- This time we could use Terraform for creating a new database, a custom classifier and a new crawler.

- Then, go and create a new job to process the sales database with the purpose of converting to parquet file type.

- You can check your S3 bucket and use Athena to query your data.
