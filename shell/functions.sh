# shell/functions.sh — shared shell functions

docker_run() {
    local image_name=${1}
    shift
    local container_name="${image_name}-${RANDOM}"
    container_name=$(echo "${container_name}" | sed 's/[:\\/]/-/g')
    docker run --name "${container_name}" -it "${image_name}" "$@"
    docker rm "${container_name}"
}
