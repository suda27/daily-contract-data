@echo off
echo ========================================
echo Daily Contract Lambda Deployment Script
echo ========================================

echo.
echo Step 1: Cleaning and packaging the project...
call mvn clean install

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Maven build failed!
    pause
    exit /b 1
)

echo.
echo Step 2: Creating packaged template...
call sam package --template-file template.yaml --output-template-file packaged-daily-contract.yaml --s3-bucket user-lambda-deploy-bucket

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: SAM package failed!
    pause
    exit /b 1
)

echo.
echo Step 3: Deploying the SAM stack...
call sam deploy --template-file packaged-daily-contract.yaml --stack-name EM-DailyContractService --capabilities CAPABILITY_IAM

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: SAM deploy failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Deployment completed successfully!
echo ========================================
echo.
echo Stack Name: EM-DailyContractService
echo Lambda Function: DailyContractLambda
echo Schedule: Daily at 5:30 PM (currently DISABLED)
echo.
echo To enable the schedule, update the CloudFormation stack
echo and change State: DISABLED to State: ENABLED
echo.
pause 