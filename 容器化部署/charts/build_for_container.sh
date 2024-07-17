#!/bin/bash

# code_path="${Branch}"
# commit_id="${GIT_COMMIT:0:8}"
# version="$(grep 'Version=' ${code_path}/lua/version.lua | awk -F "['-]" '{print $2}')-${commit_id}"
# service_port=$(grep listen ${code_path}/conf/nginx.conf|head -n1|awk -F '[ :;]' '{print $(NF-1)}')
# env SOLUTION="cdn" APP="ssgagent" VERSION="${version}" COMMIT_ID=${commit_id} \
#   SERVICE_PORT="${service_port}" CODE_PATH="${code_path}" REGISTRY=${Registry} \
#   bash -xe ./${code_path}/build_for_container.sh

solution="${SOLUTION}"
app="${APP}"
version="${VERSION}"
commit_id="${COMMIT_ID}"
service_port="${SERVICE_PORT}"
code_path="${CODE_PATH}"
registry="${REGISTRY}"

CONTAINER="${JOB_NAME}.el9"
podman stop ${CONTAINER} || true
podman run --rm -v /etc/localtime:/etc/localtime:ro -e COMMIT_ID="${commit_id}" --name ${CONTAINER} -d builder-on-rhel9
podman cp ${code_path} ${CONTAINER}:/
podman exec -it ${CONTAINER} bash -c "cd ${code_path} && sh -xe build.sh"
podman cp ${CONTAINER}:/${code_path}/output .

ls output/* -1|head -1|xargs -n1 tar xf
buildah build --build-arg SOLUTION=${solution} --build-arg APP=${app} --build-arg VERSION=${version} -f ${code_path}/run_on_rhel9 -t ${app}:${version}
#buildah login -u **** -p **** --tls-verify=false 192.168.1.135:8888
buildah push --rm --tls-verify=false ${app}:${version} ${registry}/${app}:${version}
buildah rmi ${app}:${version}

cd ${code_path}
ChartVersion="$(date +"%Y%m%d%H%M%S")-${version%-*}.${commit_id}"
sed -i "s#%App%#${app}#g"  charts/*.yaml
sed -i "s#%ChartVersion%#${ChartVersion}#g"  charts/Chart.yaml
sed -i "s#%AppVersion%#${version}#g"  charts/*.yaml
sed -i "s#%ServicePort%#${service_port}#g"  charts/*.yaml
sed -i "s#%RepoPath%#/${registry#*/}#g"  charts/*.yaml
sed -i "s#%AppPath%#/${solution}/${app}#g"  charts/*.yaml
echo "config:" >> charts/values.yaml
for file in $(ls conf/*|grep -v test)
do
  echo "  - file: ${file##*/}" >> charts/values.yaml
  echo "    fileData: |-" >> charts/values.yaml
  sed "s#^#      #g" ${file} >> charts/values.yaml
done
#helm repo add cdn-test http://192.168.1.135:8888/chartrepo/cdn-test  --username ****** --password ******
helm cm-push charts ${registry#*/}
cd -