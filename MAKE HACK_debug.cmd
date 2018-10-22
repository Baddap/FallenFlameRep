cd %~dp0

copy FE8_clean.gba FE-Fallen-Flame.gba

cd "%~dp0Tables"

echo: | (c2ea "%~dp0FE8_clean.gba")

cd "%~dp0Text"

echo: | (textprocess_v2 text_buildfile.txt)

cd "%~dp0Maps"

echo: | (tmx2ea -s)

cd "%~dp0Battle Palettes"

echo: | (pal2ea "%~dp0Battle Palettes/Battle Palettes.txt")

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0FE-Fallen-Flame.gba" "-input:%~dp0Debug.event"

if exist "%~dp0ups/ups.exe" (
    cd "%~dp0ups"
    ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0FE-Fallen-Flame.gba" -o "%~dp0FE-Fallen-Flame.ups"
)

pause