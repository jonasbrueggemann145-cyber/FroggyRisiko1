# 🐸 Froggy Risiko - Minecraft Plugin

Ein umfassendes Roleplay-PvP-Plugin für Minecraft 1.21.4+ mit automatischen 2-Wochen-Saisons, Teams, Königen und einem einzigartigen Herz-System.

## ✨ Features

### 🔄 Season-System
- **Automatische 2-Wochen-Zyklen**: Jede Season dauert genau 14 Tage
- **Automatischer Reset**: Am Ende werden alle Spieler gekickt und Teams zurückgesetzt
- **Warnungen**: Spieler werden rechtzeitig über Season-Ende informiert
- **Countdown**: Echtzeit-Anzeige der verbleibenden Zeit

### 👥 Team-System
- **5 Teams**: Jeweils 10 Spieler pro Team
- **Automatische Verteilung**: Neue Spieler werden automatisch verteilt
- **Team-Farben**: Individuelle Farben für jedes Team im Chat
- **Team-Hierarchie**: König, General (optional), Soldaten

### 💚 Herz-System

**Soldaten:**
- 10 Frosch-Herzen 🐸 (grün)
- Verlieren nur Herzen bei Kill von anderem Königreich
- Bei 0 Herzen: Permadeath

**Könige:**
- 10 normale Frosch-Herzen 🐸 (grün) + 10 Hunger-Frosch-Herzen 🐸 (gold)
- Verlieren Hunger-Frosch bei jedem Tod
- Verlieren normales Frosch-Herz nur durch andere Könige
- Bei 0 Herzen: Permadeath mit Broadcast

**Anzeige:**
- Action Bar: Kontinuierliche Frosch-Anzeige über Hotbar
- Chat: Frosch-Anzahl vor Namen
- Befehle: Detaillierte Frosch-Übersicht

### 💬 Chat-System
- **Farbverlauf-Tag**: `froggy_risiko` in grünem Farbverlauf
- **Team-Anzeige**: Jeder sieht Team und Farbe
- **Rollen-Tags**: [KÖNIG] für Könige
- **Frosch-Herz-Anzeige**: 🐸 mit Anzahl und Farb-Codierung

### 🐸 Frosch-Herz-System
- **Doppelte Anzeige**: Normale Minecraft-Herzen (oben links) + Frosch-Herzen (Mitte)
- **Action Bar**: Frosch-Anzeige in der Bildschirm-Mitte über der Hotbar
- **Grüne Frösche** (🐸): Normale Herzen
- **Goldene Frösche** (🐸): Hunger-Herzen für Könige
- **Auto-Update**: Jede Sekunde aktualisiert
- **Farb-Codierung**: Grün (gesund), Gelb (mittel), Rot (gefährlich)

**Layout:**
```
❤❤❤❤❤❤❤❤❤❤              ← Normale Herzen (oben links)

     🐸🐸🐸🐸🐸🐸🐸         ← Frosch-Herzen (Mitte)

[═][⚔][⛏][🪓]             ← Hotbar (unten)
```

## 📋 Anforderungen

- **Minecraft Server**: Spigot/Paper 1.21.4+
- **Java**: Version 21+
- **RAM**: Mindestens 2GB

## 🚀 Quick Start

1. **Plugin kompilieren:**
   ```bash
   mvn clean package
   ```

2. **JAR installieren:**
   ```bash
   cp target/FroggyRisiko-1.0.0.jar /server/plugins/
   ```

3. **Server starten und Season beginnen:**
   ```
   /frisiko start
   ```

📖 **[Vollständige Installationsanleitung →](INSTALLATION.md)**

## 🎮 Befehle

### Spieler
- `/frisiko info` - Deine Informationen
- `/frisiko hearts` - Zeigt Herz-Details
- `/frisiko status` - Season-Status

### Admin
- `/frisiko start` - Startet neue Season
- `/frisiko team <player> <teamId>` - Team zuweisen
- `/frisiko king <player>` - Zum König machen
- `/frisiko reset` - Alles zurücksetzen

## ⚙️ Konfiguration

```yaml
season:
  duration-days: 14    # Season-Dauer

teams:
  count: 5            # Anzahl Teams
  max-players: 10     # Max. Spieler/Team

hearts:
  king:
    normal: 20        # König normale Herzen
    hunger: 20        # König Hunger-Herzen
  soldier:
    normal: 20        # Soldat Herzen
```

