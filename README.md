# Boggle 2 Word Checker

##Learning Competencies

##Summary

Using your basic `BoggleBoard` generator from before, we're now going to model a person checking whether a given word is on the Boggle board or not.

The only rule is that the same dice can't be reused in the same word, i.e., the "word path" can't ever cross itself.

We'll implement a `BoggleBoard#include?` method which works like this:

```ruby
board = BoggleBoard.new
board.shake!
board.include?("apple") # => true or false, depending
```

**Note**: This method won't care whether the input is *actually* a word in a dictionary. It will just tell your whether the string, as its input, is on the Boggle board.

## External Resources
* [Boggle on Wikipedia](http://en.wikipedia.org/wiki/Boggle)
* [Play Boggle online](http://www.wordplays.com/boggle)

## Learning Goals
* Model a simple real-world procedure in Ruby.
* Method definition, arguments, and return values
* Common string methods
* Simple algorithms and data structures

## Objectives

### Pseudocode for `BoggleBoard#include?`

Take a step back. Breathe. I know you want to jump right in and start writing code. But don't! It's a trap!

Get a pen and paper and draw out a 4-by-4 Boggle board. Imagine it filled with letters. Or actually fill it with letters if you like–maybe using your Boggle board generator.

Have your pair spell out a word for you and verify yourself whether its on the board. It might help if the word is gibberish and not English so that you're forced to check letter-by-letter and can short-circuit the English-reading part of your brain.

As clearly and precisely as you can reflect your internal mental process. Can you explain it to your pair? Draw it, verbalize it, or do whatever is easiest for you, but make sure you and your pair are clear about it.

Initially, let's do a simpler, less interesting version of Boggle. Instead of being able to string together letters that are connected in any direction, let's just focus on words that appear in a **continuous line** vertically, horizontally, and diagonally. (Remember, only words 3 or more letters count!)

Write pseudocode for your algorithm. If you're feeling adventurous, you and your pair could each write your own pseudocode and compare.

How do your stylistic approaches compare? Your respective vocabulary? The overall structure and strategy of your approach?

### Implement `BoggleBoard#include?` in Ruby

If you went through the exercise above, your job is now to just translate your pseudocode into Ruby.

What new instance methods do you need to define? Would your algorithm be easier to implement if your board were stored differently?

For example, what are the tradeoffs between storing the board as a 4x4 array of arrays versus a single 16-element array?

### Going Deeper (Extra Credit)

Now try implementing your algorithm for the real boggle rules! The words don't have to be in continuous lines, they can be connected in any way, diagonally, vertically, horizontally, in any order. IE. Words can snake themselves across the board willy-nilly.

What do you need to change to accommodate this added requirement? Does it make sense to change the structure of your board? Again, model this before coding, make sure you are aware of all the cases.

##Releases
###Release 0

##Optimize Your Learning

##Resources