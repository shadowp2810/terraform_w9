# terraform_w9
TF files and notes from w9 terraform course

<pre>
------------
first_resource

Initialize
$ terraform init

Check state
$ terraform plan

Execute the terraform script
$ terraform apply

Delete resource 
$ terraform destroy

CIDR IP quantity = (2 ^ (32 - n)) - 5
eg: 10.0.0.0/16 where we n is 16, so we have 65531 
    255 * 255 = 65025
    Range = 10.0.0.0 - 10.0.255.255
------------
variables

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
eg: aws_vpc.myvpc.id or aws_vpc.myvpc.arn

------------
challenge1

Create a VPC named TerraformVPC
CIDR Range: 192.168.0.0/24

------------
ec2

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

------------
eip Elastic IP

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

------------
sg Security Group
stateless involves setting an inbound and outbound rule to ensure flow of traffic.
Is stateful: Return traffic is automatically allowed, regardless of any rules
Is stateless: Return traffic must be explicitly allowed by rules

------------
dynamic Dynamic Blocks
Allows us to go through a list and turn every element into tf code. 
One use case is to interate though a list of ports to allow in a security group.

------------
challenge2 ec2
Create a DB server and output the private IP.
Create a web server and ensure it has a fixed public IP.
Create a security group for the web server, opening ports 80 and 443.
Run the provided scripts on the web server. 

------------
Modules
A module is a forewarder with code inside it. 
Allows to extend the functionality of terraform to reuse code. 
Terraform registry has community modules we can use. 
https://registry.terraform.io/

------------
challenge3_modules
Modularise challenge2

------------
iam
Its recommended to make the policy from console and copy the JSON
EOF stands from End Of File and will contain the JSON policy
There is a limit to size of JSON policy, so will need to split files if too long. 

------------
rds 
Going through the aws console setup for rds will give us a better idea of all the fields we need to set in terraform. 
name is the database name eg: customers, 
and identifier is unique name for the instance eg: prod-customer-db-server. 
username and password should ideally be in a secrets manager like vault and be injected when needed.
skip_final_spanshot must be set to true, and during destroy it will try and take spanshot and fail.

------------
backend
The state file is a very important in terraform. Loosing it will disasterours. 
We can store it in S3.
key specifies the location and file name, "terraform/tfstate.tfstate".
Leaving access_key and secret_key blank will prompt you to enter it when we run the tf file. 
On mac or linux we can use "$ cat ~/.aws/credentials" to find our access_key and secret_key

------------
dep Dependencies
Suppose we have a tf file where we have are builing multiple ec2 instances,
and we need db server to build before web server, 
we can specify in web server "depends_on = [aws_instance.db]"
One of the common use cases is for EIP for an EC2 instance as it may take longer to provision. 

------------
count_demo
Helps us create multiple resources

------------
count_adv
One use case is inaddition to setting a count, can set multiple server names from a list.

------------
vars 
Instead of creating multiple terraform files for each environment, 
we can instead have variable files. 

------------
import 
With import we can bring in control of resources not managed by terraform but active on console into control of terraform. 
eg: for a vpc that we create on console, we specify same in tf file,
    then in command line "$ terraform import aws_vpc.<NAME OF VPC> <VPC RESOURCE ID>"

------------
data_sources
Data Sources are a way to query aws and get a result.
It makes an API request to get information.
We can use it for amis, backups, users, ...
We specify the data filter and output
"$ terraform apply -auto-approve"

------------


</pre>
