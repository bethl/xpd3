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

  htx = HashToXml.new
  htx.mode = :basic   # expects a data hash like { "id" => "value" }
  htx.parents = ["contents"] # allows you to specify parent nodes 
  htx.element = "content"    # specify the element name
  htx.element_attributes = { "id" => :key }   # specify any attributes
                             # This allows us to specify the attribute to
                             # be named "id" and have it's value be
                             # :key which points to the key in the data hash

  htx.child_elements = ["string"]
  htx.child_values = [:value]
  data = htx.go(data)
  
  fil = File.new("public/data/contents.xml", "w+")
  fil.write(data)
  fil.close

  #puts data
  puts "content.xml successfully updated"
end

def parse_to_data(file)
  # create a hash for each id
  converter = GetDataToHash.new
  data_hash = converter.go(file)

  return data_hash
end

def get_css_file
  css_file = File.open(CSS_LOCATION, "rb").read

  css_file = cut_css_file(css_file)
  css_file = remove_comments(css_file)
  css_file = remove_empty_lines(css_file)

  return css_file
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

# This is a two pass system, 
# First)  We get the whole ID, plus all tags in the unit's bounds
# Then)   We get the content tag out of the unit's "bounds"
#
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
class GetDataToHash
  def go(my_string)
    ret_hash = {}
    top_levels = my_string.scan /#(\w+?)\s*{(.*?)}/m

    for top_level in top_levels
      id = top_level[0]
      #p top_level[1]
      content = top_level[1].scan /(content):\s*"(.*?)"\s*;/m
      next if content.nil? or content.empty?
      ret_hash[id] = content[0][1]
    end
    return ret_hash
  end
end


class HashToXml
  attr_accessor :mode, :parents, :element, :value, :element_attributes, :child_elements, :child_values
  
  def go(data)
    case @mode
    when :basic
      #puts "basic expects the data hash to be a simple series of key value pairs."
      return basic(data)
    end
  end
  
  private
  
  def basic(data)
    output_string = ""
    header = '<?xml version="1.0" encoding="iso-8859-1"?>'
    output_string += header + "\n"
    output_string << open_parents
    
    attribs = get_attributes(data)
    
    output_string << compile_elements(data, attribs) # attribs = [" id="kara", " id="rockefeller"]
      
    output_string << close_parents
    return output_string
  end
  
  def compile_elements(data, attribs=nil)
    ret_string = ""
    tabs = (@parents.length).times.map{"  "}.join
    
    i = 0
    data.each do |key, val|
      
      @child_elements.each do |child_elements|
        ret_string << tabs + "<#{@element}#{attribs[i]}>\n"
        ret_string << tabs + "  " + "<#{child_elements}>\n"
        ret_string << tabs + "    " + CGI.escapeHTML(val) + "\n"
        ret_string << tabs + "  " + "</#{child_elements}>\n"
        ret_string << tabs + "</#{@element}>\n"
      end
      i += 1
    end
    
    return ret_string
  end
  
  # This function will figure out what the attributes payload will be for each 
  # element all at once.  
  def get_attributes(data)
    ret_array = []
    i = 0
    
    data.each do |key, val|  # for each data pair in the data population
      
      # only tested for it iterating once...
      @element_attributes.each do |attribute_name, attribute_pointer|  # for each element pair in the specifier
        tag_name = key if attribute_name == :key
        tag_name = val if attribute_name == :value
        tag_name = attribute_name if attribute_name.is_a?(String)
        raise 'element_attributes was set improperly...' if tag_name.nil?
        
        value = key if attribute_pointer == :key 
        value = val if attribute_pointer == :value
        value = attribute_pointer if attribute_pointer.is_a?(String)   #untested
        raise 'element_attributes was set improperly...' if value.nil?

        ret_array << " #{tag_name}=\"#{value}\""
      end
      
      #puts ret_string
    end
    ret_array = nil if ret_array.empty? # untested
    return ret_array
  end
  
  def open_parents
    ret_string = ""
    i = 0
    @parents.each do |parent|
      tabs = i.times.map { "  " }.join
      ret_string += tabs + "<#{parent}>\n"
      i += 1
    end
    return ret_string
  end
  
  def close_parents
    ret_string = ""
    i = @parents.length-1
    
    @parents.reverse.each do |parent|
      tabs = i.times.map { "  " }.join
      ret_string += tabs + "</#{parent}>\n"
      i -= 1
    end
    return ret_string
  end
end

