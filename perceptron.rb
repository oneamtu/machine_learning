s = [[Vector[1, 1, 1], 1], [Vector[1, 0, 0], 1], [Vector[0, 0, 1], -1]]

class Vector
  def to_s
    "(#{to_a.join("\\ ")})"
  end
end

def per(s)
  puts "S &= \\{\\\\"
  s.each.with_index do |(x, y), i|
    puts "&(x_#{i} = #{x}, y_#{i} = #{y}),\\\\"
  end
  puts "\\}\\\\"

  puts "w^0 &= (0\ 0\ 0)\\\\"
  w = Vector[*[0] * s[0][0].size]
  j = 0
  begin
    mistakes = 0
    s.each.with_index do |(x, y), i|
      res = y*w.dot(x)
      if res <= 0
        puts "y_#{i}\\langle w^#{j}, x_#{i}\\rangle  &= (#{y})\\langle #{w}, #{x}\\rangle  = #{res} \\leq 0 \\Rightarrow w^#{j+1} = #{w} + (#{y})#{x} = #{w + y*x}\\\\"

        w += y*x
        mistakes += 1
        j += 1
      else
        puts "y_#{i}\\langle w^#{j}, x_#{i}\\rangle  &= (#{y})\\langle #{w}, #{x}\\rangle  = #{res} > 0\\\\"
      end
    end
  end until mistakes == 0

  w
end
