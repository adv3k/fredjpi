require 'fredjpi.ijs'
require 'stats.ijs'
require'plot'
require'debug/dissect'

NB. test params
NB. add functionality to put in multiple series at once, ex) 'GDP GNPCA SP500'
test=:getseriesobs 'DCOILWTICO';'json';'2001-01-31';'2023-01-31';'100000';'0';'asc';'lin';'d'
NB.2 chg/\ 1{"1 test
NB.2 \ >1{"1 test
NB.datatype each >1{"1 test
NB.numdata=:2 [\ makenum 1{"1 test

pctchg test

