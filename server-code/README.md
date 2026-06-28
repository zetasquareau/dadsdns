# Installers note
## Prerequisite
- Create AWS Account
- Create Admin User
- Set up Access Keys

## Step 1 - Domain Name		
-	Buy Domain Name
-- Used Namecheap.com to buy dadsdns.site
-- Used AWS Route53 as the Name Server
-	Buy SSL/TLS Cert	*.dadsdns.site, dadsdns.site
-- Bought from AWS Certificate Management

## Step 2 - Prepare Block List		
-	Use Technitium List	
-	Custom List	
--	Create Gitlab [repository](https://github.com/zetasquareau/dadsdnslists) 
--	Create Block list
--	Create Allow list

## Step 3 Prepare Technitium Master Image		
-	Create a VM using AWS EC2 console	
-	Install [Technitium](https://technitium.com/dns/)	- follow instructions
-	Configure	
--	TLS - use the ssl/tls cert and follow instructions on Technitian config page
--	Add Block/Allow List, including customlist to be able to tweek the list without requiring reinstallation
---	https://raw.githubusercontent.com/zetasquareau/dadsdnslists/refs/heads/main/allowlist
---	https://raw.githubusercontent.com/zetasquareau/dadsdnslists/refs/heads/main/blocklist
--	Add DNS Forwarder - 1.1.1.3, 1.0.0.3
--	Create Snapshot/Image	
These steps could be automated in future version using terraform scripts.

## Step 4 Build Deployer		
-	Create OpenTofu VM	
-	Install OpenTofu	
-	Write Terraform Script	
-- See [Tutorial](https://www.youtube.com/watch?v=1m54kzfjGtM) and [source code](https://github.com/kodedge-swapneel/terraform-lectures/tree/main/lecture-5)
-- update the codes, replace placeholders to build this system 
-  Save Snapshot 

## Deploy Technicium Infrastructure		
- On OpenTofu vm, Run TF Script
-- sudo tofu apply -auto-approve
   
## Prepare Instructions for Users
- this documentation and the setup doc
  
## Cleanup		
-	Stop and delete opentofu vm
