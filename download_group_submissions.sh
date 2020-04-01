#!/bin/bash

unset QMGROUPS
declare -A QMGROUPS
QMGROUPS=(["5663"]="$1" ["5664"]="$1".1 ["5665"]="$1".2 ["5666"]="$1".3 ["5943"]="$1".4 ["5944"]="$1".5 ["5945"]="$1".6 ["5946"]="$1".7)
DIR_PREFIX=Group
CURDIR=`pwd -P`

for qmgroup in "${!QMGROUPS[@]}"
do
  wget --cookies=on --random-wait --load-cookies=learncookie.txt --output-document=${qmgroup}.zip --keep-session-cookies --no-check-certificate --post-data 'm=download_submissions' "https://learn.wu.ac.at/dotlrn/classes/qm2/${qmgroup}.20s/tlf-lrn/exercises/$1"
done

for qmgroup in "${!QMGROUPS[@]}"
do
  #ls -1 | grep "${QMGROUPS[$qmgroup]}" | xargs -I zipfile unzip zipfile -d "${DIR_PREFIX}${qmgroup}"
  unzip ${qmgroup}.zip -d "${DIR_PREFIX}${qmgroup}"
done

for dir in "${!QMGROUPS[@]}"
do
  cd "${DIR_PREFIX}${dir}"
  for pdf in *.pdf
  do
    mv "${pdf}" "${pdf:0:6}.pdf"
  done
  echo `pwd -P` "done"
  cd ${CURDIR}
done

