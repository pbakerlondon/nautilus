# Nautilus — Maritime Bell Watch Script

**Author:** Thomas L.C. van Houten  
**Date:** 2025-06-07

## 🧭 Description

`nautilus.sh` simulates traditional ship bell timekeeping using WAV audio files.  
It plays the correct number of bells every half-hour, following the historic 4-hour maritime watch system.

Perfect for:
- Marine enthusiasts
- Historical simulations
- Time signaling without clocks

## 📦 Requirements

- Bash
- `aplay` (from `alsa-utils`)
- Terminal with `read` and `tput` support

## 📁 Setup

1. Clone this repository or download `nautilus.sh`.
2. Place the following WAV files in the same folder:
    ```
    1.wav
    2.wav
    2-1.wav
    2-2.wav
    2-2-1.wav
    2-2-2.wav
    2-2-2-1.wav
    2-2-2-2.wav
    ```

## ▶️ Usage

```bash
chmod +x nautilus.sh
# nautilus
