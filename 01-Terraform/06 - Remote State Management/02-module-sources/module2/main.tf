### Example 2: Generic GIT Repository with Specific branch:
module "demomodule" {
  source = "git::https://github.com/atingupta2005/tmp-repo.git?ref=development"
}
