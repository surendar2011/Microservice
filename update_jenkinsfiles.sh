for branch in $(git branch); do
    echo "Switching to branch $branch..."
    git checkout $branch
    
    # Find and replace in all Jenkinsfiles
    find . -type f -name 'Jenkinsfile' -exec sed -i 's/adijaiswal/surendar2011/g' {} +

    # Commit the changes
    git add .
    git commit -m "Updated Jenkinsfile: Replaced adijaiswal with surendar2011"

    # Push the changes to the remote repository
    git push myrepo $branch
done

