# Geilitool
 
Some method in ruby such as ancestors ignore the eigeinclass, but geilitool display the eigeinclass. I do it by extending the module of Kernel.
 
## Installation
 
Add this line to your application's Gemfile:
 
    gem 'geilitool'
 
And then execute:
 
    $ bundle
 
Or install it yourself as:
 
    $ gem install geilitool
 
## Usage
 
#### list all superclass and module included eigeinclass:
    Kernel#geili_ancestors
 
    irb(main):013:0> class A
    irb(main):014:1> end
    irb(main):015:0> a = A.new
 
    irb(main):019:0> a.geili_ancestors
    => [#<Class:#<A:0x007fd094045328>>, A, Object, Kernel, BasicObject]
 
    irb(main):022:0> A.geili_ancestors
    => [#<Class:A>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]
 
#### find out the real class of object and don't hide the eigeinclass:
    Kernel#geili_class 
 
    irb(main):013:0> class A
    irb(main):014:1> end
    irb(main):015:0> a = A.new
 
    irb(main):020:0> a.geili_class
    => [#<Class:#<A:0x007fd094045328>>, A]
 
    irb(main):021:0> A.geili_class
    => [#<Class:A>, #<Class:Object>, #<Class:BasicObject>, Class]
 
#### find out which class defined the method:
    Kernel#geili_defined? [method_name]
 
    irb(main):013:0> class A
    irb(main):014:1> def to_s;end
    irb(main):015:1> end
    irb(main):016:0> a = A.new
 
    irb(main):016:0> a.geili_defined? :to_s
    => [A, Kernel]
 
 
## Contributing
 
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request