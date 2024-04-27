#!/bin/bash
#
cd ${0%\/*}

cp "UNI/Practica1/${1}" .
rm -fr UNI
sed -i s'/..\/..\/_resources/_resources/g' "${1}"

#get rid of the jopin export header
sed -i '1,8d' "${1}"
#generate the toc
pandoc -s --toc "${1}" -o out.md

#get rid of #{balalalla} stuff on header
sed -i 's/{#.*}//g' "${1}"

mv out.md "${1}"
