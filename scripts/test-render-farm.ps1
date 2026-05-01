# BEYONITY RENDER FARM TEST
$QueueUrl = "https://sqs.us-east-1.amazonaws.com/945504685795/beyonity-render-queue"

Write-Host "Sending test jobs..."
for ($i=1; $i -le 10; $i++) {
    aws sqs send-message --queue-url $QueueUrl --message-body "{\"job_id\":$i}"
}

Start-Sleep -Seconds 3
$QueueCount = aws sqs get-queue-attributes --queue-url $QueueUrl --attribute-names ApproximateNumberOfMessages --query "Attributes.ApproximateNumberOfMessages" --output text
Write-Host "Messages remaining: $QueueCount"

if ($QueueCount -eq "0") { Write-Host "TEST PASSED!" } else { Write-Host "Jobs still in queue" }
