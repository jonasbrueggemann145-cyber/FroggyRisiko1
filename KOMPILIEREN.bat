@echo off
echo ========================================
echo    Froggy Risiko Plugin Kompilieren
echo ========================================
echo.

REM Pruefe ob Java installiert ist
java -version >nul 2>&1
if errorlevel 1 (
    echo FEHLER: Java ist nicht installiert!
    echo Bitte installiere Java 21 von: https://adoptium.net/
    pause
    exit /b 1
)

echo [1/4] Java gefunden!
echo.

REM Pruefe ob Maven installiert ist
mvn --version >nul 2>&1
if errorlevel 1 (
    echo FEHLER: Maven ist nicht installiert!
    echo.
    echo LOESUNG 1: Installiere Maven
    echo   - Gehe zu: https://maven.apache.org/download.cgi
    echo   - Lade apache-maven-3.9.x-bin.zip herunter
    echo   - Entpacke nach C:\Program Files\Maven
    echo   - Fuege C:\Program Files\Maven\bin zu PATH hinzu
    echo.
    echo LOESUNG 2: Nutze die fertige JAR
    echo   - Schreib mir dass Maven nicht geht
    echo   - Ich schicke dir eine fertige JAR-Datei
    echo.
    pause
    exit /b 1
)

echo [2/4] Maven gefunden!
echo.

echo [3/4] Kompiliere Plugin...
echo.
mvn clean package

if errorlevel 1 (
    echo.
    echo FEHLER beim Kompilieren!
    echo.
    echo Moegliche Loesungen:
    echo 1. Internetverbindung pruefen
    echo 2. JAVA_HOME setzen:
    echo    setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-21"
    echo 3. CMD neu oeffnen und nochmal versuchen
    echo.
    pause
    exit /b 1
)

echo.
echo [4/4] Fertig!
echo.
echo ========================================
echo    PLUGIN ERFOLGREICH ERSTELLT!
echo ========================================
echo.
echo Die fertige Datei ist hier:
echo   target\FroggyRisiko-1.0.0.jar
echo.
echo Naechste Schritte:
echo 1. Kopiere die JAR in deinen Server plugins\ Ordner
echo 2. Starte den Server
echo 3. Nutze /frisiko start
echo.
echo Viel Erfolg mit Froggy Risiko! 🐸
echo.
pause
