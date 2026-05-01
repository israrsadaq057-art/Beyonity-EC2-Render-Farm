## IT AND NETWORK ADMINISTRATOR

**Israr Sadaq** | CCNA | CCNP | Master in Information and Communication Engineering  
**Email:** israrsadaq057@gmail.com  
**GitHub:** https://github.com/israrsadaq057-art  

---

## PROJECT OVERVIEW

Complete EC2-based render farm for Beyonity, a real estate marketing company with 20 artists creating 3D property visualizations. The infrastructure processes render jobs in parallel using multiple EC2 workers, auto-scaling based on queue length.

---


---

## AWS SERVICES USED

| Service       | Purpose                          |
|--------------|----------------------------------|
| EC2          | Worker nodes for rendering       |
| SQS          | Job queue                        |
| Auto Scaling | Dynamic worker scaling           |
| IAM          | Secure access control            |
| CloudWatch   | Monitoring and alerts            |
| S3           | Asset storage                    |

---

## FEATURES

| Feature              | Implementation              |
|---------------------|-----------------------------|
| Job Queue           | AWS SQS FIFO queue          |
| Parallel Processing | Multiple EC2 workers        |
| Auto Scaling        | Based on queue length       |
| IAM Security        | Least privilege roles       |
| Monitoring          | CloudWatch alarms           |
| Cost Control        | Scale to zero when idle     |

---

## TEST RESULTS

| Test             | Workers | Jobs | Time per Job | Total Time | Status   |
|------------------|---------|------|--------------|------------|----------|
| Single Worker    | 1       | 10   | 5 seconds    | 50 seconds | ✅ PASS |
| Parallel Workers | 5       | 10   | 5 seconds    | 10 seconds | ✅ PASS |
| Stress Test      | 53      | 50   | 5 seconds    | 10 seconds | ✅ PASS |

---

## HOW IT WORKS

### Step 1: Artist submits render job
Artist uploads 3D model to S3 and sends message to SQS queue.

### Step 2: Queue holds jobs
SQS stores messages until workers are available.

### Step 3: Workers pull jobs
EC2 instances continuously poll the queue for new messages.

### Step 4: Parallel processing
Multiple workers process different jobs simultaneously.

### Step 5: Auto scaling
More workers launch when queue length exceeds threshold.

### Step 6: Results saved
Completed renders uploaded to S3 output bucket.

### Step 7: Artist downloads
Artist retrieves finished render from S3.

---

## REPOSITORY STRUCTURE
```
beyonity-ec2-render-farm/
├── README.md
├── scripts/
│ ├── ec2-render-farm-setup.ps1
│ ├── worker.sh
│ └── test-render-farm.ps1
├── policies/
│ └── ec2-render-role-policy.json
├── monitoring/
│ └── README.md
├── screenshots/
│ ├── 01-sqs-queue.png
│ ├── 02-ec2-instances.png
│ ├── 03-auto-scaling-group.png
│ ├── 04-launch-template.png
│ └── 05-iam-role.png
└── .github/workflows/
└── deploy.yml
```
# BEYONITY EC2 RENDER FARM

---

## SCREENSHOTS

This section provides a complete visual walkthrough of the system from setup to execution.

### 1. SQS Queue Overview
<img width="1920" height="1080" alt="beyonity-render-queue" src="https://github.com/user-attachments/assets/d1fad62b-f654-4e5f-a84a-ad9d62439533" />
 
### 2. EC2 Worker Instances
<img width="1920" height="1080" alt="running_Four_worker_to_check_parllel_queue_operation" src="https://github.com/user-attachments/assets/ba5d3789-0592-4ddc-8827-5c4586539894" />

### 3. Auto Scaling Group
 <img width="1920" height="1080" alt="Auto_Scaling_Group-EC2" src="https://github.com/user-attachments/assets/5ea7e90e-4c2b-4668-9fd7-10cbe2dad35d" />

### 4. Launch Template
<img width="1920" height="1080" alt="Launch Template" src="https://github.com/user-attachments/assets/29ba8ca2-f531-4436-ac9c-f7016436eeca" />

### 5. IAM Role Configuration
 <img width="1920" height="1080" alt="EC2_IAM_Role" src="https://github.com/user-attachments/assets/382fcffd-2571-45bd-a392-13e7b1286dba" />

### 6. Final Results:Parallel Processing Working Perfectly
 <img width="1920" height="1080" alt="Results_Prallel_Processing_working" src="https://github.com/user-attachments/assets/da6d6e87-8b64-4337-b5fc-920f667a4174" />

---
 
 ### About Me

Network and IT Administrator | CCNA | CCNP | Master in Information and Communication Engineering
Experienced in optical networks, enterprise firewalls, cloud infrastructure (AWS), and automation.
Portfolio: github.com/israrsadaq057-art

