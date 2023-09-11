local o = vim.opt

-- line numbers
o.number = true
o.relativenumber = true

-- tabs and indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true

-- line wrapping
o.wrap = false

-- search
o.ignorecase = true -- ignore case by default
o.smartcase = true  -- if upper case letters are used in search, match the case

-- cursor line ### not sure about this!
o.cursorline = true

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")   -- this should make "yank" send to default clipboard

-- split (always split to the right and below)
o.splitright = true
o.splitbelow = true

-- keywords
o.iskeyword:append("-")  -- dashed words are considered one word
