// vars

variable "google_container_cluster_name"{}

variable "google_container_cluster_location"{}

variable "google_container_cluster_node_count"{}

variable "google_container_cluster_node_machine_type"{}

// counfiguration


resource "google_container_cluster" "my_cluster" {
  name               = var.google_container_cluster_name
  location           = var.google_container_cluster_location
  initial_node_count = var.google_container_cluster_node_count

  master_auth {
    username = ""
    password = ""


    client_certificate_config {
      issue_client_certificate = false
    }
  }


node_config {
   
    machine_type= var.google_container_cluster_node_machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
}


    network= google_compute_network.dev_prj_vpc.name
    project=var.developer_project
    subnetwork=google_compute_subnetwork.dev-prj-network.name

}
  

resource "null_resource" "nullcluster" {

    provisioner "local-exec" {

        command ="gcloud container clusters get-credentials ${google_container_cluster.my_cluster.name}  --zone ${google_container_cluster.my_cluster.location} --project ${google_container_cluster.my_cluster.project}"
    }
}
