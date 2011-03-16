"=============================================================================
" FILE: matcher_default.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 16 Mar 2011.
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

function! unite#filters#matcher_default#define()"{{{
  return s:matcher
endfunction"}}}

let s:matcher = {
      \ 'name' : 'matcher_default',
      \ 'description' : 'default matcher',
      \}

function! s:matcher.filter(candidates, context)"{{{
  let l:candidates = a:candidates
  for l:default in s:default_matchers
    let l:filter = unite#get_filters(l:default)
    if !empty(l:filter)
      let l:candidates = l:filter.filter(l:candidates, a:context)
    endif
  endfor

  return l:candidates
endfunction"}}}


let s:default_matchers = ['matcher_glob']
function! unite#filters#matcher_default#get()"{{{
  return s:default_matchers
endfunction"}}}
function! unite#filters#matcher_default#use(matchers)"{{{
  let s:default_matchers = a:matchers
endfunction"}}}

" vim: foldmethod=marker
