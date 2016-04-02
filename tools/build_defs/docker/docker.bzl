def _docker_pull_impl(ctx):
  """Implementation for the docker_pull rule."""
  name = ctx.label.name
  image = ctx.attr.image
  ctx.action(
      executable = ctx.executable.pull_image,
      arguments = [image, ctx.outputs.out.path],
      outputs = [ctx.outputs.out],
      use_default_shell_env = True
  )

docker_pull_ = rule(
    implementation = _docker_pull_impl,
    attrs = {
        "image": attr.string(),
        "pull_image": attr.label(
            default=Label("//tools/build_defs/docker:pull_image"),
            cfg=HOST_CFG,
            executable=True,
            allow_files=True)
    },
    outputs = {
        "out": "%{name}.tar",
    }
)

def docker_pull(**kwargs):
  """Download a docker image.
  This rule downloads a docker image
  Args:
    **kwargs: See above.
  """
  docker_pull_(**kwargs)