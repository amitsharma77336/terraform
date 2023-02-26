# terraform

This repository is created during studying for Terraform:

Day 1:

IAC:
    Infrastructure as Code.
        Imperative: 
        Declarative:

    IAC Tools:
        - Terraform
        - Pulumi
        - Cloud formation template.
        - Azure Resource Manager.
        - Ansible.
        - Puppet.

Terraform:
    Build by Hashi Copr and is HCL which follows a JSON like syntax.
    Example:
    - JSON notation example
        {
            "name": "amit"
            "subjects": ["Maths", "English", "Hindi"]
            "address": {
                "flatno": "607"
                "city": "pune"

            }


        }

    - Hashicorp Configuration Language(HCL):
        {
            name= "Amit"
            subjects= [
                "Maths",
                "English",
                "Hindi"

                ]
            "address": {
                flatno= "709"
                city= "pune" 


            }

        }


    - YAML:
        ---
        name: "Amit"
        subjects:
            - "Maths"
            - "English" 
            - "Hindi"
        address:
            flat: "890"
            city: "pune"


Type of Terraform:
    - Community
    - Enterprise: It provides GUI for managing tf deployments.

Main Components of Terraform:
    {
        Terraform Core: [
            - It is a binary written in Go language,
            - Responsible for authentication, Language validation, formatting, e.t.c.

        ]
        Terraform plugins: [
            - Written in go language,
            - Responsible for API calls,
            - Different providers have different pluging , For example AWS , Azure, K8s terraform plugin.
        ]


    }

API:
    [
        - It is a program/software that sends and recieves info/data back and forth between applications/webs/users.
        - Authentication is requried to use API.
        - {
            Type of API call:
                - REST: Representatioinal state transfer , In this data is sent in JSON format and recieved in JSON format.
                    - Restful : Follow state representational format.
                    - Restless: Does not follow state ful principles.
                - SOAP: XML format is used
        }

    ],

    Examples:{
        api_request:
            [
                #token = $(az account get-access-token | jq -r ".accesstoken")
                    # Here jq -r is for json querry in raw format.
                #subscription_id = $(az account show| jq -r ".id")

                # In below command we will send out an querry to get an resource group name from the azure subscription, This is how we can call an API from shell.

                # curl -s -X GET -H "Authorization: Bearer ${token}" -H "Content-Type: application/json" -H "Accept: application/json" https://mgmt.azure.com/subscription/${subscription_id}/resourcegroup/?api.verision2021-0-4-01/
            ]
        curl_command_options:
            [   
                curl: [

                    

                ]


                
            ]


    }
    

#   Day1:
    {

        Added first code for provisioning azure resource group.
    }


Update: 
14.02.2023 : Added .gitignore file to the repository and now it am not publishing the .terraform files and .hcl file.


Day 2:

Terraform core (Create dependency graph, terraform cli to interact with, initialization)
+ 
Terraform Pluglins (Provider plugin, API calls)

Tools to install for working with Terraform:
1. Azure CLI Installation.
2. Terraform Installation: After Installationi set environment variables.
3. tf.env : It is a tool to manage multiple versions of Terraform.

Can we create terraform registry offline?
The answer to above question is yes terraform registry could be created offline.

Authentication of Terraform with different platforms:

1. Simple login for example az login.
2. Login on the basis of Token.
3. Authentication based on OAuth.

Example of authentication if using client secret:

Code:
    provider "azurerm"{
        features{}
        client_id = "Enter client ID"
        client_secret = "Enter client secret "
        subscription_id = "Enter subscription ID"
        tenant_id = "Enter the tenant ID"

    }

## It is important to note that client secrets should not be checked in to GIT. Fow working with GIT we can use environment variables as terraform automatically quries this.


Code:
    provider "azurerm" {
        features{}

    }
In the above code features section is only necessary for azure as this is reserved to try out any of the experimental features in Azure.

# Terraform Commands:
    1. terraform init:
            It basically initializes the plugins and download provider files from repository to local.
            terraform.hcl.tf - This is the file which contains compatibility information and it also contains the has of the terraform plugin whcih is being downloaded.
            .terraform - It is the directory where all of the files are downloaded.
    2.  terraform plan:
            This is the stage when terraform creates API calls and establishes connection to tell you what is going to happen during this terraform deployment.
            It also creates a .tfstate.lock file which containe __________________________________________________________________
    Terraform does not care which file is is referring to as long as it has an extension "*.tf".

# Day 3:

Terraform is written in GO language and it supports HCL Hashi Corp Configuration Language.

1. Loaded Files:
    Terraform loads all .tf and .tf.json files in a directory and expects each file to define distinct set of configuration objects.
