def _impl(ctx):
  exports = []
  for k in ctx.os.environ:
    if k.startswith("DOCKER"):
      exports.append("export %s='%s'" % (k, ctx.os.environ[k]))

    ctx.file("docker_env.sh", "\n".join([
      "#!/bin/bash",
      "\n".join(exports)]
    ))

    ctx.file("BUILD", "\n".join([
      "sh_library(",
      "  name = 'docker_env',",
      "  data = ['docker_env.sh'],",
      "  visibility = ['//visibility:public'],",
      ")"]
    ))

docker_repository_ = repository_rule(_impl)

def docker_repository():
  """Declare a @docker repository that provide a docker specific environment variables."""
  docker_repository_(name = "docker")
