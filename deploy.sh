
#!/bin/bash
set -e

ACTION=$1

ECR_URL=$(terraform -chdir=terraform output -raw ecr_repository_url)
API_URL=$(terraform -chdir=terraform output -raw api_url)
BUCKET=$(terraform -chdir=terraform output -raw s3_frontend_bucket)
CF_ID=$(terraform -chdir=terraform output -raw cloudfront_distribution_id)

if [ "$ACTION" == "api" ] || [ "$ACTION" == "all" ]; then
  aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_URL
  docker build -t api ./api
  docker tag api:latest $ECR_URL:latest
  docker push $ECR_URL:latest
fi

if [ "$ACTION" == "frontend" ] || [ "$ACTION" == "all" ]; then
  cd app
  REACT_APP_API_URL=http://$API_URL npm run build
  aws s3 sync build/ s3://$BUCKET --delete
  aws cloudfront create-invalidation --distribution-id $CF_ID --paths "/*"
fi
