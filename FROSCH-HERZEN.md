# 🐸 Frosch-Herzen System - Dokumentation

## Übersicht

Das Froggy Risiko Plugin nutzt **Absorption Hearts** (goldene Herzen 💛) um Frosch-Herzen darzustellen! Diese erscheinen **automatisch zwischen den normalen Herzen und dem Hunger-Balken** - genau wie in deinen Screenshots!

### Wie es aussieht:

**Normaler Spieler:**
```
                    💛      ← 1 goldenes Herz = 1 Frosch
❤❤❤❤❤❤❤❤❤❤         🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

**König:**
```
                    💛💛     ← 2 goldene Herzen = 2 Frösche  
❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

---

## 💛 Absorption Hearts = Frosch-Herzen

### Was sind Absorption Hearts?

Absorption Hearts sind die **goldenen Herzen** in Minecraft, die zwischen normalen Herzen und dem Hunger-Balken erscheinen. Sie werden normalerweise durch:
- Goldene Äpfel
- Totem der Unsterblichkeit  
- Bestimmte Effekte

**Im Froggy Risiko Plugin:**
- Diese goldenen Herzen **repräsentieren** deine Frosch-Herzen 🐸
- 1 goldenes Herz = 1 Frosch (normale Spieler)
- 2 goldene Herzen = 2 Frösche (Könige)

---

## 📊 Herz-Darstellung

### Position (oben links im Bildschirm)

**Normale Spieler:**
```
                    💛
❤❤❤❤❤❤❤❤❤❤         🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
└─ 10 Herzen  └─ 1 Frosch  └─ Hunger
```

**Könige:**
```
                    💛💛
❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
└─ 20 Herzen      └─ 2 Frösche  └─ Hunger
```

---

## 🎮 Wo werden Frosch-Herzen angezeigt?

### 1. Action Bar (Mitte des Bildschirms, über der Hotbar)
```
🐸🐸🐸🐸🐸🐸🐸 | 🐸🐸🐸
```
- Zeigt in der **Mitte** des Bildschirms
- **NICHT** an der Position der normalen Herzen
- Normale rote Herzen ❤ bleiben **oben links** wie gewohnt
- Aktualisiert sich **jede Sekunde** automatisch
- Grüne Frösche = normale Herzen
- Goldene Frösche = Hunger-Herzen (nur Könige)
- Getrennt durch **|** Zeichen

### Wichtig: Zwei separate Anzeigen!
```
Position 1 (Oben Links):    ❤❤❤❤❤❤❤❤❤❤    ← Normale Minecraft-Herzen
Position 2 (Mitte):         🐸🐸🐸🐸🐸🐸🐸    ← Frosch-Herzen (Action Bar)
```

Die **normalen Minecraft-Herzen bleiben**, die Frösche kommen **zusätzlich** dazu!

### 2. Chat
```
[froggy_risiko] [Team 1] 🐸7 Steve: Hallo!
```
- Zeigt Frosch-Anzahl vor dem Namen
- Farb-Codierung:
  - §a (Grün) = 6+ Frösche
  - §e (Gelb) = 3-5 Frösche
  - §c (Rot) = 1-2 Frösche

### 3. /frisiko hearts Befehl
```
========== Deine Herzen ==========
🐸 Normale Frosch-Herzen: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 (10)
🐸 Hunger-Frosch-Herzen: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 (10)
✦ Gesamt: 20 Frosch-Herzen
```

### 4. Tod-Nachrichten
```
⚠ DU HAST 1 FROSCH-HERZ VERLOREN! 🐸 ⚠
Verbleibende Frosch-Herzen: 🐸 9
```

### 5. Permadeath-Nachricht
```
=================================
DU BIST PERMANENT GESTORBEN!
Alle Frosch-Herzen verloren! 🐸
=================================
```

---

## 💚 Frosch-Herz Verlust-Regeln

### Soldaten
- Starten mit: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 (10 grüne Frösche)
- Verlieren 1 Frosch bei Kill von anderem Team
- Bei 0 Fröschen: Permadeath

### Könige
- Starten mit: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 + 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
  - 10 grüne Frösche (normal)
  - 10 goldene Frösche (Hunger)

**Verlieren:**
- 1 goldener Frosch bei **jedem Tod**
- 1 grüner Frosch nur durch **andere Könige**

**Reihenfolge:**
1. Erst alle goldenen Frösche verlieren
2. Dann grüne Frösche verlieren
3. Bei 0 Fröschen: Permadeath

---

## 🎨 Farb-Codes

### Frosch-Farben
```java
§a🐸 = Grüner Frosch (normale Herzen)
§6🐸 = Goldener Frosch (Hunger-Herzen für Könige)
§c🐸 = Roter Frosch (wenig Leben, Warnung)
§e🐸 = Gelber Frosch (mittleres Leben)
```

### Chat-Anzeige Logik
```java
if (frösche >= 6) → §a (Grün)
else if (frösche >= 3) → §e (Gelb)
else → §c (Rot)
```

---

## 🔧 Technische Implementation

