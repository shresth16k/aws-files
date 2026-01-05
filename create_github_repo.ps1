# Jeevan GitHub Repository Setup Script
Write-Host "🚗 Jeevan GitHub Repository Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Get GitHub username
$username = Read-Host "Enter your GitHub username"
$repoName = "jeevan-app"

Write-Host ""
Write-Host "Setting up remote repository..." -ForegroundColor Yellow

try {
    # Add remote origin
    git remote add origin "https://github.com/$username/$repoName.git"
    Write-Host "✅ Remote origin added" -ForegroundColor Green
    
    # Set main branch
    git branch -M main
    Write-Host "✅ Branch set to main" -ForegroundColor Green
    
    # Push to GitHub
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    Write-Host ""
    Write-Host "🎉 Repository setup complete!" -ForegroundColor Green
    Write-Host "📱 Your repository is now available at:" -ForegroundColor Cyan
    Write-Host "https://github.com/$username/$repoName" -ForegroundColor Blue
    
    Write-Host ""
    Write-Host "📋 Next steps:" -ForegroundColor Yellow
    Write-Host "1. Go to your GitHub repository"
    Write-Host "2. Add repository topics: flutter, dart, automotive, safety, emergency-response"
    Write-Host "3. Enable Discussions (Settings → General → Features)"
    Write-Host "4. Set up branch protection rules (Settings → Branches)"
    Write-Host "5. Create your first release (Releases → Create a new release)"
    Write-Host "6. Update README.md with your actual username"
    
} catch {
    Write-Host "❌ Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 Make sure you have:" -ForegroundColor Yellow
    Write-Host "1. Created the repository on GitHub first"
    Write-Host "2. Proper Git authentication set up"
    Write-Host "3. Internet connection"
}

Write-Host ""
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")