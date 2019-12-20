param (
    [string]$command  = "list",
    [string]$scenario = "default",
    [string]$role     = "vault",
    [string]$distro   = "centos:7",
    [string]$cmd      = "/usr/sbin/init"
)

docker run --rm -it `
  -v "$($pwd)/$($role):/tmp/$($role)" `
  -v "/var/run/docker.sock:/var/run/docker.sock" `
  -w "/tmp/$($role)" `
  -e TEST_IMAGE="$($distro)" `
  -e TEST_IMAGE_CMD="$($cmd)" `
  -e MOLECULE_NO_LOG=false `
  quay.io/ansible/molecule:latest `
  molecule $command --scenario-name $scenario
