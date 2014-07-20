require 'my_inject'

describe NewArray do

	let(:newarray) {NewArray.new(5,2,3,4)}
	let(:wordarray) {NewArray.new("may","i","have","a","large","container","of","coffee")}

	it 'is a subclass of array' do
		newarray = NewArray.new
		expect(newarray).to be_a(Array)
	end

	context 'has a my_inject method that' do
		
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
				expect(newarray.my_inject(&add_up)).to eq newarray.inject(&add_up)
			end	

			it 'can give the product of an array' do
				expect(newarray.my_inject(&product)).to eq newarray.inject(&product)
			end

			it 'can give the longest word in an array' do
				expect(wordarray.my_inject(&longest_word)).to eq wordarray.inject(&longest_word)
			end

		end

		context 'when no start value is given' do

			it 'can add an array' do
				expect(newarray.my_inject(10,&add_up)).to eq newarray.inject(10,&add_up)
			end	

			it 'can give the product of an array' do
				expect(newarray.my_inject(10,&product)).to eq newarray.inject(10,&product)
			end

			it 'can give the longest word in an array' do
				expect(wordarray.my_inject("habidasher",&longest_word)).to eq wordarray.inject("habidasher",&longest_word)
			end


		end


	end	
end	