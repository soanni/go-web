$pathValue = "C:\Users\soanni\go"
$env:GOPATH = $pathValue
[Environment]::SetEnvironmentVariable("GOPATH", $pathValue, "Machine")

$rootValue = "C:\go"
$env:GOROOT = $rootValue
[Environment]::SetEnvironmentVariable("GOROOT", $rootValue, "Machine")