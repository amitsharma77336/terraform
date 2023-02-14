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
    

Day1:
    {

        Added first code for provisioning azure resource group.
    }


Update: 
14.02.2023 : Added .gitignore file to the repository and now it am not publishing the .terraform files and .hcl file.
