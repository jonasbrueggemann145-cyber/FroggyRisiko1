@echo off
color 0A
title Froggy Risiko Plugin Kompilieren

echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║   FROGGY RISIKO PLUGIN - AUTOMATISCHES KOMPILIEREN   ║
echo ╚═══════════════════════════════════════════════════════╝
echo.

REM Gehe zum Projektverzeichnis
cd /d "%~dp0"

echo [Schritt 1/5] Pruefe Java...
java -version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo.
    echo ❌ FEHLER: Java nicht gefunden!
    echo.
    echo Bitte installiere Java 21 von:
    echo https://adoptium.net/de/temurin/releases/
    echo.
    echo Wahle: JDK 21 (LTS) fuer Windows x64
    echo.
    pause
    exit /b 1
)
echo ✓ Java gefunden!
echo.

echo [Schritt 2/5] Pruefe Maven...
mvn --version >nul 2>&1
if errorlevel 1 (
    color 0E
    echo.
    echo ⚠ WARNUNG: Maven nicht gefunden!
    echo.
    echo SCHNELLE LOESUNG:
    echo 1. Gehe zu: https://maven.apache.org/download.cgi
    echo 2. Lade herunter: apache-maven-3.9.6-bin.zip
    echo 3. Entpacke nach: C:\Maven
    echo 4. Fuege zu PATH hinzu: C:\Maven\bin
    echo 5. CMD NEU OEFFNEN und nochmal starten!
    echo.
    echo ALTERNATIVE:
    echo Schreib dem Ersteller dass du Hilfe brauchst!
    echo.
    pause
    exit /b 1
)
echo ✓ Maven gefunden!
echo.

echo [Schritt 3/5] Loesche alte Dateien...
if exist target rmdir /s /q target
echo ✓ Bereit zum Kompilieren!
echo.

echo [Schritt 4/5] Kompiliere Plugin...
echo (Das kann 10-30 Sekunden dauern...)
echo.
mvn clean package

if errorlevel 1 (
    color 0C
    echo.
    echo ❌ FEHLER beim Kompilieren!
    echo.
    echo Moegliche Probleme:
    echo - Keine Internetverbindung
    echo - JAVA_HOME nicht gesetzt
    echo - Maven nicht richtig installiert
    echo.
    echo Versuche:
    echo 1. Internetverbindung pruefen
    echo 2. CMD als Administrator oeffnen
    echo 3. Diese Befehle ausfuehren:
    echo    setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-21"
    echo    (Pfad anpassen falls noetig!)
    echo.
    pause
    exit /b 1
)

echo.
echo [Schritt 5/5] Pruefe Ergebnis...
if exist target\FroggyRisiko-1.0.0.jar (
    color 0A
    echo.
    echo ╔═══════════════════════════════════════════════════════╗
    echo ║              ✓ ERFOLGREICH KOMPILIERT!               ║
    echo ╚═══════════════════════════════════════════════════════╝
    echo.
    echo Die fertige Plugin-Datei ist hier:
    echo.
    echo   📁 %~dp0target\FroggyRisiko-1.0.0.jar
    echo.
    echo Dateigröße:
    dir target\FroggyRisiko-1.0.0.jar | find "FroggyRisiko"
    echo.
    echo ┌───────────────────────────────────────────────────────┐
    echo │  NAECHSTE SCHRITTE:                                   │
    echo ├───────────────────────────────────────────────────────┤
    echo │  1. Kopiere die JAR in deinen Server plugins\ Ordner │
    echo │  2. Starte deinen Minecraft-Server                   │
    echo │  3. Ingame: /frisiko start                           │
    echo │  4. Ernennt Könige: /frisiko king <name>             │
    echo │  5. Viel Spaß! 🐸                                    │
    echo └───────────────────────────────────────────────────────┘
    echo.
    echo Willst du die Datei jetzt oeffnen?
    echo (J = Ja, N = Nein)
    choice /c JN /n /m "Deine Wahl: "
    if errorlevel 2 goto ende
    if errorlevel 1 explorer /select,target\FroggyRisiko-1.0.0.jar
    goto ende
) else (
    color 0C
    echo.
    echo ❌ JAR-Datei wurde nicht erstellt!
    echo.
    echo Bitte pruefe die Fehlermeldungen oben.
    echo.
)

:ende
echo.
echo Druecke eine Taste zum Beenden...
pause >nul
