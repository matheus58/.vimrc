call plug#begin()


Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

call plug#end()


" temas """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'sonokai'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

" C/C++ """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_c_clangformat_options = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 100,
\ AllowShortBlocksOnASingleLine: Always,
\ AllowShortFunctionsOnASingleLine: Inline,
\ FixNamespaceComments: true,
\ ReflowComments: false,
\ }"'


" Coc Snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug> <leader>(coc-convert-snippet)
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Coc Explorer """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets




" configurasoes globais  """"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Habilita a sintaxe de destaque
set nu               " Habilita a exibição de números de linha
set tabstop=4        " Mostra um espaço de 4 caracteres quando uma tabulação é pressionada
set softtabstop=4    " Mostra um espaço de 4 caracteres quando uma tabulação é pressionada
set shiftwidth=4     " Quando estiver recuando com '>', use 4 espaços
set expandtab        " Ao pressionar a tecla 'Tab', insira 4 espaços
set smarttab         " Insere tabulações no início de uma linha de acordo com o shiftwidth
set smartindent      " Insere automaticamente um nível extra de indentação em alguns casos
set hidden           " Esconde o buffer atual quando um novo arquivo é aberto
set incsearch        " Pesquisa incremental
set ignorecase       " Ignora maiúsculas e minúsculas na pesquisa
set smartcase        " Considera maiúsculas e minúsculas se houver um caractere em maiúsculo
set scrolloff=8      " Número mínimo de linhas a serem mantidas acima e abaixo do cursor
set colorcolumn=100  " Desenha uma linha na linha especificada para acompanhar o tamanho da linha
set signcolumn=yes   " Adiciona uma coluna à esquerda. Útil para linting
set cmdheight=2      " Dá mais espaço para exibir mensagens
set updatetime=100   " Tempo em milissegundos para considerar as alterações
set encoding=utf-8   " A codificação deve ser utf-8 para ativar os ícones de fonte
set nobackup         " Não crie arquivos de backup
set nowritebackup    " Não crie arquivos de backup
set splitright       " Cria divisões verticais à direita
set splitbelow       " Cria divisões horizontais abaixo
set autoread         " Atualiza o vim após a atualização do arquivo de fora
set mouse=a          " Habilita o suporte ao mouse
filetype on          " Detecta e define a opção do tipo de arquivo e ativa o evento FileType
filetype plugin on   " Carrega o arquivo de plug-in para o tipo de arquivo, se houver
filetype indent on   " Carrega o arquivo de indentação para o tipo de arquivo, se houver
let mapleader = "q"  "tecla lider

:set makeprg=gcc\ -Wall\ -o\ %<\ %



" atalhos """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap  <leader>p :PlugInstall<CR><Esc>
nnoremap <leader>e :CocCommand explorer <CR>
nnoremap <leader>w :w<CR>
nnoremap <C-q> :q<CR>
" nerd_tree""""""""
nnoremap <C-a> :NERDTreeToggle<CR>

"nnoremap <leader>n :NERDTreeFocus<CR>:  define <leader>n como atalho para mover o foco para o painel do NERDTree.
"nnoremap <C-n> :NERDTree<CR>: define <C-n>  como atalho para abrir o painel do NERDTree.
"nnoremap <C-t> :NERDTreeToggle<CR>:  define <C-t> como atalho para alternar a visibilidade do painel do NERDTree.
"nnoremap <C-f> :NERDTreeFind<CR>:  define <C-f> como atalho para encontrar um arquivo no painel do NERDTree.

" Atalho para abrir o Fugitive
nnoremap <leader>g :Git<CR>

" Atalhos para as funcionalidades do Fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>

"Adicionando uma linha vazia acima, abaixo e abaixo com inserção:
nmap op o<Esc>k
nmap oi O<Esc>j
nmap oo A<CR>

" Creaçao de teb
nmap te :tabe<CR>

" navegar entre os  buffers
nmap ty :bn<CR>
nmap tr :bp<CR>

" Deleta buffer
nmap td :bd<CR>

" Create splits
nmap th :split<CR>
nmap tv :vsplit<CR>

" Close splits and others
nmap tt :q<CR>

" ajilizar chamadas de comando no terminal
nmap tc :!
"navegasoa entre os split"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"auto_cmd"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'cpp':[],
\   'c':[],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\}

let g:ale_fix_on_save = 1

" COC """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-clangd', 'coc-css', 'coc-html',  'coc-tsserver']

" Pode ser necessário para o Vim (não para o Neovim), já que o coc.nvim calcula o deslocamento de byte por contagem de sequência de byte utf-8
set encoding=utf-8

" Alguns servidores têm problemas com arquivos de backup, consulte #649
set nobackup
set nowritebackup

" Ter um updatetime mais longo (o padrão é de 4000 ms = 4s) leva a atrasos perceptíveis e a uma experiência de usuário pobre
set updatetime=300

" Sempre mostrar a coluna de sinal, caso contrário, ela deslocaria o texto cada vez que os diagnósticos aparecessem/se tornassem resolvidos
set signcolumn=yes

" Use tab para acionar a conclusão com caracteres à frente e navegar
" NOTA: Sempre há um item completo selecionado por padrão, você pode querer habilitar
" sem seleção por `"suggest.noselect": true` no seu arquivo de configuração
" NOTA: Use o comando ':verbose imap <tab>' para garantir que a tecla Tab não esteja mapeada por
" outro plugin antes de colocá-lo em sua configuração
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Faça <CR> aceitar o item de conclusão selecionado ou notificar coc.nvim para formatar
" <C-g>u quebra o undo atual, por favor faça sua própria escolha
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> para acionar a conclusão
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` e `]g` para navegar nos diagnósticos
" Use `:CocDiagnostics` para obter todos os diagnósticos do buffer atual na lista de localizações
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navegação de código GoTo
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K para mostrar a documentação na janela de visualização
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

