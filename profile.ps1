oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\huvix__c.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource History

if ($Host.UI.RawUI.WindowSize.Height -gt 17) {
    set-PSReadLineOption -PredictionViewStyle ListView
}
else {
    set-PSReadLineOption -PredictionViewStyle InlineView
}

function fpg {
    flutter pub get
}

function fpu {
    flutter pub upgrade
}

function fpa {
    flutter pub add $args
}

function fpr {
    flutter pub remove $args
}

function frun {
    flutter run $args
}

function gls {
    git ls
}

function ga {
    git add $args
}

function gcm {
    git commit -m $args
}

function gp {
    git push $args
}

function gch {
    git checkout $args
}

function gchb {
    git checkout -b $args
}

function v2 {
    cd "D:\Nudge Dev\v2\"
}

function gg {
    git log --oneline --graph --all --decorate
}

function conan {
    fzf --preview="bat --color=always {}"
}

function oi {

    if ($args.Count -eq 0) {
        Write-Output "ee na cholbe"
        return
    }

    # ensure that two arguments are oi and oi
    if ($args[0] -ne "oi" -or $args[1] -ne "oi") {
        Write-Output "ee pan na cholbe"
        return
    }

    Write-Output "matey matey"
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

function z.. {
    z ..
}

function clipin {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true)]
        [string[]]$Input,
        
        [Parameter(Mandatory = $false)]
        [string]$FileName
    )

    begin {
        $content = @()
    }

    process {
        if ($Input) {
            $content += $Input
        }
        elseif ($FileName -and (Test-Path $FileName)) {
            $content = Get-Content -Path $FileName
        }
        elseif ($FileName) {
            Write-Error "File '$FileName' does not exist."
            return
        }
    }

    end {
        if ($content) {
            $content | Set-Clipboard
            Write-Host "Content has been copied to the clipboard."
        }
    }
}

function clipin_v2 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true)]
        [string[]]$Input,
        
        [Parameter(Mandatory = $false)]
        [string]$FileName,

        [Parameter(Mandatory = $false)]
        [string]$LineNumber
    )

    begin {
        $content = @()
    }

    process {
        if ($Input) {
            # If input is provided via pipeline, add it to content
            $content += $Input
        }
        elseif ($FileName) {
            # Check if the file exists
            if (-not (Test-Path $FileName)) {
                Write-Error "File '$FileName' does not exist."
                return
            }

            # Read the file content
            $fileContent = Get-Content -Path $FileName

            if ($LineNumber) {
                if ($LineNumber -match '^\d+$') {
                    # Single line
                    $line = [int]$LineNumber - 1
                    if ($line -ge 0 -and $line -lt $fileContent.Length) {
                        $content += $fileContent[$line]
                    }
                    else {
                        Write-Error "Line number $LineNumber is out of range."
                        return
                    }
                }
                elseif ($LineNumber -match '^\d+:\d+$') {
                    # Range of lines
                    $startLine, $endLine = $LineNumber -split ':' | ForEach-Object { [int]$_ - 1 }
                    if ($startLine -ge 0 -and $endLine -lt $fileContent.Length -and $startLine -le $endLine) {
                        $content += $fileContent[$startLine..$endLine]
                    }
                    else {
                        Write-Error "Line range $LineNumber is invalid or out of range."
                        return
                    }
                }
                else {
                    Write-Error "Invalid line number format. Use '-n 34' for a single line or '-n 44:59' for a range."
                    return
                }
            }
            else {
                # No line number specified, copy entire file
                $content = $fileContent
            }
        }
    }

    end {
        if ($content) {
            # Join the content into a single string and copy to clipboard
            $contentString = $content -join "`n"
            Set-Clipboard -Value $contentString
            Write-Host "Content has been copied to the clipboard."
        }
        else {
            Write-Host "No content to copy."
        }
    }
}

function clipout {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FileName
    )

    try {
        # Get the clipboard content
        $clipboardContent = Get-Clipboard

        if (-not $clipboardContent) {
            Write-Host "Clipboard is empty. Nothing to append." -ForegroundColor Yellow
            return
        }

        # Append clipboard content to the file
        $clipboardContent | Add-Content -Path $FileName
        Write-Host "Clipboard content has been appended to '$FileName'."
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function zpp {
    param(
        [string]$file = "solution.cpp"
    )
    
    g++ $file -o a.exe
    if ($?) { ./a.exe }
}

function clipdiff {
    begin {
        $content = @()
    }

    process {
        $content = git diff --staged . | Out-String
    }

    end {
        if ($content) {
            $content | Set-Clipboard 
            Write-Host "Content has been copied to the clipboard."
        }
    }
}

function this {
    code .;
    exit
}
