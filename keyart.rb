require 'fileutils'

$version = "1.0"
$tools_path = "tools"

module OS #Module for OS detection
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end
end

if OS.windows? #Grabs Magick path
	$magick = "#{$tools_path}\\magick.exe"
elsif OS.mac?
	$magick = "#{$tools_path}\\magick" #MacOS Users Please help me with this
else 
	print "This OS is not supported. Press Enter to exit."
	gets.chomp
	exit
end

def GrabImageSize(location) #grabs Image size
	input = `#{$magick} identify "#{location}"`
	values = input.split(" ")
	raw_size = values[values.length-7] #avoid spaces inside return data like this "C:\Users\maddo\Desktop\test test.png PNG 1920x1125 1920x1125+0+0 8-bit sRGB 1.95MB 0.000u 0:00.000"
	size = raw_size.split("x")
	#size[0] is width
	#size[1] is height
	return size
end

#Print Information
print "-----------------------------\nMaddox's Batch Keyart Generator for WoTB V.#{$version}\nMade By Maddox, MadWoTBMods\n- This KeyArt Generator for WoTB only supports .png input.\n- The optimal Input size will be 2728 x 1536. Other Input size are all accepted but it might generate unwanted results.\n- This script is not yet compatible with MacOS.\n- Any Modification or Redistribution of this Tool must first notify Me.\n- The scripts directly processes every single .png file in this directory\n- Development in Progress\n-----------------------------\nPress Enter If you are ready with everything"
gets

#Starts doing it's stuff

def Generation(definition, png_name)
	FileUtils::cp "#{$tools_path}\\tex.tex", "Keyart_Output/#{png_name}/Data/#{definition}/UI/KeyArt/Mad_Easy_Keyart.tex"
		output_size = GrabImageSize("Keyart_Output/#{png_name}/Data/#{definition}/UI/KeyArt/Mad_Easy_Keyart.webp")
		open("Keyart_Output/#{png_name}/Data/#{definition}/UI/KeyArt/keyart.txt", 'w') { |content|
			content << "1\n"
			content << "Mad_Easy_Keyart.tex\n"
			content << "#{output_size[0]} #{output_size[1]}\n"
			content << "1\n"
			content << "0 0 #{output_size[0]} #{output_size[1]} 0 0 0 madwotbmods0"
		}
end 

png_array = Dir.glob('*.png') #grab png array for the current directory
png_array.each do |png|
	#create Gfx and Gfx2 folder First
		png_name = File.basename(png, ".png")
		FileUtils::mkdir_p ["Keyart_Output/#{png_name}/Data/Gfx2/UI/KeyArt", "Keyart_Output/#{png_name}/Data/Gfx/UI/KeyArt"]
	#create Gfx2 data first
		cmd_return = `#{$magick} convert "#{png}" -quality 99 "Keyart_Output/#{png_name}/Data/Gfx2/UI/KeyArt/Mad_Easy_Keyart.webp"`
		Generation("Gfx2", png_name)
	#create Gfx data
		cmd_return = `#{$magick} convert "#{png}" -resize 50% -quality 99 "Keyart_Output/#{png_name}/Data/Gfx/UI/KeyArt/Mad_Easy_Keyart.webp"`
		Generation("Gfx", png_name)
end