2. Dependency Lock File: 
    It contains the information about the modules external and thr providers and the checksum of downloaded modules from the registry. It compares checksum with module on subsequent terraform init and it can also create or update the .terraform.locl.hcl file.
    It is located in the same folder as configuration files and tagged as ".terraform.lock.hcl", THere is another folder created called ".terraform" which stores the cached plugins/providers for execution.

###  Syntax: 

Two key Syntax Constructs:

1. Arguments:

    An arguments define a value to a particular name:

        image_id = "abc123"

    Here identifier before the equal sign is argument_name and expression after the equal sign is the argument's value.

2. Blocks:

    A block has a type such as 'resource','provider','variable'. Each block defination(Inside documentation) defines how many labels block will assume after the block name.Their can be blocks nested inside blocks.
    In the example below the resource block type has two labesl names 'aws_instance' and 'example'.
    Also it has another block inside the block called 'network_interface'. The block body is delimited by { }.


            resource "aws_instance" "example" {
                ami = "abc123"

                network_interface {
                    # ...
                }
            }
        ** If in above example network_interface is defined with an equal to sign then it is called a map. We can find this in documentation if we have to use block of map. ** 
3. Identifiers:
        Argumen names, block type names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all identifiers.

4. Comments: 
        Comments in terraform can be written using below syntax:
            * '#' Represents a single line comment.
                # This is a single line comment.
            * '//' Represents a single line comment.
                // This is again a single line comment.
            * '/* */' Represents a multi liine comment.
                /* This is line 1 of multiline comment.
                This is line 2 of multiline comment. */
    * Configuration files are UTF-8 encoded. *
5. JSON Configuration Syntax, It is generally not used because it is cumbersome to use.
        Example:
            {
            "resource": {
                "aws_instance": {
                    "example": {
                        "instance_type": "t2.micro",
                        "ami": "ami-abc123"
                    }
                }
            }
            }
6.  Resource Blocks:
        A resource block declares a resource of  a given local name, The name is used to refer to this resource from elsewhere in the same terraform module, but has no significance outside that module's scope. 

7.  Expressions:
        A statement which evaluaes a statement and perform operations on it.
        It is being executed at the backend
8.  User defined variables can have '-' in them and for better readability any variable defined by user can have a '-' and terraform arguments,blocks have '_' in their name, Thus it keeps the code clean.

9.  *** Below commands are used in sequece to run and apply and destroy and format terraform ***
    

        #   terraform init
        #   terraform validate
        #   terraform fmt   // This will format the code automatically to keep it clean
        #   terraform plan
        #   terraform apply
        #   terraform destroy
    
10. Variables:
    
    Variables are defined in variables block and below is an example of variable declaration.

        In terraform variable can be assigned values in 5 ways.
            variable "resource_group_name"{} - This is declaration of variable.
            name = var.resource_group_name - This is how we call the variable.
        Types to call a variable:
            *    Interactive mode
            *    Using variable defaults
            *    Using terraform commandline argument --var
                    During Runtime value can be defined as --var "foo=bar" --var "foo2=bar"
            *    Using terraform commandline argument --var-file"
                    If the file is saved in same directory as name terraform.tfvars then we do not need to use --var-file to explictly call it.
            *    Using environment variable TF_VAR_<variable_name>
                    Using environment variable TF_VAR_variable_name, We need to append TF_VAR in the begining of the variable.

        Default value of a variable:

            variable "azure_group_name"{
                
                default = "My-RG-1"

            }
11. Terraform Outputs:
        Terraform returns output : Which is generally attribute values.
                
                
                output "resource_group_id"{
                    value = azurerm_resource_group.terraform_name.id

                }

                output "vnet-id"{
                    value = azure_virtual_network.name.id
                }
                



# Day 4:

-   Variables: Adding description to variable in variable block . As this will give good representation of code.
        variable "name"{
            description = "Name of ther person"
            default = "amit"
            type = string

        }

    - There could be various data types in variable.
        - String
        - Numeric (contains float and integers)
        - Boolean
        - List
            - List also supports nested lists of map in a list
                [ 
                    [1, 2, 3, 4],
                    {"amit"="name", "surname" = "sharma }
                ]
        - Map/Object: Complex map is called object
            - {
                "Name" = "Amit",
                "city" = "Munich"
                "age" = 31  - ## Since this is an integer type so it becomes an obj

            }
        - Null
        - Set: It is a list in which duplicates are not allowed.

## Important you can write your code then break it in to multiple files for better readability.

# Example of some other providers.
    - Local : This is used to create file locally, May be to output password in a file rather than on screen.
    - Random - This is used for generating random id,password, number etc.
## We can have sensitive  = True in outputs.tf output block to stop the output from being displayed on screed if you wish to.


