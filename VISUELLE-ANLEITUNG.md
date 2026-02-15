# 🎮 Visuelle Anleitung - Bildschirm-Layout

## Wie sieht es im Spiel aus?

### Normaler Spieler (Soldat)
```
┌─────────────────────────────────────────────────────────┐
│                          🐸                             │
│  ❤❤❤❤❤❤❤❤❤❤           🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖                │
│   └─ Herzen              └─ Hunger                     │
│     (rot)                   (braun)                     │
│                                                         │
│                                                         │
│                                                         │
│                                                         │
│  ┌───┬───┬───┬───┬───┬───┬───┬───┬───┐                │
│  │ ⚔ │ ⛏ │ 🪓 │ 🎣 │ 🍞 │ 🍖 │ 💎 │ 🧱 │ 🪵 │                │
│  └───┴───┴───┴───┴───┴───┴───┴───┴───┘                │
└─────────────────────────────────────────────────────────┘
```

**Erklärung:**
- **1 Frosch** (🐸) zwischen Herzen und Hunger
- Wird als **Absorption Heart** dargestellt (goldenes Herz)
- Repräsentiert die Frosch-Herzen des Spielers

### König (mit doppelten Frosch-Herzen)
```
┌─────────────────────────────────────────────────────────┐
│                        🐸🐸                              │
│  ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖                │
│   └─ 20 Herzen           └─ Hunger                     │
│     (10 normal + 10 hunger)                             │
│                                                         │
│                                                         │
│                                                         │
│                                                         │
│  ┌───┬───┬───┬───┬───┬───┬───┬───┬───┐                │
│  │ ⚔ │ ⛏ │ 🪓 │ 🎣 │ 🍞 │ 🍖 │ 💎 │ 🧱 │ 🪵 │                │
│  └───┴───┴───┴───┴───┴───┴───┴───┴───┘                │
└─────────────────────────────────────────────────────────┘
```

**Erklärung:**
- **2 Frösche** (🐸🐸) zwischen Herzen und Hunger
- Werden als **2 Absorption Hearts** dargestellt (2 goldene Herzen)
- Repräsentieren normale + Hunger-Frosch-Herzen

---

## 🎯 Position der Frösche

### Exakte Position (oben links)
```
                    🐸     ← Frosch (zwischen Herzen und Hunger)
❤❤❤❤❤❤❤❤❤❤         🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
└─ Herzen             └─ Hunger-Balken
```

**Wichtig:** Die Frösche erscheinen als **goldene Herzen** im Vanilla-Minecraft-Style!

---

## 💛 Absorption Hearts = Frosch-Herzen

In Minecraft sehen Absorption Hearts so aus:
```
❤❤❤❤❤ 💛💛 🍖🍖🍖🍖🍖
       └─ Das sind die "Frösche"!
```

**Im Plugin:**
- Normale Spieler bekommen **1 Absorption Heart** (💛) = 1 Frosch
- Könige bekommen **2 Absorption Hearts** (💛💛) = 2 Frösche

---

## 📊 Verschiedene Szenarien

### Szenario 1: Normaler Spieler (volle Gesundheit)
```
                    💛     ← 1 goldenes Herz (= 1 Frosch)
❤❤❤❤❤❤❤❤❤❤         🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

### Szenario 2: König (volle Gesundheit)
```
                    💛💛    ← 2 goldene Herzen (= 2 Frösche)
❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

### Szenario 3: Normaler Spieler (beschädigt)
```
                    💛
❤❤❤❤❤              🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

### Szenario 4: König (nach einigen Toden)
```
                    💛💛
