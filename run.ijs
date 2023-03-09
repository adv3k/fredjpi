require 'j9.4-user/projects/fredjpi/fredjpi.ijs'
require 'j9.4-user/projects/fredjpi/stats.ijs'
require 'j9.4-user/projects/fredjpi/parse.ijs'
require'plot'
require'debug/dissect'

NB. test params
NB. add functionality to put in multiple series at once, ex) 'GDP GNPCA SP500'
test=:getseriesobsdateval 'GDP';'2001-01-31';'2023-01-31';'100000';'0';'asc';'lin';'a'

NB.(y_hat test),.(>,}."1 test)
NB.(>,}."1 test),.(y_hat test)
NB.(y_hat test),.(>,}."1 test)
NB.(}."1) 2}."2 >>}. {: test
NB.,/"1 }."1 each 2}."2 each >}. {: test

pps=: 9!:11
pps 9
ssd test