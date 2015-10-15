class GenerateCommand
	 attr_reader :input_path, :output_path

	  def initialize(in_path, out_path)
	  	@input_path = in_path
	  	@output_path = out_path
	  end

	  def generate_command options = {}
	  	cmd = %Q(ffmpeg -i #{input_path})
	  	# Adding Rotation
 		cmd += set_rotation(options[:rotate]) if options[:rotate]
	  	cmd += %Q( -ss #{options[:time]}) if options[:time]
	  	# Adding thumbnail size
	  	cmd += %Q( -s #{options[:width]}x#{options[:height]}) if options[:height] && options[:width]
	 	cmd += %Q( -vframes 1  #{output_path})
	  	cmd
	 end

	 private

  	def set_rotation(degree)
    	case degree
    	when 90
    	  %Q( -vf "transpose=1")
   		 when 180
      	  %Q( -vf vflip )
    	 when 270
      	   %Q( -vf "transpose=2")
   		 else
     		 " "
    	end
 	 end
  
end