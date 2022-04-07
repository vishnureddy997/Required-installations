terraform {
  backend "http" {
    #    address       = "Pre-Authenticated Requests URL of the respective bucket/name of the Pre-Authenticated Requests"
    address       = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/rhLgsiJxBXyTm885_0JxIbeXk5tu5GRUQkuhAHqlyNwI7l-hvL9dTIRn0oOw8G0x/n/axmkcmtwmo2i/b/backend-bucket/o/control-vm.tfstate"
    update_method = "PUT"
  }
}
