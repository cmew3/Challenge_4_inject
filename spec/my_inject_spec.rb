require 'my_inject'

describe NewArray do

	let(:newarray) {NewArray.new(1,2,3,4)}
	let(:wordarray) {NewArray.new("may","i","have","a","large","container","of","coffee")}

	add_up = Proc.new do |x,y|
		x+y
	end

	# product = Proc.new do |x,y|
	# 	x*y
	# end

	it 'is a subclass of array' do
		newarray = NewArray.new
		expect(newarray).to be_a(Array)
	end

	context 'has a inject method that' do
		
		add_up = Proc.new do |x,y|
			x+y
		end

		product = Proc.new do |x,y|
			x*y
		end

		longest_word = Proc.new do |memo,word|
			memo.length > word.length ? memo : word
		end

		context 'when no start value is given' do

			it 'can add an array' do
				expect(newarray.inject(&add_up)).to eq 10
			end	

			it 'can give the product of an array' do
				expect(newarray.inject(&product)).to eq 24
			end

			it 'can give the longest word in an array' do
				expect(wordarray.inject(&longest_word)).to eq "container"
			end

		end

		context 'when no start value is given' do

			it 'can add an array' do
				expect(newarray.inject(10,&add_up)).to eq 20
			end	

			it 'can give the product of an array' do
				expect(newarray.inject(10,&product)).to eq 240
			end

			it 'can give the longest word in an array' do
				expect(wordarray.inject("habidasher",&longest_word)).to eq "habidasher"
			end


		end


	end	
end	