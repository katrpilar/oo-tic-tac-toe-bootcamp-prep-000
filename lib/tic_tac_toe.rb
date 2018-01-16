class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num)
    num = num.to_i
    index = num - 1
  end
  
  def move(index,character="X")
    @board[index] = character
    return @board
  end
  
  def position_taken?(index)
    if @board.length == 0
      return
    elsif (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index)
        return false
      else 
        return true
      end
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    realindex = input_to_index(input)
    if valid_move?(board,realindex)
      move(board,realindex,current_player(board))
      display_board(board)
      #return turn(board)
    else
      return turn(board)
    end
  end

end