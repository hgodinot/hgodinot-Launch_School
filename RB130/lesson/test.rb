p [2, 3, 5].inject(1, &:+)
[2, 3, 5].inject(1) { |total, num| total + num }