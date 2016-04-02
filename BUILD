filegroup(
    name = "git",
    srcs = glob([".git/**"]),
)

filegroup(
  name = "srcs",
  srcs = glob(
    ["**"],
    exclude = [
      "output/**",  # output of compile.sh
      ".*/**",    # git
    ],
  ) + [
    "//src:srcs",
    "//tools:srcs",
    "//third_party:srcs",
  ],
)
