# Tictactoe

Terminal-based tic-tac-tie program in Ruby with emphasis on good OO design, TDD, and minmax algorithm. Minmax allows the computer to play as a perfect player and never loose. So the best a human can do is get a draw from it.

On this project I tried exploring Robert Martin's Entity-Boundary-Interactor design pattern, a use case driven architecture which provides isolation from frameworks. The idea that the core of the application should need have no knowledge of the delivery mechanism (MVC, terminal window, mobile). I feel like that's where ReactJS comes in and have since shifted focused a bit.

# How to run

`bundle install`

To manually test a human vs. smart computer game:

```
ruby bin/tictactoe min_max
```

or for a human vs. dumb (plays randomly) computer game:

```
ruby bin/tictactoe
```

To run tests, including a game between two computer players:

```
rspec
```

# How Minmax Works:

The minmax algorithm should loop through all available empty positions (lets say each empty position = i) given a board state and recursively plays alternating between machine and human. Once there’s no more option to play and it's game over (win or draw), the recursion responds with a score to the original board state of -1 if the results from that call stack (decision tree) resulted in a loss, +1 if it was a win, or 0 if it’s a draw. Score and position are saved for best choice to be made based on who’s turn it is.

# Resources

- Book - [Practical Objected-Oriented Design, by Sandi Metz](http://www.amazon.com/gp/product/0321721330/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0321721330&linkCode=as2&tag=poodrcom-20&linkId=ET7AID4TCBRNHOQT)
- Book - [Design Patterns in Ruby, by Russ Olsen](http://www.amazon.com/Design-Patterns-Ruby-Russ-Olsen/dp/0321490452)
