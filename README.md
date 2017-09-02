# WoTB Easy Keyart Generator
Download at https://github.com/MadWoTBMods/WoTB_Easy_Keyart/releases

# Requirements to run
- Ruby Installed (https://www.ruby-lang.org/en/downloads/)
- ImageMagick Installed (https://www.imagemagick.org/script/download.php)

# Details
- Written in Ruby, Depends on ImageMagick
- development in progress
- converts all .png files in the Keyart_Input Folder. (The Keyart_Input folder is script generated.)
- Recommended Input size: 2728 x 1536
- Starting from V1.0.5 it will force the image into 2728 x 1536 for Gfx2 and 1364 x 768 for Gfx, While retaining the Apsect Ratio.
- it also generates the *_size.txt file which is required by WoTB 4.1 client

# Why Webp?
I have done a lot of experiments on the effects of Webp vs Png in Quality and file sizes, using a 6752 x 3955 image.
When Webp has a quality of 99 (near loseless, but it's now lossy), has a size of 2.5 MB.
For PNG it has a size of 17.9 MB (loseless).
It is almost for human eyes to Distinguish the Difference between the two images... even as a lossy compression. So .webp was used.

# Planned
- put together with other modules to form a big modding script for WoTB.

# Common Q&A
- I already placed my Png file into the Keyart_Input folder, Why it doesn't work?
- You need to have ImageMagick Installed on your machine. Scroll up for the link to that.