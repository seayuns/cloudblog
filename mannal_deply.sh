#!/bin/bash

dir=$(cd $(dirname $0); pwd)

echo -e "\033[0;32m This Shell Will Prapare to  updateing to GitHub...\033[0m"

echo -e "\033[0;21m Update the local theme form github..."

cd ${dir}/themes
git pull 


echo -e "\033[0;21m Update the local public to github..."

# Build the project.
hugo -t seayun

# Go To Public folder
cd ${dir}/public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site by the mannal shell on  `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push 

# Come Back up to the Project Root

echo -e "\033[0;21m Update the local cloudblog to github..."
cd ${dir}

git add . --all
git commit -m "rebuilding the local cloudblog and commit by mannal shell on `date`"
git push

