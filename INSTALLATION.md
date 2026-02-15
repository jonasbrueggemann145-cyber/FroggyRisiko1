# 🐸 Froggy Risiko Plugin - Installationsanleitung

## 📋 Inhaltsverzeichnis
1. [Voraussetzungen](#voraussetzungen)
2. [Plugin kompilieren](#plugin-kompilieren)
3. [Installation auf dem Server](#installation-auf-dem-server)
4. [Erste Schritte](#erste-schritte)
5. [Befehle](#befehle)
6. [Konfiguration](#konfiguration)
7. [Features](#features)
8. [Troubleshooting](#troubleshooting)

---

## 🔧 Voraussetzungen

### Server-Anforderungen
- **Minecraft Server**: Spigot/Paper 1.21.4 oder neuer
- **Java**: Java 21 oder höher
- **RAM**: Mindestens 2GB empfohlen

### Entwicklungs-Anforderungen (zum Kompilieren)
- **Java Development Kit (JDK)**: Version 21+
- **Apache Maven**: Version 3.6+
- **Git** (optional): Zum Klonen des Projekts

---

## 🔨 Plugin kompilieren

### Schritt 1: Java installieren
1. Lade Java 21 von [Adoptium.net](https://adoptium.net/) herunter
2. Installiere Java und stelle sicher, dass es in PATH ist
3. Prüfe Installation mit: `java -version`

### Schritt 2: Maven installieren
1. Lade Maven von [maven.apache.org](https://maven.apache.org/download.cgi) herunter
2. Entpacke Maven in einen Ordner (z.B. `C:\Program Files\Maven`)
3. Füge Maven zu PATH hinzu:
   - **Windows**: 
     - Systemsteuerung → System → Erweiterte Systemeinstellungen
     - Umgebungsvariablen → PATH → Neu
     - Füge hinzu: `C:\Program Files\Maven\bin`
   - **Linux/Mac**: 
     ```bash
     export PATH=/pfad/zu/maven/bin:$PATH
     ```
4. Prüfe Installation mit: `mvn -version`

### Schritt 3: Projekt kompilieren

**Option A: Mit Maven (empfohlen)**
```bash
# Navigiere zum Projektordner
cd FroggyRisiko

# Kompiliere das Plugin
mvn clean package

# Die fertige JAR-Datei findest du hier:
# target/FroggyRisiko-1.0.0.jar
```

**Option B: Mit IntelliJ IDEA**
1. Öffne IntelliJ IDEA
2. Importiere das Projekt als Maven-Projekt
3. Warte bis Maven alle Dependencies heruntergeladen hat
4. Rechtsklick auf `pom.xml` → Maven → Reload Project
5. Im Maven-Tab rechts: Lifecycle → package (doppelklicken)
6. Fertige JAR in `target/FroggyRisiko-1.0.0.jar`

**Option C: Mit Eclipse**
1. Öffne Eclipse
2. File → Import → Maven → Existing Maven Projects
3. Wähle den FroggyRisiko-Ordner
4. Rechtsklick auf Projekt → Run As → Maven build...
5. Goals: `clean package`
6. Fertige JAR in `target/FroggyRisiko-1.0.0.jar`

---

## 📦 Installation auf dem Server

### Schritt 1: Server vorbereiten
1. Stoppe deinen Minecraft Server
2. Stelle sicher, dass der Server Spigot/Paper 1.21.4+ verwendet
3. Navigiere zum Server-Ordner

### Schritt 2: Plugin installieren
```bash
# Kopiere die JAR-Datei in den plugins-Ordner
cp target/FroggyRisiko-1.0.0.jar /pfad/zu/deinem/server/plugins/

# Oder unter Windows:
copy target\FroggyRisiko-1.0.0.jar C:\Server\plugins\
```

### Schritt 3: Server starten
```bash
# Starte den Server
java -Xmx2G -Xms2G -jar server.jar nogui

# Der Server erstellt automatisch:
# - plugins/FroggyRisiko/config.yml
# - plugins/FroggyRisiko/teams.yml
# - plugins/FroggyRisiko/players.yml
# - plugins/FroggyRisiko/season.yml
```

### Schritt 4: Erste Überprüfung
```
# Im Server-Chat als OP eingeben:
/plugins

# Du solltest sehen:
[✓] FroggyRisiko (grün = geladen)
```

---

## 🚀 Erste Schritte

### 1. Standard-Teams werden automatisch erstellt
Beim ersten Start werden automatisch 5 Teams erstellt:
- Team 1 (Grün)
- Team 2 (Blau)
- Team 3 (Rot)
- Team 4 (Gelb)
- Team 5 (Lila)

### 2. Season starten
```
/frisiko start
```
Dies:
- Startet eine neue Season
- Setzt alle Teams zurück
- Verteilt wartende Spieler automatisch auf Teams
- Startet den 2-Wochen-Timer

### 3. Spieler beitreten lassen
Wenn Spieler joinen:
- Sie werden automatisch einem verfügbaren Team zugewiesen
- Erhalten ihre Standard-Herzen (10 Herzen)
- Sehen eine Willkommensnachricht mit Team-Info

### 4. Könige ernennen
```
/frisiko king <spielername>
```
Dies:
- Macht den Spieler zum König
- Gibt ihm Hunger-Herzen (zusätzlich 10 Herzen)
- Aktualisiert sein Chat-Tag zu [KÖNIG]

---

## 📝 Befehle

### Spieler-Befehle
```
/frisiko help          - Zeigt alle Befehle
/frisiko info          - Zeigt deine Spieler-Informationen
/frisiko hearts        - Zeigt deine Herzen im Detail
/frisiko status        - Zeigt Season-Status und Team-Übersicht
```

### Admin-Befehle (benötigt OP oder Permission)
```
/frisiko start                        - Startet eine neue Season
/frisiko reset                        - Setzt alle Daten zurück
/frisiko team <spieler> <teamId>     - Weist Spieler einem Team zu
/frisiko king <spieler>               - Macht Spieler zum König
```

### Team-IDs
- `team1` - Team 1
- `team2` - Team 2
- `team3` - Team 3
- `team4` - Team 4
- `team5` - Team 5

### Beispiele
```
# Spieler "Steve" zu Team 1 hinzufügen
/frisiko team Steve team1

# "Alex" zum König machen
/frisiko king Alex

# Neue Season starten
/frisiko start
```

---

## ⚙️ Konfiguration

Die Konfiguration findest du in: `plugins/FroggyRisiko/config.yml`

### Wichtige Einstellungen

```yaml
# Season-Dauer ändern (in Tagen)
season:
  duration-days: 14  # Standard: 2 Wochen

# Team-Größe anpassen
teams:
  count: 5          # Anzahl der Teams
  max-players: 10   # Max. Spieler pro Team
  max-kings: 2      # Max. Könige pro Team

# Herz-System anpassen
hearts:
  king:
    normal: 20      # 20 = 10 Herzen
    hunger: 20      # 20 = 10 Hunger-Herzen
  soldier:
    normal: 20      # 20 = 10 Herzen
```

### Nach Änderungen
```
# Server neu laden oder
/reload confirm
```

---

## ✨ Features

### 🔄 Automatisches Season-System
- **2-Wochen-Zyklen**: Automatischer Reset nach 14 Tagen
- **Warnungen**: Bei 24h, 1h, 10min, letzter Minute
- **Auto-Kick**: Alle Spieler werden am Ende gekickt
- **Neustart**: Automatischer Start der neuen Season

### 👥 Team-System
- **5 Teams**: Jeweils 10 Spieler
- **Automatische Verteilung**: Spieler werden beim Join verteilt
- **Team-Farben**: Eigene Farben im Chat und Namen
- **Team-Spawn**: Jedes Team kann einen Spawn setzen (optional erweiterbar)

### 💚 Herz-System

**Normale Spieler (Soldaten)**:
- 10 Herzen zu Beginn
- Verlieren 1 Herz nur bei Kill von anderem Königreich
- Bei 0 Herzen: Permadeath (aus der Season)

**Könige**:
- 10 normale Herzen + 10 Hunger-Herzen (insgesamt 20 Herzen)
- Verlieren 1 Hunger-Herz bei jedem Tod
- Verlieren 1 normales Herz nur durch andere Könige
- Bei 0 Herzen: Permadeath mit Broadcast-Nachricht

### 💬 Chat-System
- **Farbverlauf-Tag**: `froggy_risiko` in grünem Farbverlauf
- **Team-Farben**: Jeder Spieler zeigt seine Team-Farbe
- **Rollen-Tags**: [KÖNIG] für Könige
- **Herz-Anzeige**: Aktuelle Herzen im Chat sichtbar

### 🎮 Gameplay-Features
- **Permadeath**: Permanenter Tod bei 0 Herzen
- **Cross-Team-Kills**: Zählen für Herz-Verlust
- **König-Schutz**: Normales Herz nur durch andere Könige verlierbar
- **Status-Tracking**: Echtzeit-Verfolgung aller Spieler

---

## 🔍 Troubleshooting

### Problem: Plugin lädt nicht

**Lösung 1: Java-Version prüfen**
```bash
java -version
# Muss Java 21+ sein
```

**Lösung 2: Server-Version prüfen**
```
# Im Server-Log:
# "This server is running Paper version ..."
# Muss 1.21.4+ sein
```

**Lösung 3: Dependencies prüfen**
```bash
# JAR-Datei öffnen und prüfen ob alle Klassen enthalten sind
jar -tf FroggyRisiko-1.0.0.jar
```

### Problem: Befehle funktionieren nicht

**Lösung: Permissions prüfen**
```yaml
# In permissions.yml oder mit LuckPerms:
froggyrisiko.admin: true

# Oder einfach OP geben:
/op <deinname>
```

### Problem: Spieler verlieren keine Herzen

**Lösung 1: Config prüfen**
```yaml
hearts:
  soldier:
    normal: 20  # Muss größer als 0 sein
```

**Lösung 2: Spieler-Daten zurücksetzen**
```
/frisiko reset
```

### Problem: Chat-Tags zeigen nicht korrekt

**Lösung: RGB-Support prüfen**
- Spigot 1.16+ wird benötigt für RGB-Farben
- Falls älter: Aktualisiere auf 1.21.4+

### Problem: Season endet nicht automatisch

**Lösung: Server-Zeit prüfen**
```bash
# Linux/Mac:
date

# Windows:
date /t

# Zeit sollte korrekt sein
```

---

## 📊 Dateistruktur

```
plugins/
└── FroggyRisiko/
    ├── config.yml       # Hauptkonfiguration
    ├── teams.yml        # Team-Daten
    ├── players.yml      # Spieler-Daten
    └── season.yml       # Season-Informationen
```

### Backup erstellen
```bash
# Vor jeder Season empfohlen:
cp -r plugins/FroggyRisiko plugins/FroggyRisiko_backup_$(date +%Y%m%d)
```

---

## 🎯 Permissions

```yaml
froggyrisiko.admin       # Alle Admin-Befehle
froggyrisiko.king        # König-Befehle (derzeit ungenutzt)
froggyrisiko.general     # General-Befehle (derzeit ungenutzt)
```

---

## 🔄 Updates

### Plugin aktualisieren
1. Stoppe den Server
2. Ersetze die alte JAR im plugins-Ordner
3. Starte den Server
4. Config-Dateien werden automatisch ergänzt (alte Werte bleiben)

---

## 📞 Support

Bei Problemen:
1. Prüfe die `latest.log` im Server-Ordner
2. Suche nach `[FroggyRisiko]` Einträgen
3. Aktiviere Debug-Modus (optional erweiterbar)

---

## 🎮 Spielstart-Checkliste

- [ ] Server ist Spigot/Paper 1.21.4+
- [ ] Java 21+ ist installiert
- [ ] Plugin wurde kompiliert
- [ ] JAR ist im plugins-Ordner
- [ ] Server wurde gestartet
- [ ] Plugin erscheint grün in `/plugins`
- [ ] Config wurde angepasst (optional)
- [ ] `/frisiko start` wurde ausgeführt
- [ ] Könige wurden ernannt
- [ ] Teams sind vollständig

**Viel Erfolg mit Froggy Risiko! 🐸**
