# Interleaving Arrays. Reprendre quand sais faire fonctions qui acceptent arbitrary number of arrays

=begin


Input: Array of arrays

Output: Array with all characters from arguments arrays, and maybe 1 or several nils if different sizes of arrays

Rules: Interleave the arrays in their order

Data

Algorithm


=end


def interleave()

end

p interleave([1, 2, 3], ["c", "d", "e"]) == [1, "c", 2, "d", 3, "e"]
p interleave([1, 2, 3], [4, 5]) == [1, 4, 2, 5, 3, nil]
p interleave([1, 2, 3], [4, 5, 6], [7, 8, 9]) == [1, 4, 7, 2, 5, 8, 3, 6, 9]
p interleave([]) == []
