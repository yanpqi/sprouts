#!/bin/sh
# generate tag file for lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find $PWD -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
    sort -f >> filenametags 
# generate tags file for ctags
ctags -R --fields=+iaS --extra=+q --c++-kinds=+px *
# generate cscope files
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -name "*.java" -name "*.idl" > cscope.files
cscope -Rbkq -i cscope.files
rm cscope.files
