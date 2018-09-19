from invoke import task

@task
def stylecheck(ctx):
    ctx.run('terraform fmt -check=false')
    ctx.run('docker run --rm -v $(pwd):./ --workdir=./ -t wata727/tflint --error-with-issues')

@task
def generatedocs(ctx):
    ctx.run('cat README_HEADER.md > README.md && terraform-docs md . >> README.md ')

@task
def enc(ctx, file='local.env', encoded_file='env.ci'):
    ctx.run("openssl aes-256-cbc -e -in {} -out {} -k $FEEDYARD_PIPELINE_KEY".format(file, encoded_file))

@task
def dec(ctx, encoded_file='env.ci', file='local.env'):
    ctx.run("openssl aes-256-cbc -d -in {} -out {} -k $FEEDYARD_PIPELINE_KEY".format(encoded_file, file))