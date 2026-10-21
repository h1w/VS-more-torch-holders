$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
$info = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'modinfo.json') -Raw | ConvertFrom-Json
$dist = Join-Path $PSScriptRoot 'dist'
[IO.Directory]::CreateDirectory($dist) | Out-Null
$target = Join-Path $dist ($info.modid + '_' + $info.version + '.zip')
$stream = [IO.File]::Open($target, [IO.FileMode]::Create)
try {
    $zip = [IO.Compression.ZipArchive]::new($stream, [IO.Compression.ZipArchiveMode]::Create)
    try {
        $files = @((Get-Item -LiteralPath (Join-Path $PSScriptRoot 'modinfo.json')), (Get-Item -LiteralPath (Join-Path $PSScriptRoot 'LICENSE'))) + @(Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'assets') -File -Recurse)
        foreach ($file in ($files | Sort-Object FullName)) {
            $relative = $file.FullName.Substring($PSScriptRoot.Length + 1).Replace('\', '/')
            if ($file.Extension -eq '.json') {
                Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json | Out-Null
            }
            $entry = $zip.CreateEntry($relative, [IO.Compression.CompressionLevel]::Optimal)
            $entry.LastWriteTime = [DateTimeOffset]::new(2026, 10, 21, 0, 0, 0, [TimeSpan]::Zero)
            $input = $file.OpenRead()
            $output = $entry.Open()
            try { $input.CopyTo($output) } finally { $output.Dispose(); $input.Dispose() }
        }
    } finally { $zip.Dispose() }
} finally { $stream.Dispose() }
Write-Output $target