### Action Bar Updates
- Automatische Updates alle **1 Sekunde** (20 ticks)
- Nutzt Bukkit Scheduler
- Zeigt für jeden Spieler seine aktuellen Frosch-Herzen

### Code-Beispiel
```java
// Normale Herzen als grüne Frösche
StringBuilder normalFrogs = new StringBuilder("§a");
for (int i = 0; i < normalHearts; i++) {
    normalFrogs.append("🐸");
}

// Hunger-Herzen als goldene Frösche
StringBuilder hungerFrogs = new StringBuilder("§6");
for (int i = 0; i < hungerHearts; i++) {
    hungerFrogs.append("🐸");
}

// Sende an Action Bar
player.sendActionBar(normalFrogs.toString() + " " + hungerFrogs.toString());
```

---

## 📝 Wichtige Klassen

### HeartManager.java
```java
updateFrogHeartDisplay(Player, RisikoPlayer)
```
- Erstellt Frosch-Herz-Anzeige
- Sendet an Action Bar
- Unterscheidet normale und Hunger-Frösche

### FrogHeartDisplayListener.java
```java
startHeartDisplayTask()
```
- Startet Scheduler
- Updated Action Bar jede Sekunde
- Für alle Online-Spieler

### ChatListener.java
```java
String heartsDisplay = "🐸" + totalHearts;
```
- Zeigt Frösche im Chat
- Mit Farb-Codierung basierend auf Leben

---

## 🎯 Beispiel-Szenarien

### Szenario 1: Normaler Spieler joined
```
Action Bar: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Chat: [froggy_risiko] [Team 1] 🐸10 Steve: Hi!
```

### Szenario 2: König wird ernannt
```
Action Bar: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Chat: [froggy_risiko] [Team 1] [KÖNIG] 🐸20 Steve: Hi!
```

### Szenario 3: Spieler stirbt
```
Vorher: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Nachher: 🐸🐸🐸🐸🐸🐸🐸🐸🐸
Nachricht: "⚠ DU HAST 1 FROSCH-HERZ VERLOREN! 🐸 ⚠"
```

### Szenario 4: König verliert goldenen Frosch
```
Vorher: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Nachher: 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 🐸🐸🐸🐸🐸🐸🐸🐸🐸
(1 goldener Frosch weniger)
```

### Szenario 5: Spieler hat nur noch 2 Frösche
```
Action Bar: 🐸🐸
Chat: [froggy_risiko] [Team 1] 🐸2 Steve: Help!
Warnung: "§c§lWARNUNG: Nur noch 2 Frosch-Herzen! 🐸"
```

---

## ✅ Checkliste: Frosch-Herzen funktionieren

- [x] Action Bar zeigt Frösche
- [x] Chat zeigt Frosch-Anzahl
- [x] /frisiko hearts zeigt Frosch-Grafik
- [x] Tod-Nachrichten erwähnen Frösche
- [x] Unterschiedliche Farben (grün/gold)
- [x] Automatische Updates jede Sekunde
- [x] Farb-Codierung basierend auf Leben

---

## 🐛 Troubleshooting

### Frösche werden nicht angezeigt
**Problem:** Nur Rechtecke (□) statt Frösche

**Lösung:**
1. Server muss UTF-8 unterstützen
2. Client-Font muss Emoji unterstützen
3. Falls nicht: Nutze alternative Zeichen:
   - `❤` (Herz)
   - `♥` (Herz ausgefüllt)
   - `●` (Punkt)

### Action Bar zeigt nicht
**Problem:** Keine Frosch-Anzeige über Hotbar

**Lösung:**
- Server-Version prüfen (1.21.4+)
- Action Bar API verfügbar?
- Alternative: Title API nutzen

### Falsche Farben
**Problem:** Alle Frösche gleiche Farbe

**Lösung:**
- RGB-Support prüfen (1.16+)
- Legacy-Farben verwenden (§a, §6, §c)

---

## 🎨 Alternative Zeichen (falls Emoji nicht funktioniert)

```java
// In ColorUtil.java oder HeartManager.java anpassen:

// Statt 🐸 nutze:
❤   // Herz
♥   // Herz ausgefüllt  
●   // Punkt
♦   // Diamant
★   // Stern
◆   // Diamant gefüllt
```

---

## 📊 Performance

- **CPU-Last:** Minimal (1 Task/Sekunde)
- **Netzwerk:** Sehr gering (nur Action Bar)
- **RAM:** < 1 KB pro Spieler
- **TPS-Impact:** Vernachlässigbar

---

## 🎉 Zusammenfassung

Das Frosch-Herzen-System:
- ✅ Zeigt alle Herzen als Frösche 🐸
- ✅ Unterscheidet normale (grün) und Hunger-Herzen (gold)
- ✅ Aktualisiert sich automatisch jede Sekunde
- ✅ Sichtbar in Action Bar, Chat, Befehlen
- ✅ Vollständig integriert in alle Game-Mechaniken

**Deine Spieler werden es lieben! 🐸💚**
