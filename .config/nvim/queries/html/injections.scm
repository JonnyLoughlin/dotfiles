(((text) @_a
  (#lua-match? @_a "^[{]+[ ]*.*[ ]*[}]*$")) @injection.content
  (#set! injection.language "gotmpl"))

