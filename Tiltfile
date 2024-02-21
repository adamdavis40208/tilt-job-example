docker_build('example-html-image', '.')
k8s_yaml('kubernetes.yaml')
k8s_resource('example-html', port_forwards=8000)
load('ext://helm_resource', 'helm_resource', 'helm_repo')


helm_repo(
  'open',
  'https://simonmisencik.github.io/helm-charts',
  labels=['helm-charts'],
  resource_name='helm-repo-open'
)

local_resource(
    name='helm-repo-update',
    labels=['helm-charts'],
    cmd='helm repo update', resource_deps=['helm-repo-open'])

helm_resource(
 name='cukes',
 chart='open/job',
 release_name='example-job',
 image_deps=['example-html-image'],
 image_keys=[('image.repository', 'image.tag')],
 flags=["--values", "env.yaml"],
 labels=["cukes"],
 resource_deps=['helm-repo-update']
)