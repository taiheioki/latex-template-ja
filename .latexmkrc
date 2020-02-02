#!/usr/bin/env perl
@default_files = ('main.tex');

$log_wrap = 4096;
ensure_path('max_print_line', $log_wrap);
ensure_path('TEXINPUTS', './okicmd//');

$pdf_mode = 3;
$latex = 'uplatex -file-line-error -halt-on-error -interaction=nonstopmode -kanji=utf8 -synctex=1 %O %S';
$bibtex = 'upbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex_use = 1.5;
