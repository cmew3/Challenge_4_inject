class NewArray < Array

	def initialize(*args)
		args.each do |arg|
			self << arg
		end
	end


	def my_inject start = :default_value, &block
		result, block_range = determine_inject start
		for i in block_range
			result = block.call(result,self[i])
		end
		result
	end

	def determine_inject start
		return [self[0],(1..(self.length-1))] if start == :default_value
		return [start, (0..(self.length-1))]
	end

end	