#!/usr/bin/env perl
@default_files = ('main.tex');

$log_wrap = 4096;
ensure_path('max_print_line', $log_wrap);
ensure_path('TEXINPUTS', './okicmd//', './biblatex-japanese//');

$pdf_mode = 3;
$latex = 'uplatex -file-line-error -halt-on-error -interaction=nonstopmode -kanji=utf8 -synctex=1 %O %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex_use = 1.5;
