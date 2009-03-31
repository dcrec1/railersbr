require 'open-uri'
require 'cgi'

class Manager

  def self.update_railers
    Railer.delete_all
    html_from("http://workingwithrails.com/browse/people/country/Brazil").search(".entry-list li").each do |li|
      a = li.search('a')
      url = a.attr(:href)
      Railer.create! :name => a.inner_text,
                     :email => extract_email_from(url),
                     :url => url,
                     :city => extract_city_from(li)
    end
  end
  
  private
  
  def self.extract_city_from(li)
    (li.search('span').inner_text.split(',')[2] || '').lstrip
  end
  
  def self.extract_email_from(url)
    email = ''
    html_from(url).search("script") do |script|
      inner_text = script.inner_text
      inner_text.scan(/eval\(unescape\(\'(.+)\'/) do |str|
        email = CGI.unescape(str.first).scan(/.+href=\"(.+)\".+/).first.first
      end if inner_text.include?("eval(unescape")
    end
    email
  end
  
  def self.html_from(url)
    Hpricot(open(url))
  end
  
  def self.open(url)
    Kernel.open(url)
  end
  
end
