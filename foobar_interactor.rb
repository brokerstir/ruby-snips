# this class assumes a FooBar model with columns id and random_num
# call class from ruby console
class FooBarInteractor
  
  def make_new_record(max = 100)
    random = FooBar.new(random_num: Random.rand(max)).save
  end

  def average_all_records
    avg = (FooBar.sum(:random_num) / FooBar.count).round(2)
  end

  def debug_foobars
  	FooBar.all.each do |foo|
      puts "#{foo.id} - #{foo.random_num}"
    end 
  end

  def clear_all_records
  	FooBar.delete_all
  end

  def compare_randoms_to_number(int)
    bools = []
    FooBar.all.each do |foo|
      if foo.random_num > int
        bools.push(true)
      else
      	bools.push(false)
      end
    end 
    bools
  end

  def count_by_digit 
    counts = {}
    
    zeros = FooBar.where(["random_num >= ? and random_num < ?", 0, 10]).count
    if zeros > 0
      counts[0] = zeros
    end

    ones = FooBar.where(["random_num >= ? and random_num < ?", 10, 20]).count
    if ones > 0
      counts[1] = ones
    end

    twos = FooBar.where(["random_num >= ? and random_num < ?", 20, 30]).count
    if twos > 0
      counts[2] = twos
    end

    threes = FooBar.where(["random_num >= ? and random_num < ?", 30, 40]).count
    if threes > 0
      counts[3] = threes
    end

    fours = FooBar.where(["random_num >= ? and random_num < ?", 40, 50]).count
    if fours > 0
      counts[4] = fours
    end

    fives = FooBar.where(["random_num >= ? and random_num < ?", 50, 60]).count
    if fives > 0
      counts[5] = fives
    end

    sixes = FooBar.where(["random_num >= ? and random_num < ?", 60, 70]).count
    if sixes > 0
      counts[6] = sixes
    end

    sevens = FooBar.where(["random_num >= ? and random_num < ?", 70, 80]).count
    if sevens > 0
      counts[7] = sevens
    end

    eights = FooBar.where(["random_num >= ? and random_num < ?", 80, 90]).count
    if eights > 0
      counts[8] = eights
    end

    nines = FooBar.where(["random_num >= ? and random_num < ?", 90, 100]).count
    if nines > 0
      counts[9] = nines
    end
    counts
  end

end