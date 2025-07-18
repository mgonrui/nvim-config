; extends
(declaration
  declarator: (identifier) @variable.declaration)

(declaration
  declarator: (init_declarator
    declarator: (identifier) @variable.declaration))

(declaration
  declarator: (pointer_declarator
    declarator: (_) @variable.declaration))
