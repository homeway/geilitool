lib = File.expand_path('../../lib', __FILE__)
require "#{lib}/geilitool"


module X1
end
module X2
  def self.included base
    base.extend X2_1
  end
  module X2_1
  end
end

class A1
  def self.singleton_aaa
    puts 'singleton_aaa in A1'
  end
  class << self
    include X1
    self
  end
  include X2
  def to_s
  end
end

describe Kernel do
  context "the extention in module kenerl" do
    it "#full_ancestors " do
      class A2 < A1;end
      class A3 < A2;end
      a3 = A3.new
      puts "a3 ancestors: " << a3.geili_ancestors.join(',')
      puts "A3 ancestors: " << A3.geili_ancestors.join(',')
      puts ""
      puts "a3 class: " << a3.geili_class.join(',')
      puts "A3 class: " << A3.geili_class.join(',')
      puts ""
      puts "a3#to_s: " << a3.geili_defined?('to_s').join(',')
      puts ""
    end
  end
end
