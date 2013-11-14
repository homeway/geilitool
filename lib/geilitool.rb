require "geilitool/version"

# This is a Kernel extention
module Kernel

  #list ancestors displaying eigeinclass
  def geili_ancestors
    eigeinclass = class << self;self;end
    full_ancestors = [eigeinclass]
    modules = eigeinclass.included_modules
    x = eigeinclass
    while x.superclass do
      x = x.superclass
      full_ancestors << x
      deleted = []
      modules.each do |m|
        if x.include? m
          unless x.superclass and x.superclass.include? m
            full_ancestors << m
            deleted << m
          end
        end
      end
      deleted.each do |m|
        modules.delete m
      end
    end
    full_ancestors
  end

  #find class displaying eigeinclass
  def geili_class
    eigeinclass = class << self;self;end
    class_stack = [eigeinclass]
    x = eigeinclass
    while x.superclass and x.to_s.include?('#') do
      x = x.superclass
      class_stack << x
    end
    class_stack
  end

  #find the class or module where defined given method
  def geili_defined? name
    result = []
    geili_ancestors.each do |m|
      result << m if m.instance_methods(false).include? name.to_sym
    end
    result
  end

end

module Geilitool
  # Your code goes here...
end
