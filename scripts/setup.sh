#!/bin/bash

base_dir=$(cd $(dirname $0)/..;pwd)
work_dir=${base_dir}/target

dify_version=0.6.8
dify_download_url="https://github.com/langgenius/dify/archive/refs/tags/${dify_version}.zip"
dify_zip_file="${work_dir}/dify-${dify_version}.zip"

if [[ ! -d "${work_dir}" ]] ; then
  mkdir "${work_dir}"
fi

if [[ ! -f "${dify_zip_file}" ]] ; then
  echo "Downloading dify-${dify_version} from ${dify_download_url}"
  curl -sL -o "${dify_zip_file}" "${dify_download_url}"
fi

echo "Extracting from ${dify_zip_file}"
rm -rf "${work_dir}/dify-${dify_version}"
unzip -d "${work_dir}" "${dify_zip_file}" > /dev/null

echo "Copying compose files from ${work_dir}/dify-${dify_version}"
mv "${work_dir}/dify-${dify_version}/docker/docker-compose.yaml" "${base_dir}/compose-dify.yaml"
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s/^version:/# version:/" "${base_dir}/compose-dify.yaml"
  sed -i '' "s/80:80/8000:80/" "${base_dir}/compose-dify.yaml"
else
  sed -i "s/^version:/# version:/" "${base_dir}/compose-dify.yaml"
  sed -i "s/80:80/8000:80/" "${base_dir}/compose-dify.yaml"
fi
rm -f ${work_dir}/dify-${dify_version}/docker/docker-*
cp -r ${work_dir}/dify-${dify_version}/docker/* ${base_dir}

