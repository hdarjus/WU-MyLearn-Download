#!/bin/bash

unset QMGROUPS
declare -A QMGROUPS
QMGROUPS=(["5663"]="389262379" ["5664"]="389263201" ["5665"]="389263395" ["5666"]="389263431" ["5943"]="389262646" ["5944"]="388121092" ["5945"]="388121186" ["5946"]="388121301")
DIR_PREFIX=Group

for qmgroup in "${!QMGROUPS[@]}"
do
  wget --cookies=on --load-cookies learncookie.txt --keep-session-cookies --no-check-certificate --output-document="checkbox_Group${qmgroup}.html" --post-data="m=edit&return_url=/dotlrn/classes/qm2/${qmgroup}.20s/learning-app/en/${QMGROUPS[$qmgroup]}/prep-index#anon" "https://learn.wu.ac.at/dotlrn/classes/qm2/${qmgroup}.20s/learning-app/en/${QMGROUPS[$qmgroup]}/prep-survey$1"
done

for qmgroup in "${!QMGROUPS[@]}"
do
  echo Creating ${qmgroup}.csv
  xmllint --nowarning --recover --html --xpath "//table" checkbox_Group${qmgroup}.html 2> /dev/null > ${qmgroup}.html
  Rscript --vanilla -e "library(tidyverse); library(rvest); tab<-html_table(read_html(\"${qmgroup}.html\"))[[1]][, -12] %>% select(Username, \"1\":\"8\") %>% slice(-n()); write_csv(tab, \"${qmgroup}.csv\")" > /dev/null 2>&1
done

