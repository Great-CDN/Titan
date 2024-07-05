#!/bin/bash

COMMIT_ID=${GIT_COMMIT:0:8}

#push_registry=192.168.1.135:8888/cdn-test

app=""
version=

AppPath="/cdn/${app}"
ServicePort=
RepoAddr="${push_registry%/*}"
RepoPath="/${push_registry#*/}"
ChartVersion="${version%-*}+${COMMIT_ID}"

sed -i "s#%App%#${app}#g"  charts/*.yaml
sed -i "s#%ChartVersion%#${ChartVersion}#g"  charts/Chart.yaml
sed -i "s#%AppVersion%#${version}#g"  charts/*.yaml
sed -i "s#%ServicePort%#${ServicePort}#g"  charts/*.yaml
sed -i "s#%RepoAddr%#${RepoAddr}#g"  charts/*.yaml
sed -i "s#%RepoPath%#${RepoPath}#g"  charts/*.yaml
sed -i "s#%AppPath%#${AppPath}#g"  charts/*.yaml

echo "config:" >> charts/values.yaml
for file in $(ls conf/*|grep -v test)
do
  echo "  - file: ${file##*/}" >> charts/values.yaml
  echo "    fileData: |-" >> charts/values.yaml
  sed "s#^#      #g" ${file} >> charts/values.yaml
done

helm cm-push charts cdn-test