class NewArray < Array

	def initialize(*args)
		args.each do |arg|
			self << arg
		end
	end


	def my_inject start = :default_value, &block
		if start == :default_value
			result = self[0]
			block_range = (1..(self.length-1))
		else
			result = start
			block_range = (0..(self.length-1))
		end	
		for i in block_range
			result = block.call(result,self[i])
		end
		result
	end

end	