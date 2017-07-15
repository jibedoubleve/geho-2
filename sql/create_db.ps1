. ".\\configuration.ps1"

$scripts = @(
    ".\\scripts\\ddl.sql",
    ".\\scripts\\debug-data.sql",
    ".\\views\\cal_weeks_in_year_v.sql",
    ".\\views\\cal_day_in_week_v.sql",
    ".\\views\\cal_half_day_v.sql",
    ".\\views\\cal_full_calendar_v.sql",
    ".\\views\\ocupation_activities_educators_v.sql",
    ".\\views\\ocupation_activities_recipients_v.sql",
    ".\\views\\french_schedule_of_activities_v.sql",
    ".\\views\\french_schedule_of_teams_v.sql",
    ".\\views\\free_educator_v.sql",
    ".\\views\\free_recipient_v.sql"
)
try {
    Write-Host "Create database..." -ForegroundColor Yellow
    Write-Host "Build tables..."-NoNewline
    Execute-Script $ddl
    Write-Done

    Write-Host "Filling database debug data..." -NoNewline
    Execute-Script $data
    Write-Done

    foreach ($script in $scripts) {
        Write-Host "Building '$script'... " -NoNewLine
        Execute-Script $script
        Write-Done
    }    
}
catch {
    Write-Host ' Error.' -ForegroundColor DarkRed
    Write-Host $_.Exception - -ForegroundColor Red
}