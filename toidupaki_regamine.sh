#!/bin/bash
# --------------------------------
#  This file will fill a web form.
# --------------------------------
# 
# 1. Go to webpage to get this weeks form link
lynx -dump https://pmg.edu.ee/2021/02/26/oppekorraldus-pmg-s-alates-1-martsist-2021/ | awk '/http/{print $2}' > links.txt
grep 'https://docs.google.com/forms/' links.txt > forms.txt

# Go to formpage, read it, if includes 'toidupakk', use that form
while read line; do
    if lynx -dump $line | grep -q 'toidupakk'; then
        FORM_URL="${line}"
    fi
done  < forms.txt

echo "Got the form url: "
echo $FORM_URL

# 2. Go to the form link
# Week 22-26 of March link to compare to: https://docs.google.com/forms/d/e/1FAIpQLSeg0iPuYWZKfwz435Weuk0hbasuHi4Y6AWXw8PO2brRH3XSDA/viewform
