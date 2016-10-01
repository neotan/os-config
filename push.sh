#!/bin/bash
echo -e "\033[0;32m----Updates to GitHub...\033[0m"

# Add changes to git.
git add -A

# Commit changes.
msg="Rebuild at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push to repo.
echo -e "\033[0;32m----Push to repo ...\033[0m"
git push origin master

