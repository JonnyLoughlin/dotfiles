; inherits: html

(element
  (tag_start ) @attributes)

(element
  (tag_start
    (conditional_attribute_if_statement
      (conditional_attribute_block) @attributes)))

(element
  (self_closing_tag) @attributes)

(element
  (self_closing_tag
  (conditional_attribute_if_statement
    (conditional_attribute_block) @attributes)))
