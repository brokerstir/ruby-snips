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
    foos = (FooBar.pluck(:random_num))
    def floor_it (bar); (bar/10).floor.to_i; end
    (0..floor_it(foos.max)).each {|n| counts[n] = 0 + (foos.select {|foo| floor_it(foo) == n }).count} ; counts
  end

end
