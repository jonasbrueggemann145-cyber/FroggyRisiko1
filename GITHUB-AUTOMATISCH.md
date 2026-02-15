# 🚀 Automatisch kompilieren mit GitHub

## Warum GitHub?

GitHub kann dein Plugin **automatisch kompilieren** - **OHNE** dass du Maven auf deinem PC brauchst!

---

## ✨ Schritt-für-Schritt Anleitung

### Schritt 1: GitHub Account erstellen (falls nicht vorhanden)
1. Gehe zu [github.com](https://github.com)
2. Klicke "Sign up"
3. Erstelle kostenlosen Account

### Schritt 2: Neues Repository erstellen
1. Klicke oben rechts auf "+" → "New repository"
2. Name: `FroggyRisiko`
3. Beschreibung: `Minecraft Plugin für Froggy Risiko`
4. Wähle: **Public**
5. Klicke "Create repository"

### Schritt 3: Dateien hochladen
1. Klicke "uploading an existing file"
2. Ziehe ALLE Dateien aus dem FroggyRisiko Ordner rein
3. Wichtig: Auch den `.github` Ordner!
4. Klicke "Commit changes"

### Schritt 4: Automatisches Kompilieren
1. GitHub erkennt die `.github/workflows/build.yml` Datei
2. Geht automatisch zu "Actions" Tab
3. Startet automatisch das Kompilieren!
4. Warte 2-3 Minuten

### Schritt 5: Plugin herunterladen
1. Gehe zum "Actions" Tab
2. Klicke auf den grünen Build
3. Scrolle runter zu "Artifacts"
4. Klicke "FroggyRisiko-Plugin"
5. **Fertig!** Lade die ZIP herunter
6. Darin ist die fertige JAR-Datei!

---

## 🎯 Alternative: Direkter Upload

Du kannst auch direkt über die GitHub-Webseite hochladen:

1. Gehe zu deinem Repository
2. Klicke "Add file" → "Upload files"
3. Ziehe den kompletten `FroggyRisiko` Ordner rein
4. "Commit changes"
5. Fertig - GitHub kompiliert automatisch!

---

## 📦 Was passiert automatisch?

Die `.github/workflows/build.yml` Datei sagt GitHub:
1. Installiere Java 21
2. Installiere Maven
3. Kompiliere das Plugin
4. Stelle die JAR zum Download bereit

**Alles kostenlos! Alles automatisch!**

---

## ✅ Vorteile dieser Methode

- ✅ Kein Maven auf deinem PC nötig
- ✅ Kein Java auf deinem PC nötig
- ✅ Komplett kostenlos
- ✅ Bei jedem Upload neue JAR
- ✅ Funktioniert immer
- ✅ Automatische Versionierung

---

## 🎬 Video-Anleitung

Wenn du Hilfe brauchst, gibt es auf YouTube viele Videos zu:
- "GitHub Repository erstellen"
- "Dateien auf GitHub hochladen"
- "GitHub Actions nutzen"

---

## 🆘 Probleme?

**Build schlägt fehl?**
→ Alle Dateien hochgeladen? Besonders `.github` Ordner!

**Keine Artifacts?**
→ Warte 2-3 Minuten, dann aktualisieren

**Download klappt nicht?**
→ Eingeloggt in GitHub?

---

## 🎯 Zusammenfassung

```
1. GitHub Account erstellen
2. Repository erstellen
3. Alle Dateien hochladen
4. 2-3 Minuten warten
5. Fertige JAR herunterladen
6. In Server kopieren
7. Spielen! 🐸
```

**Das ist die einfachste Methode ohne Maven-Installation!**

---

## 💡 Tipp

Du kannst das Plugin auch bei jedem Update neu kompilieren lassen:
1. Ändere Code auf GitHub
2. GitHub kompiliert automatisch neu
3. Neue JAR herunterladen
4. Fertig!

**GitHub ist dein persönlicher Build-Server! 🚀**
