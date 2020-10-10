variable "gcp_credentials_path"{


    default="/Users/Manasi/.config/gcloud/application_default_credentials.json"

}


variable "developer_project"{


        default = "gcp-dev-287114"
}


variable "production_project"{


        default = "gcp-prod-287115"
}

variable "gcp_project_region"{

   default="asia-southeast1"


}

variable "gcp_protocol"{


   default="icmp"

}

variable "gcp_ports"{
   
    type=list
    default=["80", "8080", "1000-2000","22"]
}


variable "dev_peering"{


    default="gcp-dev-peering"
}


variable "prod_peering"{


    default="gcp-prod-peering"
}

// GCE 

variable "google_container_cluster_name"{

    default="my-cluster"
}

variable "google_container_cluster_location"{

    default="asia-southeast1"
}

variable "google_container_cluster_node_count"{

    default=1
}

variable "google_container_cluster_node_machine_type"{

    default="n1-standard-1"
}


