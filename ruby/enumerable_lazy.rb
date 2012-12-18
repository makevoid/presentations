[1,2,3].each # => ...

[1,2,3].lazy

(1..Float::INFINITY).lazy
  .select(&:even?)
  .take(12)
  .force

# => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]

