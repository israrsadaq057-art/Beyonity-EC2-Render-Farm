# BEYONITY EC2 RENDER FARM SETUP
Write-Host "BEYONITY EC2 RENDER FARM DEPLOYMENT" -ForegroundColor Cyan

$SubnetId = "subnet-0330a95e1cc61491a"
$SgId = "sg-0c043fe7d26b3c549"

Write-Host "Creating SQS Queue..."
aws sqs create-queue --queue-name beyonity-render-queue

Write-Host "Creating IAM Role..."
aws iam create-role --role-name EC2-Render-Role --assume-role-policy-document "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
aws iam attach-role-policy --role-name EC2-Render-Role --policy-arn arn:aws:iam::aws:policy/AmazonSQSFullAccess
aws iam attach-role-policy --role-name EC2-Render-Role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam create-instance-profile --instance-profile-name EC2-Render-Profile
aws iam add-role-to-instance-profile --instance-profile-name EC2-Render-Profile --role-name EC2-Render-Role

Write-Host "Creating Launch Template..."
aws ec2 create-launch-template --launch-template-name render-worker-template --launch-template-data "{\"ImageId\":\"ami-00de3875b03809ec5\",\"InstanceType\":\"t3.micro\",\"KeyName\":\"ConsoleRenderKey\",\"SecurityGroupIds\":[\"$SgId\"],\"IamInstanceProfile\":{\"Name\":\"EC2-Render-Profile\"}}"

Write-Host "Creating Auto Scaling Group..."
aws autoscaling create-auto-scaling-group --auto-scaling-group-name render-farm-asg --launch-template LaunchTemplateName=render-worker-template --min-size 0 --max-size 10 --desired-capacity 0 --vpc-zone-identifier $SubnetId

Write-Host "DEPLOYMENT COMPLETE!"
