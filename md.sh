#!/bin/bash
#
cd ${0%\/*}

cp "UNI/Practica1/${1}" .
rm -fr UNI
sed -i s'/..\/..\/_resources/_resources/g' "${1}"
sed -i '1,8d' "${1}"
pandoc -s --toc "${1}" -o out.md
mv out.md "${1}"
