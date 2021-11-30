resource "aws_instance" "Demo_Instance" {   
    #ami = "ami-0c9f90931dd48d1f2"
    ami = "ami-0bf8b986de7e3c7ce"    
    instance_type = "t2.micro"
    #availability_zone = "ap-southeast-2"
    tags = {
        Name = var.docker_src == 'ECR' ? "ECR-Repo": "artifactory-Repo" 
    }
}