#!/bin/bash
echo -e "\e[1;33mWelcome to Text-to-Pdf converter \e[0m"
PATH_CURR=$(pwd)
echo -e "\e[1;33mCurrently we are in $PATH_CURR \e[0m"
echo -e "\n\e[1;36mProvide name of local text file \e[0m: "
read file_name
enscript -p output.ps "$file_name.txt"
echo -e "\n\e[1;36mProvide name for pdf file\e[0m: "
read pdfname
ps2pdf output.ps "$pdfname.pdf"
rm -rf output.ps