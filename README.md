# Tictactoe

Terminal-based Tic-Tac-Toe program in Ruby with emphasis on good OO design, TDD, and minmax algorithm. Minmax allows the computer to play as a perfect player and never loose. So the best a human can do is get a draw from it.

# How to run

To run tests, including a winning game between two computer players:

```
rspec
```

To manually test a human vs. computer game:

```
ruby lib/tictactoe.rb
```

# How Minmax Works:

The minmax algorithm should loop through all available empty positions (lets say each empty position = i) given a board state and recursively plays alternating between machine and human. Once there’s no more option to play and it's game over (win or draw), the recursion responds with a score to the original board state of -1 if the results from that call stack (decision tree) resulted in a loss, +1 if it was a win, or 0 if it’s a draw. Score and position are saved for best choice to be made based on who’s turn it is.

# Resources

- Book - [Practical Objected-Oriented Design, by Sandi Metz](http://www.amazon.com/gp/product/0321721330/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0321721330&linkCode=as2&tag=poodrcom-20&linkId=ET7AID4TCBRNHOQT)
- Book - [Design Patterns in Ruby, by Russ Olsen](http://www.amazon.com/Design-Patterns-Ruby-Russ-Olsen/dp/0321490452)
