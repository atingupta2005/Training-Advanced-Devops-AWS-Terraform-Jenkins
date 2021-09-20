> **[Day 1 (8 Hours)]**

1.  Quick Overview on Terraform

    1.  Installing Terraform

    2.  Setting up AWS account

2.  Deploying Infrastructure with Terraform

    1.  Creating first EC2 instance with Terraform

    2.  Destroying Infrastructure with Terraform

    3.  Destroying Specific Resource

    4.  Understanding Terraform State files

    5.  Understanding Desired & Current States

    6.  Challenges with the current state on computed values

    7.  Terraform Commands - State Files

    8.  Types of Terraform Providers

3.  Read, Generate, Modify Configurations

    1.  Understanding Attributes and Output Values in Terraform

    2.  Referencing Cross-Account Resource Attributes

    3.  Terraform Variables

    4.  Approaches for Variable Assignment

    5.  Data Types for Variables

    6.  Fetching Data from Maps and List in Variable

    7.  Count and Count Index

    8.  Conditional Expressions

    9.  Local Values

4.  Read, Generate, Modify Configurations

    1.  Terraform Functions

    2.  Data Sources

    3.  Debugging in Terraform

    4.  Terraform Format

    5.  Validating Terraform Configuration Files

    6.  Load Order & Semantics

    7.  Dynamic Blocks

    8.  Tainting Resources

    9.  Splat Expressions

    10. Terraform Graph

    11. Saving Terraform Plan to File

    12. Terraform Output

    13. Terraform Settings

    14. Dealing with Large Infrastructure

5.  Terraform Provisioners

    1.  Understanding Provisioners in Terraform

    2.  Types of Provisioners

    3.  Implementing remote-exec provisioners

    4.  Implementing local-exec provisioners

    5.  Creation-Time & Destroy-Time Provisioners

    6.  Failure Behavior for Provisioners

> **[Day 2 (8 Hours)]**

6.  Loops, Meta-Arguments, Splat Operator and Functions

    1.  Implement Variable Lists, Maps and Count

    2.  Implement Outputs with For Loops and Splat Operators

    3.  Implement AZ Datasource and for_each Meta-Argument

    4.  Implement Outputs with toset, tomap functions and create and
        > destroy

7.  Terraform Modules & Workspaces

    1.  Understanding DRY principle

    2.  Implementing EC2 module with Terraform

    3.  Variables and Terraform Modules

    4.  Terraform Registry

    5.  Terraform Workspace

    6.  Implementing Terraform Workspace

8.  Remote State Management

    1.  Integrating with GIT for team management

    2.  Security Challenges in Committing TFState to GIT

    3.  Module Sources in Terraform

    4.  Terraform and .gitignore

    5.  Remote State Management with Terraform

    6.  Implementing S3 Backend

    7.  Challenges with State File locking

    8.  Integrating DynamoDB with S3 for state locking

    9.  Terraform State Management

    10. Importing Existing Resources with Terraform Import

    11. Document - Remote State Management

9.  Security Primer

    1.  Handling Access & Secret Keys the Right Way in Providers

    2.  Terraform Provider UseCase - Resources in Multiple Regions

    3.  Handling Multiple AWS Profiles with Terraform Providers

    4.  Terraform & Assume Role with AWS STS

    5.  Sensitive Parameter

10. Terraform Cloud & Enterprise Capabilities (Conceptual)

    1.  Overview of Terraform Cloud

    2.  Creating Infrastructure with Terraform Cloud

    3.  Document - Sentinel Resource

    4.  Overview of Remote Backends

    5.  Implementing Remote Backend Operations in Terraform Cloud

> **[Day 3 (8 Hours)]**

1.  Continuous Integration

    a.  Introduction to continuous integration

    b.  Introduction to Jenkins

2.  Getting Started with Jenkins

    a.  Install Jenkins on a local machine

    b.  Starting Up with Jenkins

    c.  Creating a Jenkins Job

3.  Plugins and its uses

    a.  Introduction to Plugins

    b.  Adding Plugins to Jenkins

    c.  Explore some commonly used plugins

    d.  Configuring Jenkins to work with java, Git and Maven

    e.  Configure Jenkins to check for source code changes periodically

    f.  Working with Maven Build Jobs

    g.  Hands-On

        i.  Adding the plugins to the Jenkins job

        ii. Creating a Jenkins job to check for source code changes

        iii. Creating maven build jobs

4.  Setting Up Your Build Jobs and Security

    a.  Introduction to Build Triggers and to Build Steps

    b.  Pre-and Post-Build Actions: Adding properties and properties
        > files

    c.  Running Your New Build Job

    d.  Parameterized Builds

    e.  Distributed builds

    f.  Setting Email notification

    g.  Enabling Security in Jenkins

    h.  Different Levels of Authentication

    i.  Types of Access and Administration of the Access

    j.  Hands-On Use Case:

        i.  Creating Freestyle jobs

        ii. Setting up security and authorization in Jenkins

        iii. Sending email notifications

        iv. Running the Jenkins job

5.  Implementing Automated Testing

    a.  Automating Your Unit and Integration Tests

    b.  Configuring Test Reports in Jenkins

    c.  Displaying Test Results

    d.  Ignoring Tests

> **[Day 4 (8 Hours)]**

