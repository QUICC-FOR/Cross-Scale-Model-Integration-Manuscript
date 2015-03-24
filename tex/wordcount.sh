word=`texcount -sub=none manuscript.tex | sed -n -E 's/[[:space:]]+([0-9]+).+abstract/\1/p'`
sed -i backup -E 's/[0-9]+([[:space:]]+%ABS_COUNT)/'"${word}"'\1/g' manuscript.tex 
word=`texcount -sub=none manuscript.tex | sed -n -E 's/[[:space:]]+([0-9]+).+manuscript/\1/p'`
sed -i backup -E 's/[0-9]+([[:space:]]+%WORD_COUNT)/'"${word}"'\1/g' manuscript.tex 
