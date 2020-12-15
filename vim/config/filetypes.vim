au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.coffee.js set filetype=coffee
au BufRead,BufNewFile *.slim set filetype=slim

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile Capfile set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.pdf.prawn set filetype=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" add handlebars syntax highlighting
au BufNewFile,BufRead *.hbs set ft=handlebars

" add ftl syntax highlighting
au BufNewFile,BufRead *.ftl set ft=ftl

au BufNewFile,BufRead *.less set ft=less
au BufNewFile,BufRead *.jade set ft=jade
au BufNewFile,BufRead *.slim set ft=slim

au BufNewFile,BufRead *.swift set ft=swift

au BufNewFile,BufRead *.processing set ft=processing

" add typescript syntax highlighting
au BufNewFile,BufRead *.ts set ft=typescript
au BufNewFile,BufRead *.tsx set ft=typescriptreact