6.  Jenkins Pipeline

    a.  Groovy Basics

    b.  Basics

        i.  Types of Pipeline scripts and Difference between them

        ii. Jenkins Job DSL

        iii. Automated Jenkins Pipeline

        iv. Hands-On: Jenkins pipeline

        v.  Steps, Stage, Stages, Agent,

        vi. Stage Colors

        vii. Comments, Syntax

        viii. Batch Commands

    c.  Variables

        i.  Predefined Variables

        ii. User defined Variables

        iii. Declaration Types

        iv. Scope of the Variables

    d.  Parameters

        i.  What are the uses of Parameters

        ii. String, Text, Boolean, Choice, Password, File

        iii. Params keyword

    e.  Options Section

        i.  Retry

        ii. BuildDiscarder

        iii. DisableConcurrentBuilds

        iv. Timeout

        v.  Timestamps

    f.  Trigger Builds

        i.  Trigger Other Jobs

        ii. How to Trigger second job even first job fails

        iii. How to change build result

        iv. Trigger other job with parameters

    g.  Parallel

        i.  Multiple steps sections under same stage

        ii. Parallel builds

        iii. Parallel Stages

        iv. FailFast

    h.  Post

        i.  POST and order of Blocks

        ii. always, changed, fixed

        iii. regression, aborted, failure

        iv. success, unstable, cleanup

        v.  Post at stage level

    i.  Conditional and Loop Statements

        i.  if and else

        ii. Build number : Even or Odd

        iii. For loop

> **[Day 5 (8 Hours)]**

7.  Distributed Jenkins Configuration

    a.  Introduction to Distributed Jenkins Build

    b.  Configuring Master Jenkins node

    c.  Configuring the Jenkins slave

    d.  Managing nodes and distributing jobs over nodes

    e.  Binding Jobs on the master and slave setup

    f.  Labelling the nodes to run a specific job

    g.  Hands-On: Configuring slave node in your Jenkins, adding labels
        > to nodes, managing the nodes

8.  Jenkins and Packer

    a.  About Packer

    b.  Packer Download and Installation in Windows

    c.  AWS IAM User and Access And Secret Key

    d.  Variable & Builder

    e.  Packer integration with Jenkins (Running Packer commands from
        > Jenkins)

9.  Jenkins and Terraform

    a.  Terraform Provider & AWS Access and Secret Key

    b.  Terraform integration with Jenkins

10. Jenkins Troubleshooting

    a.  Monitoring Logs

    b.  Version of Jenkins and Plugins

11. Some Common issues

    a.  If Jenkins hangs

    b.  Site is down with no 404 messages

    c.  No jobs are displayed

12. Jenkins Tips

    a.  How to unlock Jenkins

    b.  Reset password

13. Addressing Slow Performance in Jenkins

> **[Day 6 (8 Hours)]**

14. Understanding of Python

15. Python Environment Set-up and Installation

16. Python Basics

    a.  Data Types

    b.  Numbers

    c.  Strings

    d.  Lists

    e.  Dictionaries

    f.  Booleans

    g.  Tuples and Sets

17. If, elif and else Statements

18. Loops

19. Python Sequences

    a.  List

    b.  Tuple

    c.  Dictionary

    d.  Set

20. List Comprehensions in Python

21. Working with Functions

22. Building Lambda functions with Python

23. Deploy Python Lambda functions with .zip file archives

24. AWS Lambda function errors in Python

25. AWS Lambda with Boto3

    a.  Setting Up Project

    b.  Creating an IAM Lambda Access Policy

    c.  Creating an IAM Execution Role

    d.  Attaching IAM Access Policy to IAM Execution Role

    e.  Developing a Python Lambda Function

    f.  Deploying Python Lambda Function

    g.  AWS Console Checkpoint: Python Lambda Function

26. AWS Lambda with Boto3: Updating Function Code and Versioning

    a.  Invoking Functions

    b.  Passing Environment Variables to a Function

    c.  Modifying Function Code to Use Environment Variable and Invoking

    d.  Publishing a New Function Version

    e.  Creating Aliases for Function Versions

27. AWS Lambda with Boto3: Function Operations

    a.  Getting a Function Configuration

    b.  Listing All Function Configurations

    c.  Updating Function Configurations

    d.  Deleting Functions

28. Use Case: Building serverless ETL pipelines using Amazon Glue

    a.  Create required resources

        i.  Create the database

        ii. Create a "Crawler"

        iii. Perform an ETL job

    b.  Using Custom Classifiers

    c.  Clean-up

> **[Day 7 (4 Hours)]**

29. Use Case: Provision AWS infrastructure using Terraform

    a.  Covers Lambda, S3, Glue, API Gateway, DynamoDB

30. Automating Terraform Projects with Jenkins

    a.  Install Terraform plugin

    b.  Configure Terraform

    c.  Pipeline Script

    d.  Scripting Remote State Setup

    e.  Run Jenkins pipeline

31. Use Case: Deploy AWS Lambda to VPC with Terraform

    a.  Write Lambda code

    b.  Lambda Terraform module

    c.  Deploy Lambda zero to AWS

    d.  Make sure Lambda works

    e.  Create VPC

    f.  Create public subnet

    g.  Create private subnet

    h.  Create security resources

    i.  Add Lambda to the VPC

    j.  Test

    k.  Clean-up
