#!/bin/bash


touch out

ndncatchunks -d fixed ndn:/example/dataset/argo_bio-profile_index/%FD%00%00%01Qc%CF%17v &> out

FOUND=`grep 'ERROR: Could not retrieve data for /' out `

while [ ! -z "$FOUND" ]; do ndncatchunks -d fixed ndn:/example/dataset/argo_bio-profile_index/%FD%00%00%01Qc%CF%17v &> out && FOUND=`grep 'ERROR: Could not retrieve data for /' out `&& echo $FOUND && sleep 0.5; done
                
# wget ftp://ftp.ifremer.fr/ifremer/argo/argo_bio-profile_index.txt &> /dev/null 
                