❤❤❤❤❤❤❤❤❤❤❤❤       🍖🍖🍖🍖🍖🍖🍖
```

---

## 🎨 Wie es in Minecraft aussieht

### In-Game Darstellung
Die goldenen Herzen (💛) erscheinen **automatisch** zwischen den roten Herzen und dem Hunger-Balken. Das ist die Standard-Position für Absorption Hearts in Minecraft!

### Farbschema
- ❤ = Rote Herzen (normale Gesundheit)
- 💛 = Goldene Herzen (Absorption = Frosch-Herzen)
- 🍖 = Braune Hunger-Balken

---

## ✅ Technische Details

### Absorption Hearts System
```java
player.setAbsorptionAmount(2.0);  // 1 Frosch (1 goldenes Herz)
player.setAbsorptionAmount(4.0);  // 2 Frösche (2 goldene Herzen)
```

### Vorteile dieser Methode:
- ✅ Frösche erscheinen **genau** zwischen Herzen und Hunger
- ✅ Nutzt Vanilla-Minecraft-System (keine Mods nötig)
- ✅ Funktioniert auf allen Clients
- ✅ Keine Custom Textures erforderlich
- ✅ Automatische Positionierung durch Minecraft

---

## 🔄 Was passiert bei Schaden/Tod?

### Normaler Spieler verliert Herz:
```
Vorher:              💛
         ❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖

[SCHADEN]

Nachher:             💛
         ❤❤❤❤❤❤     🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```

### König verliert Hunger-Frosch:
```
Vorher:              💛💛
         ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖

[TOD]

Nachher:             💛💛
         ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖
         (1 Hunger weniger)
```

---

## 📝 Zusammenfassung

**Normaler Spieler:**
```
         💛
❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```
- 10 rote Herzen
- 1 goldenes Herz (= Frosch-Herzen-Indikator)
- 10 Hunger-Punkte

**König:**
```
         💛💛
❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ 🍖🍖🍖🍖🍖🍖🍖🍖🍖🍖
```
- 20 rote Herzen (10 normal + 10 Hunger-Herzen)
- 2 goldene Herzen (= Frosch-Herzen-Indikator)
- 10 Hunger-Punkte

---

**Die goldenen Herzen (💛) sind die Frösche! Sie erscheinen automatisch zwischen den normalen Herzen und dem Hunger-Balken! 🐸💛**


---

## 🎯 Wichtige Punkte

### ✅ WAS BLEIBT:
- **Normale rote Herzen** (❤) oben links
- **Hunger-Balken** (🍖) oben links
- **Hotbar** unten wie gewohnt
- **Standard Minecraft UI**

### ➕ WAS NEU IST:
- **Frosch-Herzen** (🐸) in der Bildschirm-Mitte
- Im **Action Bar** Bereich
- **Zusätzliche Anzeige**, ersetzt nichts
- Aktualisiert sich automatisch

### 🎨 FARBEN:
```
§a🐸 = Grüner Frosch   (Normale Herzen)
§6🐸 = Goldener Frosch (Hunger-Herzen, nur Könige)
§7| = Grauer Trenner   (zwischen normal und Hunger)
```

---

## 📱 Verschiedene Szenarien

### Szenario 1: Volle Gesundheit (Soldat)
```
Oben:   ❤❤❤❤❤❤❤❤❤❤
Mitte:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
```

### Szenario 2: Halbe Gesundheit (Soldat)
```
Oben:   ❤❤❤❤❤
Mitte:  🐸🐸🐸🐸🐸
```

### Szenario 3: Kritisch (Soldat)
```
Oben:   ❤❤
Mitte:  🐸🐸
Chat:   WARNUNG: Nur noch 2 Frosch-Herzen! 🐸
```

### Szenario 4: König volle Gesundheit
```
Oben:   ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
Mitte:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 | 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
```

### Szenario 5: König nach 3 Toden (Hunger-Herzen verloren)
```
Oben:   ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
Mitte:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 | 🐸🐸🐸🐸🐸🐸🐸
        (Normal: 10)        (Hunger: 7, 3 verloren)
```

### Szenario 6: König - alle Hunger-Herzen verloren
```
Oben:   ❤❤❤❤❤❤❤❤❤❤
Mitte:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
        (Nur noch normale Herzen übrig!)
