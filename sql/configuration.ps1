$ErrorActionPreference = "Stop"
$dbPath = "C:\\Users\\jibed_000\\Desktop\\GeHo-2.db"

function Execute-Script($path){
    sqlite3 $dbPath ".read $path"
}
function Write-Done{
    Write-Host " Done." -ForegroundColor Green
}