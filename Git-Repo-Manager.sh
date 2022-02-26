#!/bin/bash
echo -e "\e[1;35mScript for pushing into Git Repository\e[0m"
echo -e "\n\e[1;33m1. Pushing\n2. Deleting\n3. Parallel Devolpment\n4. GIT Sync Repositories\n5. Git clone\n6. Log book for commits\e[0m"
read opinion1

if [ $opinion1 == 1 ]
then
    read -p "Do you want push into new repository: [Y/N]" opinion2
    if [[ $opinion2 == [Y] ]]
    then
        echo -e "\n\e[1;36mEnter Repository Name: \e[0m"
        read Repo_name
        echo "# $Repo_name" >> README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M master
        echo -e "\n\e[1;36mCreate a Remote Repository in GitHub and Copy HTTP URL\e[0m"
        echo -e "\n\e[1;36mEnter HTTP URL: \e[0m"
        read http_url
        git remote add origin "$http_url"
        git push -u origin master
    else
        git add .
        read -p "Enter Commit Messege: " message2
        git commit -m "$message2 $(date +"%d-%m-%Y-%r")"
        git push
        git pull
    fi
elif [ $opinion1 == 2 ]
then
    echo -e "\n\e[1;36mEnter name of the file: \e[0m"
    read file_name2
    # To delete the file from repository
    git rm -rf $file_name2
    read -p "Enter Commit Messege: " message3
    git commit -m "$message3 $(date +"%d-%m-%Y-%r")"
    git push
    git pull
elif [ $opinion1 == 3 ]
then
    echo -e "\n\e[1;36m1. Do you want to create a new branch\n2. Merge into master branch\e[0m"
    read opinion3

    if [ $opinion3 == 1 ]
    then
        read -p "Enter the name of new branch: " branch1
        git branch "$branch1"
        git checkout "$branch1"
        git branch
        echo -e "\n\e[1;36mProvide name of local file to push : \e[0m"
        read file_name3
        git add $file_name3
        read -p "Enter Commit Messege: " message4
        git commit -m "$message4 $(date +"%d-%m-%Y-%r")"
        git push --set-upstream origin "$branch1"
        git pull
    elif [ $opinion3 == 2 ]
    then
        git branch
        read -p "Enter the name of the branch to checkout(): " branch2
        git merge "$branch2"
        git push
        git pull
    fi


elif [ $opinion1 == 5 ]
then
    PATH_CURR=$(pwd)
    echo -e "\n\e[1;36mDo you want clone the repository in this location: $PATH_CURR [Y/N]\e[0m"
    read opinion5
    if [[ $opinion5 == [Y] ]]
    then
        echo -e "\n\e[1;36mEnter HTTP URL: \e[0m"
        read http_url2
        git clone "$http_url2"
    fi
elif [ $opinion1 == 6 ]
then
    echo -e "\n\e[1;36mDownloading commit log report of this repository: \e[0m"
    git log > log_report.txt
fi

