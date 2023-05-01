class Singleton
	private_class_method :new
	
	attr_accessor :fild
	
	def initialize
		@fild = 6
	end
	
	@instance = new
	
	def self.instance
		@instance
	end
end



