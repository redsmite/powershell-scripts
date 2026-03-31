# Task.ps1
# Simple task manager stored in a CSV file
# Usage:
#   Task add <task description>   -> Adds a new task with a unique ID
#   Task remove <id>              -> Removes task by ID
#   Task                          -> Lists all tasks

param (
    [string]$Action = "",
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Args
)

$taskFile = "C:\Scripts\tasks.csv"

# ── Motivational Quotes ───────────────────────────
$quotes = @(
    "Do it now. Sometimes 'later' becomes 'never'.",
    "You don't have to be great to start, but you have to start to be great.",
    "The pain of regret is worse than the pain of hard work.",
    "Stop waiting for the perfect moment. Take the moment and make it perfect.",
    "Either you run the day or the day runs you.",
    "Done is better than perfect.",
    "What you do today can improve all your tomorrows.",
    "Don't watch the clock; do what it does. Keep going.",
    "Dream big. Start small. Act now.",
    "The secret to getting ahead is getting started.",
    "You will never always be motivated. You have to learn to be disciplined.",
    "One day or day one. You decide.",
    "Someday is not a day of the week.",
    "Work hard in silence. Let success make the noise.",
    "Small progress is still progress.",
    "Your future self is watching you right now through memories.",
    "Discipline is choosing between what you want now and what you want most.",
    "Don't stop when you're tired. Stop when you're done.",
    "If not now, when? If not you, who?",
    "The only way out is through."
)

# ── Ensure task file exists ───────────────────────
if (-not (Test-Path $taskFile)) {
    Set-Content $taskFile "ID,Description,Date"
}

# ── ADD ───────────────────────────────────────────
if ($Action.ToLower() -eq "add") {
    $description = $Args -join " "
    if (-not $description) {
        Write-Host "Please provide a task description." -ForegroundColor Red
        exit
    }

    $id   = "T" + (Get-Date -Format "yyMMddHHmmss")
    $date = Get-Date -Format "yyyy-MM-dd HH:mm"

    $safeDesc = $description -replace '"', '""'
    Add-Content $taskFile "`"$id`",`"$safeDesc`",`"$date`""

    Write-Host ""
    Write-Host "  Task added!" -ForegroundColor Green
    Write-Host "  ID: $id" -ForegroundColor Cyan
    Write-Host "  Task: $description" -ForegroundColor White
    Write-Host ""
}

# ── REMOVE ────────────────────────────────────────
elseif ($Action.ToLower() -eq "remove") {
    $id = $Args -join ""
    if (-not $id) {
        Write-Host "Please provide a task ID." -ForegroundColor Red
        exit
    }

    $tasks = Import-Csv $taskFile
    $task  = $tasks | Where-Object { $_.ID -eq $id }

    if ($task) {
        $remaining = $tasks | Where-Object { $_.ID -ne $id }
        Set-Content $taskFile "ID,Description,Date"
        if ($remaining) {
            foreach ($t in @($remaining)) {
                $safeDesc = $t.Description -replace '"', '""'
                Add-Content $taskFile "`"$($t.ID)`",`"$safeDesc`",`"$($t.Date)`""
            }
        }
        Write-Host ""
        Write-Host "  Task removed!" -ForegroundColor Green
        Write-Host "  ID: $($task.ID)" -ForegroundColor Cyan
        Write-Host "  Task: $($task.Description)" -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "  Task ID '$id' not found." -ForegroundColor Red
        Write-Host ""
    }
}

# ── LIST ──────────────────────────────────────────
else {
    $tasks = @(Import-Csv $taskFile)

    Write-Host ""
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "              TASK LIST                 " -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow

    if ($tasks.Count -eq 0) {
        Write-Host ""
        Write-Host "  No tasks found." -ForegroundColor DarkGray
    } else {
        Write-Host ""
        foreach ($task in $tasks) {
            Write-Host "  [$($task.ID)]" -ForegroundColor Cyan -NoNewline
            Write-Host " $($task.Description)" -ForegroundColor White -NoNewline
            Write-Host "  ($($task.Date))" -ForegroundColor DarkGray
        }
    }

    Write-Host ""
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "  Total: $($tasks.Count) task(s)" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow

    # ── Random Motivational Quote ─────────────────
    $quote = $quotes | Get-Random
    Write-Host ""
    Write-Host "  >> $quote" -ForegroundColor Magenta
    Write-Host ""
}