```

---

## 🔄 Dynamische Anzeige

Die Frosch-Herzen werden **jede Sekunde** aktualisiert:

```
Sekunde 1:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Sekunde 2:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
Sekunde 3:  🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
  [Tod]
Sekunde 4:  🐸🐸🐸🐸🐸🐸🐸🐸🐸
            (1 Frosch weniger!)
```

---

## 📏 Positionierung

### Horizontal (Links-Rechts)
```
├──────────────────────────────────────────┤
│                                          │
│              [ZENTRIERT]                 │
│          🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸                │
│                                          │
├──────────────────────────────────────────┤
```

### Vertikal (Oben-Unten)
```
Top:        ❤❤❤❤❤ (Normale Herzen)
            ↓
            [Leerraum]
            ↓
Middle:     🐸🐸🐸🐸🐸 (Frosch-Herzen, Action Bar)
            ↓
            [Leerraum]
            ↓
Bottom:     [════] (Hotbar)
```

---

## 🎬 Animationen & Updates

### Bei Schaden:
```
Vorher:  ❤❤❤❤❤❤❤❤❤❤
         🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸

[SCHADEN!]

Nachher: ❤❤❤❤❤❤❤
         🐸🐸🐸🐸🐸🐸🐸

Chat:    "⚠ DU HAST 3 FROSCH-HERZEN VERLOREN! 🐸 ⚠"
```

### Bei Heilung:
```
Vorher:  ❤❤❤
         🐸🐸🐸

[HEILUNG!]

Nachher: ❤❤❤❤❤❤❤❤❤❤
         🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸

Chat:    "§a+ Geheilt!"
```

---

## 🎨 Farb-Beispiele im Action Bar

### Volle Gesundheit (Grün)
```
§a🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
```
Sieht aus wie: 🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢 (hellgrün)

### Mittlere Gesundheit (Gelb/Orange)
```
§e🐸🐸🐸🐸🐸
```
Sieht aus wie: 🟡🟡🟡🟡🟡 (gelb)

### Niedrige Gesundheit (Rot)
```
§c🐸🐸
```
Sieht aus wie: 🔴🔴 (rot)

### König mit beiden Herz-Typen
```
§a🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸 §7| §6🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
```
Sieht aus wie: 🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢 | 🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡

---

## 📊 Vergleich: Vorher vs. Nachher

### VORHER (Nur Minecraft-Herzen):
```
┌─────────────────────────┐
│ ❤❤❤❤❤❤❤❤❤❤            │
│                         │
│                         │
│                         │
│ [═][⚔][⛏]              │
└─────────────────────────┘
```

### NACHHER (Mit Frosch-Herzen):
```
┌─────────────────────────┐
│ ❤❤❤❤❤❤❤❤❤❤            │
│                         │
│     🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸       │ ← NEU!
│                         │
│ [═][⚔][⛏]              │
└─────────────────────────┘
```

---

## ✅ Checkliste: Richtige Anzeige

- [ ] Normale Herzen sind **oben links** sichtbar
- [ ] Frosch-Herzen sind in der **Mitte** sichtbar
- [ ] Frösche sind **grün** für normale Herzen
- [ ] Frösche sind **gold** für Hunger-Herzen (Könige)
- [ ] Action Bar zeigt Frösche **kontinuierlich**
- [ ] Bei Schaden verschwinden **beide** gleichzeitig
- [ ] Hotbar ist **unten** wie normal

---

## 🎮 Im Spiel testen

1. **Join Server**: Normale Herzen + Frösche sollten erscheinen
2. **Nimm Schaden**: Beide Anzeigen sinken gleichzeitig
3. **Als König**: Zweite Reihe goldener Frösche erscheint
4. **Stirb**: Eine der beiden Frosch-Reihen verschwindet (zuerst gold)
5. **Regeneriere**: Beide Anzeigen steigen wieder

---

**Die Frösche sind ZUSÄTZLICH - die normalen Minecraft-Herzen bleiben! 🐸❤️**
