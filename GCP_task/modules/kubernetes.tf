provider "kubernetes" {
    
}

resource "kubernetes_service" "kubevice" {



    metadata{

        name="kubevice"
        
        labels={
            
            env="test"
            name="kubevice"
        }
    }

    spec{


    type="LoadBalancer"
     
     selector={

     app="gcp-wp"
   

     }
     session_affinity = "ClientIP"

     port{

         port=80
         target_port=80
      
     }

    
    }
}

output "loadb_ip"{

    value=kubernetes_service.kubevice.load_balancer_ingress[0].ip
}


// schedule deployment

resource "kubernetes_deployment" "tf-kube-wp"{

    metadata{

        name="tf-kube-wp"
        labels={
            
            app="gcp-wp"
        }
    }

    spec{
      replicas=1
      selector{
          match_labels = {
            app="gcp-wp"
      }
 
         
      }
      template{

          metadata{

              name="pod-wp"
              labels={
                  app="gcp-wp"
              
          }
          }
              spec{

                container{
                    name="con-wp"
                    image="wordpress"

                    port {
                      container_port = 80
                  }
                    
                }
    
              }
      }
    }
}

// launch wordpress

resource "null_resource" "launch_wp" {

    provisioner "local-exec" {

        command ="open -a \"google chrome\" http://${kubernetes_service.kubevice.load_balancer_ingress[0].ip}"
    }
}