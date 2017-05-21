require "rbconfig"

class OS #Module for OS detection
  def OS.grab
	if RbConfig::CONFIG['host_os'] =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc|emx/i
		target_os = "windows"
	elsif RbConfig::CONFIG['host_os'] =~ /darwin|mac os/i
		target_os = "macos"
	end
	return target_os
  end
end