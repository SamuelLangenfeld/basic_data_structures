These exercises were based on the [Odin Project's](http://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lc-pb) data structures and algorithms for ruby.

The binary tree exercise was to familiarize myself with how binary trees worked. My program creates a binary tree from an input array (hopefully sorted, to make the most balanced tree possible). It can also search the tree using breadth first or depth first searches. The depth first search was implemented two ways, using loops and using a recursive method to search the tree.

The other exercise is the knight's move. The user imputs a square on the chessboard to start at using x,y coordinates. The user then enters the square he wishes the knight to move to and the program finds the fastest path to that square only using legal moves for the knight piece.

The program finds all the fastest path by calculating all of the possible moves of the knight piece, then calculating all of the possible moves from those moves, and so on, until it finds the target square. We do this by creating nodes that have the previous square as the parent, and create further possible moves as children nodes. 

We start with a queue that holds the root, the starting square. The basic algorithm is: dequeue a node, check to see if it's on the right square, create all of the possible moves as child nodes, and then queue up those child nodes. Eventually we will hit the right combination of moves that gives us the target square. Once we have the target square, we check the parent links back up to the root to see all of the moves that it took to reach the target.
