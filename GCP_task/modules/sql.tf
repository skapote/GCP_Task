


resource "google_sql_database_instance" "mysql-db" {
    name             = "prodyty"
    database_version = "MYSQL_5_7"

    root_password = "password"

    region = "us-east1"

    project=var.production_project


settings{


 tier = "db-f1-micro"

ip_configuration {



        ipv4_enabled= true
            
            authorized_networks{
            name="public network"
            value="0.0.0.0/0"
        }


}

}

}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql-db.name
  project=var.production_project
}