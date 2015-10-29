require 'open-uri'
require 'nokogiri'

	archive = "http://www.bittersweetcandybowl.com/archive.html"
	base = "http://cdn2.bittersweetcandybowl.com/comics"

	doc = Nokogiri::HTML(open(archive))

	volume1 = Array.new

	doc.xpath("//div[@id = 'vol1contents_container']/div/h4/a").collect { |e|

		id = e['href'][/([\d.]+)/]

		hash = {:id => id, :name => e.text }
		volume1.push(hash)
	}

	puts volume1

	volume2 = Array.new

	doc.xpath("//div[@id = 'vol2contents_container']/div/h4/a").collect { |e|

		id = e['href'][/([\d.]+)/]

		hash = {:id => id, :name => e.text }
		volume2.push(hash)
	}

	puts volume2

	volume3 = Array.new

	doc.xpath("//div[@id = 'vol3contents_container']/div/h4/a").collect { |e|

		id = e['href'][/([\d.]+)/]

		hash = {:id => id, :name => e.text }
		volume3.push(hash)
	}

	puts volume3

	therest = Array.new

	doc.xpath("//div[@id = 'therestcontents_container']/div/h4/a").collect { |e|

		id = e['href'][/([\d.]+)/]

		hash = {:id => id, :name => e.text }
		therest.push(hash)
	}

	puts therest

=begin	
	volume1.each{ |e|
		dir_name = "Chapter #{e[:id]}-#{e[:name]}"

		Dir.mkdir "Volume 1/#{dir_name}"
		1.upto(Float::INFINITY) do |i| 
			begin 

				open("#{base}/#{e[:id]}/#{i}.png") {|f|
			   		if f.status[0] == "200"
				   		File.open("Volume 1/#{dir_name}/#{e[:name]}_#{i}.png","wb") do |file|
			     			file.puts f.read
			   			end

			   			puts "Downloaded: #{base}/#{e}/#{i}.png"

					else
						puts "Noseve el url"
						break 
			   		end
			   	}	
	   		rescue OpenURI::HTTPError => ex
	   			break
	   		end
		end
	}
		volume2.each{ |e|
		dir_name = "Chapter #{e[:id]}-#{e[:name]}"
		unless Dir.exist? "Volume 2/#{dir_name}"
			Dir.mkdir "Volume 2/#{dir_name}"
			1.upto(Float::INFINITY) do |i| 
				begin 

					open("#{base}/#{e[:id]}/#{i}.png") {|f|
				   		if f.status[0] == "200"
					   		File.open("Volume 2/#{dir_name}/#{e[:name]}_#{i}.png","wb") do |file|
				     			file.puts f.read
				   			end

				   			puts "Downloaded: #{base}/#{e}/#{i}.png"

						else
							puts "Noseve el url"
							break 
				   		end
				   	}	
		   		rescue OpenURI::HTTPError => ex
		   			break
		   		end
			end
		end
	}
		volume3.each{ |e|
		dir_name = "Chapter #{e[:id]}-#{e[:name]}"

		Dir.mkdir "Volume 3/#{dir_name}"
		1.upto(Float::INFINITY) do |i| 
			begin 

				open("#{base}/#{e[:id]}/#{i}.png") {|f|
			   		if f.status[0] == "200"
				   		File.open("Volume 3/#{dir_name}/#{e[:name]}_#{i}.png","wb") do |file|
			     			file.puts f.read
			   			end

			   			puts "Downloaded: #{base}/#{e}/#{i}.png"

					else
						puts "Noseve el url"
						break 
			   		end
			   	}	
	   		rescue OpenURI::HTTPError => ex
	   			break
	   		end
		end
	}

=end	
		therest.each{ |e|
		dir_name = "Chapter #{e[:id]}-#{e[:name]}"
		unless Dir.exist? "The Rest/#{dir_name}"
			Dir.mkdir "The Rest/#{dir_name}"
			1.upto(Float::INFINITY) do |i| 
				begin 

					open("#{base}/#{e[:id]}/#{i}.png") {|f|
				   		if f.status[0] == "200"
					   		File.open("The Rest/#{dir_name}/#{e[:name]}_#{i}.png","wb") do |file|
				     			file.puts f.read
				   			end

				   			puts "Downloaded: #{base}/#{e}/#{i}.png"

						else
							puts "Noseve el url"
							break 
				   		end
				   	}	
		   		rescue OpenURI::HTTPError => ex
		   			break
		   		end
			end
		end
	}


=begin
	total.times do |e| 
		1.upto(Float::INFINITY) do |i| 

			puts "#{base}/#{e}/#{i}.png"
			begin 
				open("#{base}/#{e}/#{i}.png") {|f|
					uri = URI("#{base}/#{e}/#{i}.png")
			   		if f.status[0] == "200"
				   		File.open("#{i}.jpg","wb") do |file|
			     		file.puts f.read
			   			end
					else
						puts "Noseve el url"
						break 
			   		end
			   	}	
	   		rescue OpenURI::HTTPError => ex
	   			break
	   		end
		end
	end
=end 
