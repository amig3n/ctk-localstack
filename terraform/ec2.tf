resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one for your region
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
    Purpose = "Demonstration"
  }
}
