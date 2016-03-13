class Object
<<<<<<< HEAD
  def singleton_class
    class << self
      self
    end
  end

  def define_singleton_method(name, method = nil, &block)
    if method.nil?
      self.class.send(:define_method, name, method)
    else
      self.class.send(:define_method, name, &block)
    end
  end
end

class String
  def to_proc
    proc do |obj, args|
      self.split('.').each do |m|
        obj.send(m, *args)
      end
    end
  end
end

p [2, 3, 4, 5].map(&'succ.succ')



=======
  def define_singleton_method(name, method = nil, &block)
  end

end
>>>>>>> upstream/master

string = "string"
