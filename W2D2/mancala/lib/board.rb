class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    @cups.each_index do |idx|
      if idx.between?(0,5) || idx.between?(7, 12)
        4.times {@cups[idx] += [:stone]}
      end
    end
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup += :stone
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
     stones = @cups[start_pos]
     @cups[start_pos] = []
     cup = start_pos
     until stones.empty?
       cup += 1
       cup = 0 if cup > 13
       if cup == 6
         @cups[6] << stones.pop if current_player_name == @name1
       elsif cup == 13
         @cups[13] << stones.pop if current_player_name == @name2
       else
         @cups[cup] << stones.pop
       end
     end

     render
     next_turn(cup)
   end

  def next_turn(ending_cup_idx)
   if ending_cup_idx == 6 || ending_cup_idx == 13
     :prompt
   elsif @cups[ending_cup_idx].count == 1
     :switch
   else
     ending_cup_idx
   end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
