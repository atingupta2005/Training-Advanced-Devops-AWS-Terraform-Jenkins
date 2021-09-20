#### Documentation Referred:
- https://registry.terraform.io

#### Azure Provider

```
provider "azurerm" {}
```

```
terraform init
```

#### Digital Ocean Provider:

- https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs

```
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.0"
    }
  }
}

provider "digitalocean" {}
```

```
terraform init
```
