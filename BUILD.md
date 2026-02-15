# 🔨 Build-Anleitung - Froggy Risiko Plugin

Diese Anleitung zeigt dir **Schritt für Schritt**, wie du das Plugin von den Quelldateien zur fertigen JAR-Datei kompilierst.

---

## 📋 Was du brauchst

### 1. Java Development Kit (JDK) 21+

**Windows:**
1. Gehe zu [Adoptium.net](https://adoptium.net/)
2. Wähle: **Version 21 (LTS)** und **Windows x64**
3. Lade die `.msi` Datei herunter
4. Führe die Installation aus
5. Wichtig: Hake **"Add to PATH"** an!

**Überprüfen:**
```bash
java -version
```
Sollte zeigen: `openjdk version "21.x.x"`

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install openjdk-21-jdk
```

**macOS:**
```bash
brew install openjdk@21
```

---

### 2. Apache Maven

**Windows:**
1. Gehe zu [maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)
2. Lade `apache-maven-3.9.x-bin.zip` herunter
3. Entpacke nach: `C:\Program Files\Maven`
4. Füge zu PATH hinzu:
   - Drücke `Windows + R`
   - Tippe: `sysdm.cpl` → Enter
   - Tab "Erweitert" → "Umgebungsvariablen"
   - Bei "Systemvariablen" → "Path" → "Bearbeiten"
   - "Neu" → Füge hinzu: `C:\Program Files\Maven\bin`
   - Alle Fenster mit "OK" schließen

**Überprüfen:**
```bash
mvn -version
```
Sollte Maven-Version anzeigen

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install maven
```

**macOS:**
```bash
brew install maven
```

---

## 🚀 Plugin kompilieren

### Methode 1: Mit Kommandozeile (Empfohlen)

#### Windows

1. **Öffne PowerShell oder CMD**
   - `Windows + R` → Tippe `cmd` → Enter

2. **Navigiere zum Projektordner**
   ```bash
   cd C:\Pfad\zu\FroggyRisiko
   ```
   
   Beispiel:
   ```bash
   cd C:\Users\DeinName\Downloads\FroggyRisiko
   ```

3. **Kompiliere das Plugin**
   ```bash
   mvn clean package
   ```

4. **Warte auf "BUILD SUCCESS"**
   ```
   [INFO] BUILD SUCCESS
   [INFO] Total time: 10.234 s
   ```

5. **Finde die fertige JAR**
   - Öffne den `target` Ordner
   - Die Datei heißt: `FroggyRisiko-1.0.0.jar`
   - Das ist deine fertige Plugin-Datei!

#### Linux/Mac

1. **Öffne Terminal**

2. **Navigiere zum Projektordner**
   ```bash
   cd ~/Downloads/FroggyRisiko
   ```

3. **Kompiliere**
   ```bash
   mvn clean package
   ```

4. **Fertige JAR**
   ```bash
   ls target/FroggyRisiko-1.0.0.jar
   ```

---

### Methode 2: Mit IntelliJ IDEA

1. **IntelliJ IDEA öffnen**
   - Lade [IntelliJ IDEA Community](https://www.jetbrains.com/idea/download/) herunter (kostenlos)

2. **Projekt öffnen**
   - "Open" → Wähle den `FroggyRisiko` Ordner
   - Als "Maven Project" importieren
   - Warte bis IntelliJ fertig ist (unten rechts "Indexing...")

3. **Maven-Tab öffnen**
   - Rechts in der Sidebar: "Maven" (M-Icon)
   - Falls nicht sichtbar: `View` → `Tool Windows` → `Maven`

4. **Projekt kompilieren**
   - Maven-Tab → `FroggyRisiko` → `Lifecycle`
   - Doppelklick auf `clean`
   - Dann Doppelklick auf `package`

5. **Build-Log prüfen**
   - Unten erscheint "Run"
   - Sollte enden mit: `BUILD SUCCESS`

6. **JAR finden**
   - Im Projekt-Explorer links
   - `target` → `FroggyRisiko-1.0.0.jar`
   - Rechtsklick → "Show in Explorer" / "Reveal in Finder"

---

### Methode 3: Mit Eclipse

1. **Eclipse öffnen**
   - Lade [Eclipse IDE für Java](https://www.eclipse.org/downloads/) herunter

2. **Projekt importieren**
   - `File` → `Import...`
   - `Maven` → `Existing Maven Projects`
   - `Next` → `Browse` → Wähle `FroggyRisiko` Ordner
   - `Finish`

3. **Maven-Build ausführen**
   - Rechtsklick auf Projekt-Name
   - `Run As` → `Maven build...`
   - Im "Goals" Feld eingeben: `clean package`
   - `Run` klicken

4. **Build-Status prüfen**
   - Console unten sollte zeigen: `BUILD SUCCESS`

5. **JAR finden**
   - Im "Package Explorer" links
   - `target` → `FroggyRisiko-1.0.0.jar`
   - Rechtsklick → `Show In` → `System Explorer`

---

## ✅ Build erfolgreich - Was nun?

### Die fertige JAR-Datei

Nach erfolgreichem Build hast du:
```
FroggyRisiko/target/FroggyRisiko-1.0.0.jar
```

Diese Datei ist **das fertige Plugin**!

### Nächste Schritte

1. **Kopiere die JAR auf deinen Server**
   ```bash
   # Windows
   copy target\FroggyRisiko-1.0.0.jar C:\Server\plugins\
   
   # Linux/Mac
   cp target/FroggyRisiko-1.0.0.jar ~/server/plugins/
   ```

2. **Starte den Server**
   ```bash
   java -Xmx2G -Xms2G -jar server.jar nogui
   ```

3. **Prüfe ob Plugin geladen wurde**
   ```
   /plugins
   ```
   Sollte zeigen: `[✓] FroggyRisiko` (grün)

4. **Starte erste Season**
   ```
   /frisiko start
   ```

---

## ❌ Fehlerbehebung

### Problem: "mvn not found" oder "mvn ist kein Befehl"

**Lösung:**
- Maven nicht in PATH
- Schließe Terminal/CMD komplett
- Öffne neu (wichtig nach PATH-Änderung!)
- Teste erneut: `mvn -version`

---

### Problem: "JAVA_HOME is not set"

**Lösung Windows:**
```bash
# Finde Java-Installation
where java

# Beispiel-Ausgabe:
# C:\Program Files\Eclipse Adoptium\jdk-21.0.1.12-hotspot\bin\java.exe

# Setze JAVA_HOME (ohne \bin\java.exe):
setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-21.0.1.12-hotspot"

# Terminal neu öffnen!
```

**Lösung Linux/Mac:**
```bash
# In ~/.bashrc oder ~/.zshrc hinzufügen:
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Neu laden:
source ~/.bashrc
```

---

### Problem: "Failed to execute goal"

**Ursache:** Maven kann Dependencies nicht herunterladen

**Lösung:**
1. Prüfe Internetverbindung
2. Lösche Maven-Cache:
   ```bash
   # Windows
   rmdir /s %USERPROFILE%\.m2\repository
   
   # Linux/Mac
   rm -rf ~/.m2/repository
   ```
3. Versuche erneut: `mvn clean package`

---

### Problem: Build zeigt "Compilation failure"

**Ursache:** Java-Version stimmt nicht

**Lösung:**
```bash
# Prüfe Version
java -version

# Muss Java 21+ sein!
# Falls nicht, installiere Java 21 neu
```

---

### Problem: "BUILD FAILURE" mit Encoding-Fehler

**Lösung:**
```bash
mvn clean package -Dfile.encoding=UTF-8
```

---

## 📦 Optional: JAR ohne Tests kompilieren (schneller)

```bash
mvn clean package -DskipTests
```

---

## 🎯 Erweiterte Build-Optionen

### Debug-Informationen einschließen
```bash
mvn clean package -X
```

### Nur kompilieren (keine JAR erstellen)
```bash
mvn compile
```

### Abhängigkeiten herunterladen (ohne Build)
```bash
mvn dependency:resolve
```

### Projekt komplett säubern
```bash
mvn clean
```

---

## 📝 Zusammenfassung

**Kurz-Anleitung:**
1. Java 21+ installieren
2. Maven installieren
3. Terminal öffnen
4. `cd FroggyRisiko`
5. `mvn clean package`
6. Fertig! JAR ist in `target/`

**Durchschnittliche Build-Zeit:** 10-30 Sekunden

---

## 🆘 Immer noch Probleme?

1. **Prüfe Log-Ausgabe** genau
2. **Suche Fehlermeldung** online
3. **Stelle sicher:**
   - Java 21+ ist installiert
   - Maven 3.6+ ist installiert
   - Beide sind in PATH
   - Internet funktioniert

---

**Du hast es geschafft! 🎉**

Jetzt kannst du das Plugin auf deinem Server installieren.
→ Siehe [INSTALLATION.md](INSTALLATION.md) für Server-Setup
