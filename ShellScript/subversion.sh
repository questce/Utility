#!/bin/sh

#Check Param
if [ $# -ne 1 ]; then
  echo "Usage:command -dirname"
  exit 1
fi

repoDir="$1_repo"
wcopyDir="$1_wcopy"

#Check dir
if [ -d "$repoDir" ]; then
  echo "Error:Repository directory has already existed"
  exit 1
fi

if [ -d "$wcopyDir" ]; then
  echo "Error:Working copy directory has already existed"
  exit 1
fi

#Create directory and repository
mkdir $repoDir
svnadmin create ./$repoDir

mkdir $wcopyDir

#Checkout 
CurrentDir=$(cd $(dirname $0) && pwd) 
repoPath="file://$CurrentDir/$repoDir"
coCommand="svn checkout $repoPath $wcopyDir"
#echo "$coCommand"
eval $coCommand

echo "Success:D"
