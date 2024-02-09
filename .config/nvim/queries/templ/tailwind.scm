; inherits: html

(attribute
 (attribute_name) @_name (#eq? @_name "class")
 (expression
    (binary_expression
      (interpreted_string_literal) @tailwind (#offset! @tailwind 0 2 0 -2))))

(short_var_declaration 
  (expression_list 
    (identifier) @var (#eq? @var "class"))
  (expression_list
    (interpreted_string_literal) @tailwind (#offset! @tailwind 0 2 0 -2)))

(expression_list
  (binary_expression
    (identifier) @var (#eq? @var "class")
    (interpreted_string_literal) @tailwind (#offset! @tailwind 0 2 0 -2)))