## 🎯 Spielmechanik

### Herz-Verlust-Regeln

**Soldaten:**
- ✓ Verlieren Herz bei Kill von anderem Team
- ✗ Kein Verlust bei Tod durch eigenes Team
- ✗ Kein Verlust bei Umwelt-Tod

**Könige:**
- ✓ Verlieren Hunger-Herz bei jedem Tod
- ✓ Verlieren normales Herz nur durch andere Könige
- ⚠️ König-Tod wird serverweig broadcastet

### Permadeath
- Bei 0 Herzen ist Spieler permanent aus Season
- Kick mit Nachricht über Permadeath
- Muss auf nächste Season warten

## 📁 Projektstruktur

```
FroggyRisiko/
├── src/main/java/de/froggyrisiko/
│   ├── FroggyRisikoPlugin.java         # Haupt-Plugin
│   ├── commands/
│   │   └── FRisikoCommand.java         # Befehle
│   ├── listeners/
│   │   ├── ChatListener.java           # Chat-System
│   │   ├── PlayerJoinListener.java     # Join-Handler
│   │   ├── PlayerDeathListener.java    # Tod-Handler
│   │   └── PlayerDamageListener.java   # Damage-Handler
│   ├── manager/
│   │   ├── TeamManager.java            # Team-Verwaltung
│   │   ├── PlayerManager.java          # Spieler-Verwaltung
│   │   ├── SeasonManager.java          # Season-System
│   │   ├── HeartManager.java           # Herz-System
│   │   └── ConfigManager.java          # Config-Handling
│   ├── model/
│   │   ├── Team.java                   # Team-Datenmodell
│   │   └── RisikoPlayer.java           # Spieler-Datenmodell
│   └── util/
│       └── ColorUtil.java              # Farbverlauf-Utilities
├── src/main/resources/
│   ├── plugin.yml                      # Plugin-Metadaten
│   └── config.yml                      # Standard-Config
├── pom.xml                             # Maven-Build
├── INSTALLATION.md                     # Installationsanleitung
└── README.md                           # Diese Datei
```

## 🔧 Kompilierung

### Mit Maven
```bash
mvn clean package
```

### Mit IntelliJ IDEA
1. Als Maven-Projekt öffnen
2. Maven → Lifecycle → package

### Mit Eclipse
1. Als Maven-Projekt importieren
2. Run As → Maven build... → `clean package`

## 📊 Daten-Dateien

Nach dem ersten Start werden erstellt:
- `config.yml` - Hauptkonfiguration
- `teams.yml` - Team-Daten (gespeichert)
- `players.yml` - Spieler-Daten (gespeichert)
- `season.yml` - Season-Info (gespeichert)

## 🎨 Features im Detail

### Chat-Tag mit Farbverlauf
Der Tag `froggy_risiko` wird mit einem grünen Farbverlauf (#00FF00 → #008800) angezeigt, der durch RGB-Interpolation erstellt wird.

### Automatische Team-Verteilung
Beim Season-Start werden alle wartenden Spieler gleichmäßig auf verfügbare Teams verteilt. Dabei wird sichergestellt, dass kein Team leer bleibt.

### Herz-Visualisierung
- Grün (❤): 6+ Herzen
- Gelb (❤): 3-5 Herzen  
- Rot (❤): 1-2 Herzen

### Season-Warnungen
- 24 Stunden vorher
- 1 Stunde vorher
- 10 Minuten vorher
- Countdown letzte 60 Sekunden

## 🐛 Bekannte Probleme

Keine bekannten Probleme. Bei Bugs bitte Issue erstellen.

## 📝 To-Do / Erweiterungen

Mögliche zukünftige Features:
- [ ] General-Rolle mit speziellen Befehlen
- [ ] Team-Spawn-Points
- [ ] Statistiken (Kills, Deaths)
- [ ] Leaderboards
- [ ] Custom Events
- [ ] Discord Integration
- [ ] Web-Dashboard

## 📄 Lizenz

Dieses Plugin wurde für das Froggy Risiko Projekt erstellt.

## 🤝 Credits

Entwickelt für das Froggy Risiko RPvP-Projekt.

---

**Version:** 1.0.0  
**Minecraft:** 1.21.4+  
**Erstellt:** Februar 2026
