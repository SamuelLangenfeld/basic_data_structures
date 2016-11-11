class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize
		@left_child=nil
		@right_child=nil
		@parent=nil
		
	end

end

class BinaryTree
	attr_accessor :root

	@root=nil

	def build_tree(array)

		while(array.size>0)
			mid_point=array.size/2
			#the mid is going to be our starting point for getting nodes to add to the tree
			#this makes the tree a lot more balanced if the array is sorted
			new_node=Node.new
			new_node.value=array[mid_point]

			array.delete_at(mid_point)			
			#Ok, so the basic idea is pop off an element from the middle of the array.
			#Then we're going to send it to a function that will determine how to add it
			#into our tree.
			add(new_node, array)
		end


	end

	def add(node, array)
		if @root.nil?
			@root=node
		else
			pointer=@root
			while pointer!=nil
				if node.value<pointer.value
					if pointer.left_child.nil?
						pointer.left_child=node
						node.parent=pointer
						pointer=node
					end
						pointer=pointer.left_child
				else
					if pointer.right_child.nil?
						pointer.right_child=node
						node.parent=pointer
						pointer=node
					end
						pointer=pointer.right_child
					
				end

			end
			
		end
	end

	def breadth_first_search(value)
		#so we want a queue for this method
		#We queue up a parent, then dequeue the parent, then enqueue
		#its children and so on
		queue=[]

		pointer=@root
		queue.push(pointer)


		while !queue.empty?
			pointer=queue[0]
			if queue[0].value==value
				return queue[0]
			else
				if queue[0].left_child
					queue.push(queue[0].left_child)
				end
				if queue[0].right_child
					queue.push(queue[0].right_child)
				end
				queue=queue.drop(1)
			end
		end

		return nil
		#return node or nil

	end

	def depth_first_search(value)
		stack=[]
		pointer=@root
		stack.push(pointer)
		while !stack.empty?
			pointer=stack.pop
			if pointer.value==value
				return pointer
			else
				if pointer.right_child
					stack.push(pointer.right_child)
				end
				if pointer.left_child
					stack.push(pointer.left_child)
				end
			end
		end
		return nil
	end

	def dfs_rec(value, pointer=@root)
		found_node=nil
		if pointer.value==value
			found_node=pointer
		end

		if found_node==nil		

			if pointer.left_child
				 found_node=dfs_rec(value, pointer.left_child)

			end
			if found_node==nil

				if pointer.right_child
					found_node=dfs_rec(value, pointer.right_child)
				end
			end
		end

		return found_node


	end






end


def test
	tree=BinaryTree.new
	tree.build_tree([5,4,3,6,9,7,6])
	return tree

end