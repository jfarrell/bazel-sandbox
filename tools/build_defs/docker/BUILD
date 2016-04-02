filegroup(
    name = "srcs",
    srcs = glob(["**"]),
    visibility = ["//tools:__pkg__"],
)

sh_binary(
    name = "pull_image",
    srcs = ["pull_image.sh"],
    deps = [
      "@docker//:docker_env",
    ],
    visibility = ["//visibility:public"],
)
