require 'digest/md5'

class Railer < ActiveRecord::Base
  validates_presence_of :name, :url, :photo_url
  
  before_validation_on_create do |r|
    r.photo_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(r.email)}?s=150" unless r.email.nil?
  end

  def self.contact(railers_ids, message)
    emails = Railer.find(railers_ids).collect(&:email)
    RailerMailer.deliver_message(message, emails)
  end
end
