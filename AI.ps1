# AI.ps1
# Opens AI tools in Chrome and desktop apps
# Usage:
#   AI              -> Opens all
#   AI 1 | gem | gemini          -> Opens Gemini
#   AI 2 | chat | chatgpt        -> Opens ChatGPT
#   AI 3 | claude | claud        -> Opens Claude
#   AI 4 | note | notebook       -> Opens NotebookLM
#   AI 5 | perp | perplexity     -> Opens Perplexity
#   AI 6 | grok                  -> Opens Grok
#   AI 7 | canva                 -> Opens Canva

param (
    [string]$Tool = ""
)

function Open-Gemini {
    Write-Host "Opening Gemini..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://gemini.google.com/app"
}
function Open-ChatGPT {
    Write-Host "Opening ChatGPT..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://chatgpt.com/"
}
function Open-Claude {
    Write-Host "Opening Claude..." -ForegroundColor Cyan
    Start-Process "explorer.exe" "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"
}
function Open-Notebook {
    Write-Host "Opening NotebookLM..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://notebooklm.google.com/"
}
function Open-Perplexity {
    Write-Host "Opening Perplexity..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://www.perplexity.ai/"
}
function Open-Grok {
    Write-Host "Opening Grok..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://grok.com/"
}
function Open-Canva {
    Write-Host "Opening Canva..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://www.canva.com/"
}

switch ($Tool.ToLower()) {
    { $_ -in "1", "gem", "gemini" }              { Open-Gemini }
    { $_ -in "2", "chat", "chatgpt" }            { Open-ChatGPT }
    { $_ -in "3", "claude", "claud" }            { Open-Claude }
    { $_ -in "4", "note", "notebook", "notebooklm" } { Open-Notebook }
    { $_ -in "5", "perp", "perplexity" }         { Open-Perplexity }
    { $_ -in "6", "grok" }                       { Open-Grok }
    { $_ -in "7", "canva" }                      { Open-Canva }
    default {
        Open-Grok
        Start-Sleep -Seconds 1
        Open-Perplexity
        Start-Sleep -Seconds 1
        Open-Notebook
        Start-Sleep -Seconds 1
        Open-Gemini
        Start-Sleep -Seconds 1
        Open-ChatGPT
        Start-Sleep -Seconds 1
        Open-Claude
        Start-Sleep -Seconds 1
        Open-Canva
    }
}

Write-Host "All done!" -ForegroundColor Green