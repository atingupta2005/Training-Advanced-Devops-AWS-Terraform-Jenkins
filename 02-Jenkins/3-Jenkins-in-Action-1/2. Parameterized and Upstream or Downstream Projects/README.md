# Creating Upstream/Downstream Projects
- We will be creating two projects and using one to trigger the other
- Given two projects, project A and project B
  - If project B is configured to run once project A completes, we call project B the downstream project and project A the upstream project
- Let's create Project A and Project B


## Build Triggers
- Create Project A with simple - echo "Hello World - Project A"
- Create Project B with simple - echo "Hello World - Project B"
  - Build After other Projects are Built - Project A
- Can also do configuration of Project A
  - Build->Build other Projects
- Build Project A and Project B will be built as well
