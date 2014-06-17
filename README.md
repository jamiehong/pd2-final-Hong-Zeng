pd2-final-Hong-Zeng
==============

Dots.
A recreation of the mobile game, Dots. 
[Might be easier to download the app and play the real version than to read this description]

  There's a grid of 6x6 dots, each with one of 5 different colors. The player is to connect dots by clicking and dragging. Only contiguous(up,down,left,right) dots of the same color can be selected and cleared. If you create a square, or connect the string of dots back to itself, you clear all the dots on the board with that same color. If your hand twitches and you mess up by going the wrong direction, you can trace back with your mouse[made possible by the use of a linked list sorta thing where Dots have a variable "prev" which points to the preceding dot]. Your goal is to clear as many dots as you can in 60 seconds.
  
  This recreation works pretty much the same as the mobile app. The only notable difference is the fact that this game does not have any drop down animations. Implementation of dropping animations were attempted, but it became too complicated. There's no start button or pause button, and only the 60s timed mode is available.


HOW TO RUN
1) Clone the repo.
2) Go into the "Game" folder.
3) Open "Game.pde" with processing. (Board.pde and Dot.pde should open as well.. in different tabs of the processing window)
4) Press the play button in the processing window. [game starts immediately so...]
