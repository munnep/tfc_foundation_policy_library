# tfc_foundation_policy_library

HashiCorp has moved the Foundation Policy Library to the Public Registry called `Policies Library`. This can be found [here](https://registry.terraform.io/browse/policies)

This repo shows an example on how to use a policy from the `Policies Library`. This case we will use a policy that verifies the creation of a security rule on AWS that allows traffic from `0.0.0.0/0` to port 22. 

# Prerequesites
- Have access to Terraform Cloud
- Have access to AWS


# How to
- Fork this repo to your own environment
- We are going to use a policy that was gathered from the Terraform Registry policies [here](https://registry.terraform.io/policies/hashicorp/aws-networking-terraform/1.0.2/policy/deny-public-ssh-acl-rules)  

![](media/20230420134421.png)  

- Look at the contents of the file `sentinel.hcl`
```hcl
policy "deny-public-ssh-acl-rules" {
  source = "https://registry.terraform.io/v2/policies/hashicorp/aws-networking-terraform/1.0.2/policy/deny-public-ssh-acl-rules.sentinel?checksum=sha256:b56a7869c9ddd2bece7de8d251de106e072407207247e6f94e001b6eba22c71b"
  enforcement_level = "advisory"
}
```
- Login to your TFC account
- Go to settings -> Policy Sets
![](media/20230420134631.png)  
- Connect a new policy set  
![](media/20230420134718.png)  
- Connect to your repository  
![](media/20230420134743.png)
- Select the repository  you forked  
![](media/20230420134818.png)  
- Leave the name as it is and select `policies enforced on selected workspaces`  Don't select a workspace yet
![](media/20230420134907.png)  
- You should now have the policy in you overview  
![](media/20230420134956.png)
- Add a workspace that will make use of this policy set
- Add a new workspace
![](media/20230420135058.png)  
- Version control  
![](media/20230420135116.png)
- Select your github environment  
![](media/20230420135136.png)  
- select the same repo again you forked (we will run terraform from a diffirent directory)
![](media/20230420135237.png)  
- Create the workspace   
![](media/20230420135257.png)  
- On the workspace you just created go to Settings -> General -> Terraform Working Directory and add the value `terraform_code`  

![](media/20230420135403.png)
- On the `variables` page add your AWS credentials 
![](media/20230420140547.png)  

- Go back to the policy sets and select the policy we created
- Add the workspace to the policy set (click on the add button)  
![](media/20230420135520.png)
- The overview should show there is now 1 workspace on this policy set  
![](media/20230420135558.png)
- Go back to the workspace and do a terraform plan  
![](media/20230420135651.png)   
- The sentinel policy will run and see that the codes wants to create a security rule which is not allowed accoording to your policy    
![](media/20230420140924.png)

