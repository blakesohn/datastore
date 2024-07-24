# !bin/bash
gcloud config set project $PROJECT_ID

gcloud functions deploy owners_manual \
  --gen2 \
  --region=$REGION \
  --runtime=python310 \
  --source=./src/owners_manual \
  --entry-point=http_owners_manual\
  --min-instances=0\
  --trigger-http \
  --allow-unauthenticated \
  --run-service-account=$FUNCTIONS_SERVICE_ACCOUNT \
  --set-env-vars=PROJECT_ID=$PROJECT_ID,ENGINE_LOCATION=$ENGINE_LOCATION,ENGINE_ID=$ENGINE_ID
