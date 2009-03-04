require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Railer do
  should_have_db_columns :name, :url, :city, :email
end
