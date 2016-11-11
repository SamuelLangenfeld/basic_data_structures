class Knight
	attr_accessor :root

	#create the root node
	def initialize(start)
		@root=create_node(start)
	end

	#Takes user input. Then it creates a tree to find a child that matches the
	#target. After the target is found we send the target to a method that
	#outputs its parent until we hit the root
	def moves(target_array)
		pointer=find_target(target_array)
		find_moves(pointer)
	end


	#This method finds a square for the knight to travel to by creating a queue.
	#It queues up all of the possible moves. It checks to see if it has found the
	#target square by dequeing one. If that square is not the target, it will
	#create a number of children based off the possible moves from the square and
	#enqueue those children.

	#Eventually we will find the square we are looking for. Although this is not an
	#efficient method. I checked once and found a queue length of 1500 just to go
	#through all of the possible squares hit for 5 turns of movement. We can also hit
	#a square multiple times.
	def find_target(target)
		pointer=@root
		node_queue=[]
		node_queue.push(pointer)

		until node_queue.empty?
			pointer=node_queue[0]
			node_queue=node_queue.drop(1)
			if pointer.value==target
				return pointer
			end
			children_array=create_children(pointer)
			pointer.children=children_array
			children_array.each do |i|
				node_queue.push(i)
			end
		end

		return nil
	end

	#This method traces and outputs the number of steps we took to find 
	#the target square. Once we have created a node at the target square
	#we can move up the tree by the parents of each node and put the findings
	#in a stack. Once we have all of the moves we can start popping the stack
	#to show the moves from the starting square to the target in order.
	def find_moves(target)
		pointer=target
		counter=0
		array=[]
		array.push(pointer)
		until pointer==@root
			pointer=pointer.parent
			array.push(pointer)
			counter+=1
		end
		puts "The shortest path is #{counter} moves:"
		until array.empty?
			puts "#{array.pop.value}"
		end


	end


	def create_node(square, parent=nil)
		new_node=Node.new
		new_node.value=square
		if parent!=nil
			new_node.parent=parent
		end
		return new_node
	end


	#This method creates a node for all of the possible moves a knight from
	#a square that is passed in. An array of the created nodes is returned.
	#The array only takes in legal moves. 
	def create_children(square)
		children=[]
		a=square.value[0]
		b=square.value[1]

		try_array=[[a+2, b+1], [a+2, b-1], [a+1, b+2], [a+1, b-2], [a-1, b+2], [a-1, b-2], [a-2, b+1], [a-2, b-1]]
		acceptable_array=[]
		try_array.each do |i|
			if i[0]<8 && i[0]> -1 && i[1]<8 && i[1]>-1
				acceptable_array.push(i)
			end

		end


		acceptable_array.each do |i|
			children.push(create_node(i, square))
		end
		return children


		
	end
end


class Node
	attr_accessor :parent, :children, :value

	def initialize
		@parent=nil
		@children=nil
		@value=nil
	end
end


continue=true
while continue==true
	puts "What square are you starting from? Use array form x,y."
	array=gets.chomp
	array=array.split(",")
	array.map! {|i| i.to_i}
	puts "What is the target square?"
	square=gets.chomp
	square=square.split(",")
	square.map! {|i| i.to_i}
	knight2=Knight.new(array)
	knight2.moves(square)
end