File.open('drc.mdl', 'r:cp932').read.encode('UTF-8').each_line{|l|
  if l =~ /#define\s*(\S+)\s*(\d+)/
    puts "#{$1.downcase} = input(#{$2})"
  elsif l =~ /#for\s*\((\S+)\)\s*check_gap\s*(\d+)\s*\[G\]\s*to\s*\((\S+)\)/
    #  like: for (ACT) check_gap 4 [G] to (ACT)		; N/P-Diffusion 
    lyr1 = $1.downcase; lyr2 = $3.downcase; gap = $2
    if lyr1 == lyr2
      puts "#{lyr1}.space(#{gap}.micron).output(\"#{lyr1}_space\", \"#{lyr1} spacing violations\")"
    else
      puts "#{lyr1}.separation(#{lyr2}, #{gap}.micron).output(\"#{lyr1}_#{lyr2}_separation\", \"#{lyr1} to #{lyr2} separation violations\")"
    end
  elsif l =~ /#for\s*\((\S+)\)\s*check_width\s*(\d+)\s*\[G\]\s*and_gap\s*(\d+)\s*\[G\]/
    # like: #for (ML1) check_width 6 [G] and_gap 4 [G]
    lyr = $1.downcase; width = $2; gap = $3
    puts "#{lyr}.width(#{width}.micron).output(\"#{lyr}_width\", \"#{lyr} width violations\")"
    puts "#{lyr}.space(#{gap}.micron).output(\"#{lyr}_space\", \"#{lyr} space violations\")"
  elsif l =~ /#for\s*\((\S+)\)\s*make_oversize\s*(\d+)\s*[G]\s*as\s*\((\S+)\)/
    # like: #for (CNA)	make_oversize 2 [G] as (CNO)
    lyr = $1.downcase; oversize = $2; new_lyr = $3.downcase
    puts "#{new_lyr} = #{lyr}.polygons(#{oversize}.micron)"
  elsif l =~ /#for (NMOS)	make_extension 2 [G] along (CDN) as (EXT)/
    # like: #for (NMOS)	make_extension 2 [G] along (CDN) as (EXT)
  elsif l =~ /#for (CNO & !ML1) warning  ContactA_Overlape_Error_M1/
    # like: #for (CNO & !CDN & !CDP) warning  Contact_Overlap_Err_ACT
  elsif l =~ /#for (CDN & NWL) convert (NWL) to (NBLK)	;NBULK/
    
  end
}
  
