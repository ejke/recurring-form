#!/bin/bash
# --------------------------------
#  This file will fill a web form.
# --------------------------------
# 
# 1. Go to webpage to get this weeks form link
lynx -dump https://pmg.edu.ee/2021/02/26/oppekorraldus-pmg-s-alates-1-martsist-2021/ | awk '/http/{print $2}' > links.txt
grep 'https://docs.google.com/forms/' links.txt > forms.txt

# Go to formpage, read it, if includes 'toidupakk', use that form
cat forms.txt | while read line; do
#   echo $line
#   if grep -q 'foo' ~/.bash_history
    if lynx -dump $line | grep -q 'toidupakk'; then
        echo "You have found the right form url: "
        # echo $line
        # FORM_URL = $line
        # echo $FORM_URL
        # FORM_URL+="$line";
        FORM_URL+="${line}"
        echo $FORM_URL
    fi
#   lynx -dump $line | grep 'toidupakk'
done

echo " And again form url:"
echo $FORM_URL
echo "$FORM_URL"
echo "${FORM_URL}!"

#  we are in subshell by pipes. a) try to remove pipes to access the var b) do all commands within while and if. 

# 2. Go to the form link
# Week 22-26 of March link to compare to: https://docs.google.com/forms/d/e/1FAIpQLSeg0iPuYWZKfwz435Weuk0hbasuHi4Y6AWXw8PO2brRH3XSDA/viewform
