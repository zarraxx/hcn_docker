#!/bin/bash

workDir=$(cd `dirname $0`; pwd)
if [ ${workDir:0-3} == 'bin' ]; then
	cd $workDir/..
	workDir=$PWD
else
  cd $workDir
fi

classpath='.'
filelist=`ls ~+/lib/`
for file in $filelist
	do
 		classpath=${classpath}':lib/'${file}
	done

java  -Duser.dir=$workDir -cp $classpath hcn.mpi.runtime.Main > ${workDir}"/logs/server.log"