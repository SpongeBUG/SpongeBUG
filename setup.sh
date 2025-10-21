#!/bin/bash

# GitHub Profile Setup Script
# Automates the initial setup of your modernized GitHub profile
# Run this script from your SpongeBUG directory

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}GitHub Profile Setup Script${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}"
    echo "Please run this script from your SpongeBUG directory"
    exit 1
fi

echo -e "${GREEN}✅ Git repository detected${NC}"
echo ""

# Check if main branch exists
current_branch=$(git rev-parse --abbrev-ref HEAD)
echo -e "${BLUE}📍 Current branch: ${current_branch}${NC}"

# Stage all changes
echo ""
echo -e "${YELLOW}📦 Staging all changes...${NC}"
git add .

# Commit changes
echo -e "${YELLOW}💾 Committing changes...${NC}"
git commit -m "feat: modernize GitHub profile with interactive elements

- Add animated typing header
- Implement 3D contribution calendar
- Add comprehensive GitHub metrics
- Enhance visual layout with Tokyo Night theme
- Add multiple automation workflows
- Include detailed customization guide

Co-created with Claude (spongebug 2025.1)" || {
    echo -e "${YELLOW}⚠️  No changes to commit or already committed${NC}"
}

# Push to remote
echo ""
echo -e "${YELLOW}🚀 Pushing to remote...${NC}"
git push origin ${current_branch} || {
    echo -e "${RED}❌ Failed to push to remote${NC}"
    echo "You may need to set up remote or resolve conflicts manually"
    exit 1
}

echo -e "${GREEN}✅ Successfully pushed to GitHub!${NC}"
echo ""

# Create output branch for snake animation
echo -e "${YELLOW}🐍 Creating 'output' branch for snake animation...${NC}"

if git rev-parse --verify output &>/dev/null; then
    echo -e "${GREEN}✅ 'output' branch already exists${NC}"
else
    # Save current branch
    original_branch=$current_branch
    
    # Create orphan branch
    git checkout --orphan output
    git rm -rf .
    git commit --allow-empty -m "Initialize output branch for snake animation"
    git push origin output
    
    # Return to original branch
    git checkout $original_branch
    
    echo -e "${GREEN}✅ 'output' branch created successfully${NC}"
fi

echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo ""
echo "1. Enable GitHub Actions:"
echo "   → Go to: https://github.com/SpongeBUG/SpongeBUG/settings/actions"
echo "   → Enable 'Read and write permissions'"
echo "   → Save changes"
echo ""
echo "2. Manually trigger workflows (first time):"
echo "   → Go to: https://github.com/SpongeBUG/SpongeBUG/actions"
echo "   → Run each workflow manually"
echo "   → Wait 2-5 minutes for completion"
echo ""
echo "3. View your new profile:"
echo "   → https://github.com/SpongeBUG"
echo ""
echo "4. Customize further:"
echo "   → Read PROFILE_GUIDE.md for detailed instructions"
echo "   → Read CHANGES.md for quick reference"
echo ""
echo -e "${GREEN}🎉 Your GitHub profile is now modernized!${NC}"
echo ""
