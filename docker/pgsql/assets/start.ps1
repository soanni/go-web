# create postgres role then do appropriate detached / interactive action

param(
[ValidateSet('interactive', 'detached', ignorecase=$true)]
[string]$attachmode="interactive",
[string]$sqldata="c:\sql",
[string]$pguser="postgres"
)

set-strictmode -version latest
$ErrorActionPreference = "Stop"

C:\postgresql\pgsql\bin\createuser -s -r $pguser
#create postgres role for postgres user / db if needed (first time this script is run in container)
C:\postgresql\pgsql\bin\psql -U $pguser -d $pguser -c "\c $pguser"
if ($LASTEXITCODE -ne 0) {
  C:\postgresql\pgsql\bin\createuser -s -r $pguser
  C:\postgresql\pgsql\bin\psql -U $pguser -d $pguser -c "\c $pguser"
  if ($LASTEXITCODE -ne 0) {
    "could not create role"
    exit 1
  }
}

# take interactive / detached action as appropriate
if ($attachmode -eq "interactive") {
  powershell
}
else {
 # sleep-loop indefinitely (until container stop)
 while (1 -eq 1) {
   [DateTime]::Now.ToShortTimeString()
   Start-Sleep -Seconds 1
  }
}
