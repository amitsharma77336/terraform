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




