@echo off
chcp 65001 >nul
title 인체 해부학 3D 뷰어
cd /d "%~dp0"

echo.
echo  ========================================
echo    인체 해부학 3D 뷰어 실행 중...
echo  ========================================
echo.

where python >nul 2>&1
if %errorlevel%==0 (
    echo  Python으로 로컬 서버를 시작합니다.
    echo  브라우저가 자동으로 열립니다.
    echo.
    echo  종료하려면 이 창을 닫으세요.
    echo.
    start "" http://localhost:8080
    python -m http.server 8080
    goto :eof
)

where py >nul 2>&1
if %errorlevel%==0 (
    echo  Python으로 로컬 서버를 시작합니다.
    echo  브라우저가 자동으로 열립니다.
    echo.
    echo  종료하려면 이 창을 닫으세요.
    echo.
    start "" http://localhost:8080
    py -m http.server 8080
    goto :eof
)

echo  [안내] Python이 설치되어 있지 않습니다.
echo.
echo  다음 중 하나를 해주세요:
echo.
echo  1) Microsoft Store에서 "Python" 검색 후 설치
echo  2) https://www.python.org 에서 다운로드 설치
echo     (설치 시 "Add Python to PATH" 체크)
echo.
echo  설치 후 이 파일을 다시 더블클릭하세요.
echo.
echo  임시로 index.html을 직접 열 수도 있지만
echo  브라우저 보안 때문에 모델이 안 보일 수 있습니다.
echo.
pause
start "" "%~dp0index.html"
