
# DevOps Git Workflow Example

This repository demonstrates basic Git operations such as branching, adding features, and resolving merge conflicts using a sample workflow.

## Steps Followed

### 1. Clone the Repository
To begin, clone the repository to your local machine:
```bash
git clone https://github.com/rutujachandurkar03/Devops.git
```

### 2. Initialize a New Git Repository (if not cloned)
```bash
git init
```

### 3. Create and Navigate into a New Directory
```bash
mkdir Git
cd Git
```

### 4. Create a New File
A new text file `version01.txt` was created with the first feature of the application.
```bash
vim version01.txt
```

### 5. Check Git Status
After making changes, the status of the repository was checked:
```bash
git status
```

### 6. Create and Switch to a New Branch
A new branch `dev` was created to isolate development work:
```bash
git checkout -b dev
```

### 7. Add and Commit the Changes
The file `version01.txt` was added and committed:
```bash
git add Git/version01.txt
git commit -m "Added new feature"
```

### 8. Push the Changes to the `dev` Branch on GitHub
```bash
git push origin dev
```

### 9. Add More Features with Separate Commits
The `version01.txt` file was updated multiple times with different commits:
```bash
echo "This is the bug fix in development branch" >> Git/version01.txt
git commit -am "Added feature2 in development branch"

echo "This is gadbad code" >> Git/version01.txt
git commit -am "Added feature3 in development branch"

echo "This feature will gadbad everything from now" >> Git/version01.txt
git commit -am "Added feature4 in development branch"
```

### 10. Revert the Last Two Commits
To fix the incorrect changes, the last two commits were reverted:
```bash
git revert HEAD~2
```

### 11. Create Additional Branches
Multiple branches were created for different features:
```bash
git checkout -b feature1
git checkout -b feature2
```

### 12. Merge Branch `dev` into `master`
Once development was done, the `dev` branch was merged back into the `master` branch:
```bash
git checkout master
git merge dev
```

### 13. Rebase the Branch with `main`
For practice, a rebase was attempted:
```bash
git rebase main
```

### 14. View Branches and Final Push
All branches were checked, and final changes were pushed:
```bash
git branch -a
git push origin dev
```

---

## Summary
This project showcases a typical Git workflow involving feature development, branching, committing, merging, and resolving conflicts. The steps above outline how to manage a project with multiple branches and commits efficiently.
