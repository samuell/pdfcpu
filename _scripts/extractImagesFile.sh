#!/bin/sh

# Copyright 2018 The pdfcpu Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#: ./extractImagesFile.sh ~/pdf/1mb/a.pdf ~/pdf/out

if [ $# -ne 2 ]; then
    echo "usage: ./extractImagesFile.sh inFile outDir"
    exit 1
fi

f=${1##*/}
f1=${f%.*}
out=$2

#rm -drf $out/*

#set -e

mkdir $out/$f1
cp $1 $out/$f1 

pdfcpu extract -verbose -mode=image $out/$f1/$f $out/$f1 &> $out/$f1/$f1.log
if [ $? -eq 1 ]; then
    echo "image extraction error: $1 -> $out/$f1"
    exit $?
else
    echo "image extraction success: $1 -> $out/$f1"
fi
	

	
