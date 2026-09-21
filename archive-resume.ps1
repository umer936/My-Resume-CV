[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d{4}$')]
    [string]$Year,

    [Parameter()]
    [string]$SourceRoot = $PSScriptRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sourceRoot = (Resolve-Path -LiteralPath $SourceRoot).Path
$outputDir = Join-Path $sourceRoot 'output_pdfs'
$archiveDir = Join-Path $outputDir (Join-Path 'old' $Year)

if (-not (Test-Path -LiteralPath $outputDir)) {
    throw "Output directory not found: $outputDir"
}

$filesToArchive = Get-ChildItem -LiteralPath $outputDir -File -Filter "$Year*.pdf"

if (-not $filesToArchive) {
    Write-Host "No PDFs found in $outputDir matching $Year*.pdf"
    return
}

if ($PSCmdlet.ShouldProcess($archiveDir, "Create archive folder")) {
    New-Item -ItemType Directory -Path $archiveDir -Force | Out-Null
}

foreach ($file in $filesToArchive) {
    $destination = Join-Path $archiveDir $file.Name
    if ($PSCmdlet.ShouldProcess($destination, "Move $($file.FullName)")) {
        Move-Item -LiteralPath $file.FullName -Destination $destination -Force
        Write-Host "Moved $($file.Name) -> $destination"
    }
}
