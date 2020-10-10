provider "google" {
  credentials = file(var.gcp_credentials_path)

}


module "gcp"{


 source="./modules"

// GCP  project VPC

 developer_project=var.developer_project

 production_project=var.production_project

 gcp_project_region=var.gcp_project_region

 gcp_protocol=var.gcp_protocol

 gcp_ports=var.gcp_ports

// GCP VPC peering

 dev_peering=var.dev_peering

 prod_peering=var.prod_peering

 // GCE

 google_container_cluster_name=var.google_container_cluster_name

 google_container_cluster_location=var.google_container_cluster_location

 google_container_cluster_node_count=var.google_container_cluster_node_count

 google_container_cluster_node_machine_type=var.google_container_cluster_node_machine_type

}

provider "kubernetes" {
  
}

data "google_client_config" "provider" {}

