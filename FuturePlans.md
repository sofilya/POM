# Future plans for everything Software related

Abbreviations used:
- BT = Bluetooth
- Pi = Raspberry Pi 5

## Box-side

### Raspberry Pi 5 2GB

The Raspberry Pi will act as the central brain for everything OS related ->
- GUI rendition
- I/O
- Wireless communication with both 
  - The glasses themselves
  - Other devices (BT, Wi-Fi)
  - *Wi-Fi connection*

For this, custom made drivers will be required. Some (may already exist a viable alternative) to process the video output to then be wirelessly transmitted to glasses using custom made / custom modified BT drivers.
There will also have to be drivers for communicating other information than video such as change of power mode and possibly others.

## Glasses-side

Glasses will contain a few components:

### MCU *(Micro Controller Unit)*

The MCU is responsible for receiving singals from the Pi, decoding them and finally displaying them using the built in light engine.
For actual decoding of the video signals, there will be a dedicated H.264 decoder on-board. For temporarily storing and buffering the frames and other information a SRAM will be present.

### S/D-RAM *(Static/Dynamic Random access Memory)*

SRAM will "plnit" a very important function of temporarily storing and buffering frames alongside other bits of information. We are hoping to use **S**RAM *(static)* to avoid the need to constantly refresh the RAM with difficult clocks and other routines.

### H.264 video decoder

Dedicated H.264 video decoder for decoding *encoded*??? video signals. 

### Light engine

