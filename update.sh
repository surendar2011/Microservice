#!/bin/bash

# Loop through all branches in the repository
for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    echo "Switching to branch $branch..."
    
    # Checkout the branch
    git checkout $branch

    # Find and replace adijaiswal with surendar2011 in all Jenkinsfiles
    find . -type f -name 'Jenkinsfile' -exec sed -i 's/adijaiswal/surendar2011/g' {} +

    # Stage the changes
    git add .

    # Commit the changes
    git commit -m "Replaced adijaiswal with surendar2011 in Jenkinsfile"

    # Push the changes to the remote repository
    git push origin $branch
done

