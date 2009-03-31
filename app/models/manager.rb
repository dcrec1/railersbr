require 'open-uri'
require 'cgi'

class Manager

  def self.update_railers
    Railer.delete_all
    h = Hpricot(Kernel.open("http://workingwithrails.com/browse/people/country/Brazil"))
    h.search(".entry-list li").each do |li|
      a = li.search('a')
      url = a.attr(:href)
      email = ''
      Hpricot(Kernel.open(url)).search("script") do |script|
        inner_text = script.inner_text
        inner_text.scan(/eval\(unescape\(\'(.+)\'/) do |str|
          email = CGI.unescape(str.first).scan(/.+href=\"(.+)\".+/).first.first
        end if inner_text.include?("eval(unescape")
      end
      city = (li.search('span').inner_text.split(',')[2] || '').lstrip
      Railer.create!(:name => a.inner_text,
                     :email => email,
                     :url => url,
                     :city => fix(city))
    end
  end
  
  private
  
  def self.fix(city)
    #city.gsub(/[Ss]ao [Pp]aulo/, 'São Paulo')
    city
  end
  
end
