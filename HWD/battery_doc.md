**Some concrete numbers for the STM32H747 (dual-core M7+M4):**

| Mode | Typical current | Battery life on 1000mAh |
|---|---|---|
| Standby/VBAT (RTC only, backup domain) | ~1-5 µA | Years (limited by battery self-discharge, not the MCU) |
| Stop mode (peripherals off, fast wake) | ~10-400 µA | Weeks to months |
| Low-power run (low clock, LP mode) | ~1-5 mA | Weeks |
| Sleep mode (core stopped, peripherals on) | ~10-50 mA | ~20-100 hours |
| Run, single core, moderate clock (~100 MHz) | ~40-80 mA | ~12-25 hours |
| Run, both cores, max clock (480 MHz), most peripherals active | ~200-300 mA+ | ~3-5 hours |

**Caveats that matter for a finished design:**
- These are MCU-only figures. Add whatever else is on the board — sensors, radios (Wi-Fi/BLE), displays, SD cards, external RAM/flash — and total draw can dwarf the MCU itself.
- 1000mAh batteries (typically LiPo, ~3.7V) need a regulator down to the MCU's supply rail; regulator efficiency (usually 85-95% for a good buck/LDO combo) eats into your effective capacity.
- Real firmware rarely sits in one mode the whole time — duty-cycling between active bursts and stop/sleep mode is how you get from "hours" to "weeks" on the same hardware.
- Don't run a battery to 0% in practice; usable capacity is often ~80-90% of rated mAh.

If you tell me the actual clock speed, which peripherals you're using (radio? display? sensors?), and roughly what duty cycle you expect (always-on vs. wake-and-sleep), I can give you a much tighter estimate.


**Display power (from the datasheet, full white field test — worst case):**

| Rail | Voltage | Current (max) | Power @ 10,000 cd/m² |
|---|---|---|---|
| VDD | 1.8V | ≤100 mA | 47 mW |
| VAN | 5V | ≤200 mA | 70 mW |
| VEE | -5V | ≤200 mA | 57 mW |
| **Total** | — | — | **174 mW** (129 mW at 6000 cd/m²) |

**Recalculated system budget:**

| Component | Power |
|---|---|
| MCU (200-300 mA @ 3.3V) | 660-990 mW |
| Display (worst case, full white, max brightness) | 174 mW |
| Display (typical mixed content) | ~80-130 mW (estimated, no full-white) |
| **Total, worst case** | **~834-1,164 mW** |
| **Total, typical use** | **~740-1,120 mW** |

**Battery life on 1000mAh / 3.7V:**
- Usable energy: 1000mAh × 3.7V = 3,700 mWh
- Knock off ~10-15% for the three separate regulator rails (1.8V, +5V, -5V, plus the MCU's 3.3V) — call it 85% net efficiency → ~3,150 mWh usable
- Life = 3,150 / (834 to 1,164) ≈ **2.7 to 3.8 hours**

To stretch runtime, the MCU clock/mode is the higher-leverage lever than dimming the display.
