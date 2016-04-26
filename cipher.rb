# Shifts a series of characters a specific number of times.
def cipher(text, displace)
  result = ""

  text.each_char { |char| result << shift(char, displace) }

  return result
end

# Shifts a character a specific number of times.
def shift(char, displace)
  whole_nums = ('0'..'9').to_a
  caps       = ('A'..'Z').to_a
  smalls     = ('a'..'z').to_a
  result     = ""

  if whole_nums.include?(char)
    result = move(char, whole_nums, displace)
  elsif caps.include?(char)
    result = move(char, caps, displace)
  elsif smalls.include?(char)
    result = move(char, smalls, displace)
  else
    result = char
  end

  return result
end

# Shifts a character a specific number of times in a specific set.
def move(char, set, displace)
  start = set.index(char)
  offset = (start + 1) + displace
  count = 0

  set.cycle do |c|
    count += 1
    if count == offset
      return c
    end
  end
end
