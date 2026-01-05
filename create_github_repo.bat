@echo off
echo 🚀 Jeevan GitHub Repository Setup
echo ================================

set /p username="Enter your GitHub username: "
set repo_name=jeevan-app

echo.
echo Setting up remote repository...
git remote add origin https://github.com/%username%/%repo_name%.git

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ✅ Repository setup complete!
echo 📱 Your repository is now available at:
echo https://github.com/%username%/%repo_name%

echo.
echo 📋 Next steps:
echo 1. Go to your GitHub repository
echo 2. Add repository topics: flutter, dart, automotive, safety
echo 3. Enable Discussions (optional)
echo 4. Set up branch protection rules
echo 5. Create your first release

pause