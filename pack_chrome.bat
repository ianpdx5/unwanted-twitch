@echo off

set zip="C:\Program Files\7-Zip\7z.exe"
set dir=%~dp0
set target="%dir%publish\chrome\current.zip"

:: swap manifest.json
del "%dir%\manifest.json"
type "%dir%\manifest.chrome.json" > "%dir%\manifest.json"

:: swap scripts\background.js
del "%dir%\scripts\background.js"
type "%dir%\scripts\background.chrome.js" > "%dir%\scripts\background.js"

:: compress
del %target%
%zip% a -mx=9 -r %target% "%dir%*"^
 -x!".git*"^
 -x!"manifest.*.json"^
 -x!"publish\"^
 -x!"raw\"^
 -x!"scripts\background.*.js"^
 -x!"tests\"^
 -x!"webstore\"^
 -x!"*.md"^
 -x!"*.bat"

:: clean up
del "%dir%\manifest.json"
del "%dir%\scripts\background.js"
