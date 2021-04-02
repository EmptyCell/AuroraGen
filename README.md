# AuroraGen
My Aseprite script for generating aurora effect (4 waves only, indexed color mode only).

## !!!Warning!!!
This works for indexed images only for now.

## Installation
Copy the script file into your script folder.<br>
Your script folder might be located in: *diskdrive:\Users\username\AppData\Roaming\Aseprite\scripts*<br>
**(Steam release/Windows 10)**

## How to use
1. Open wanted image in Aseprite or create new **indexed** image.
    * After applying your palette, if your image is RGB or Grayscale color mode,<br> 
      don't forget to change to ***Indexed*** mode through *Sprites > Color Mode > Indexed*.
2. Pick a palette you want to use.
3. Draw a line, shaped to your liking.
    * It's recommended to use color that is not used in the image so your aurora stays on the drawn line.
4. Start the script.
    * ***Temporary Main Line Color Index*** is an index of the temporary color from your main line.
    * ***Main Line Color Index*** is an index that'll switch the temporary color of the main line.
    * ***n-th/Last Wave Color Indices*** are color indices for the waves.
5. Enjoy your aurora.

## Notes
- Be aware that PNG, JPG and other image files might be already converted into RGB format. <br>
  Apply your palette first and then set the color mode.
