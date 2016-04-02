load("@bazel_tools//tools/build_defs/docker:docker.bzl", "docker_build")

docker_build(
    name = "scratch",
    data_path = "resources",
    files = glob(["resources/**"]),
)

