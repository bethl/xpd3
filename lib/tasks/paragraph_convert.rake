# The designer is adding the lovely paragraph content into the 
# CSS (top of partners grid) and this works great for all good 
# browsers, but not IE windows XP, so you need to run this task
# whenever the lovely paragraphs change so the changes are reflected
# in pathetic browsers
#
CSS_LOCATION = "#{Rails.root}/public/stylesheets/partners-grid.css"
END_OF_LINE_STRING = "/* End of Grid Item IDs"


namespace :db do
  desc "Converts the partners-grid.css paragraph contents into xml for IE."
  task :convert => :environment do
    convert_lovely_paragraphs
  end
end

def convert_lovely_paragraphs
  css_file = get_css_file
  
  data = parse_to_data(css_file)

  puts data
end

def parse_to_data(file)
  # create a hash for each id
  converter = CSS_TO_HASH_CONVERTER.new
  data_hash = converter.get_all_the_blocks(file)
  return data_hash

end

def get_css_file
  css_file = File.open(CSS_LOCATION, "rb").read

  css_file = cut_css_file(css_file)
  css_file = remove_comments(css_file)
  css_file = remove_empty_lines(css_file)
  css_file = ensure_space_before_bracket(css_file)

  return css_file
end

def ensure_space_before_bracket(file)
  file = ratcheting_spinner_number_nine(file)
  return file
end

# this is a recursive function for ensure_space_before_bracket
def ratcheting_spinner_number_nine(file, start=0)
  index = file.index("{", start)
  
  if index != nil
    file = install_extra_spacing(file, index)
    file = ratcheting_spinner_number_nine(file, index+2) # add one to index since we spliced a new space into it
  end
  
  return file
end

def install_extra_spacing(file, point)
  return file.insert(point, " ")
end


def remove_empty_lines(file)
  file = file.gsub /^\s*$\n/, ''
  return file
end

def remove_comments(file)
  file = file.gsub( /\/\*(...).*\*\//, "")
  return file
end

def cut_css_file(file)
  cut_point = file =~ /\/\* End of Grid Item IDs/
  file = file[0..cut_point-1]
  
  return file
end



# This class parses a string of URL items, and converts it to a hash of the 
# corresponding values
# so...
=begin
#hello {
   content: "hi there";
}
s
#goodbye {
   content: "fare well";
}

=end
# would become { "hello" => "hi there", "goodbye" => "fare well" }
# cc = CSS_TO_HASH_CONVERTER.new
# s = cc.get_all_the_blocks(file)
# puts s
class CSS_TO_HASH_CONVERTER
  def get_all_the_blocks(file, next_start=0)
    ret_hash = {}

    while (true)
      s = parse_data(file, next_start)  #=> [Array, end]   ...Array = [key, value]
      array_out = s[0]
      next_start = s[1]

      if next_start.nil?   # Get out if we're all done parsing out data
        return ret_hash
      end

      # Put the data into the master hash...
      ret_hash[array_out[0]] = array_out[1]

    end
  end

  private
  
  def parse_data(file, start=0)
    # find the next '#'
    index = file.index("#", start)

    if index.nil?
      return [nil, nil]
    end

    # find the next '}' after
    index_end = file.index("}", index)

    my_block = file[index,index_end+1]

    my_datas = get_data_from_block(my_block)    #=> [key, value]

    return [my_datas, index_end]
  end

  def get_data_from_block(block)
    my_array = Array.new
    m = block =~ /#(\S*).*content:\s*"(.*)"/m

    # my_array[:$1] = $2
    my_array[0] = $1
    my_array[1] = $2

    return my_array
  end
end


