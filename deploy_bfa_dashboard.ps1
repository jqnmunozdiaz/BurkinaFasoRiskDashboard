# Cloud Run Deployment Script for Burkina Faso Dashboard
# Refresh PATH to include gcloud
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Starting deployment of Burkina Faso Dashboard to Google Cloud Run..." -ForegroundColor Green
Write-Host "This will take 5-10 minutes. Please wait..." -ForegroundColor Yellow

# Deploy to Cloud Run with a new service name
gcloud run deploy burkina-faso-risk-dashboard `
  --source . `
  --platform managed `
  --region us-central1 `
  --allow-unauthenticated `
  --port 8080 `
  --memory 2Gi `
  --cpu 2 `
  --timeout 300 `
  --max-instances 10 `
  --set-env-vars ENVIRONMENT=production

Write-Host "`nDeployment complete! Your new dashboard should be live." -ForegroundColor Green
