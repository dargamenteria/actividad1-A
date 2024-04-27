#!/bin/bash
#
cd ${0%\/*}

cp "UNI/Practica1/${1}" .
rm -fr UNI
sed -i s'/..\/..\/_resources/_resources/g' "${1}"
