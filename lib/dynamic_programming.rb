class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {
      1 => [[1]],
      2 => [[1,1],[2]],
      3 => [[1,1,1], [2,1], [1,2], [3]]
    }
    @super_cache = {
      1 =>[[1]]
    }
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?

    ans = blair_nums(n-2) + blair_nums(n-1)+(((n-1)*2)-1)
    @blair_cache[n] = ans
    return ans

  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1,1],[2]],
      3 => [[1,1,1], [2,1], [1,2], [3]]
    }
    return cache if n < 4
    (4..n).each do |i|
      minus_1 = cache[i-1].map{|way| way + [1]}
      minus_2 = cache[i-2].map{|way| way + [2]}
      minus_3 = cache[i-3].map{|way| way + [3]}
      cache[i] = minus_1 + minus_2 + minus_3
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] unless @frog_cache[n].nil?
    cache_1 = frog_hops_top_down(n-1).map {|way| way + [1] }
    cache_2 = frog_hops_top_down(n-2).map {|way| way + [2] }
    cache_3 = frog_hops_top_down(n-3).map {|way| way + [3] }
    @frog_cache[n] = cache_1 + cache_2 + cache_3
    @frog_cache[n]
  end

  def super_frog_hops(n, k)
    return @super_cache[n] if @super_cache[n]

    moves = []
    1.upto(k) do |i|
      if n - i > 0
        moves.concat super_frog_hops(n - i, k).map {|steps| steps + [i]}
      end
    end
    if n <= k
      moves << [n]
    end
    @super_cache[n] = moves
    moves
  end

  def knapsack(weights, values, capacity)
    
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)

  end
end
