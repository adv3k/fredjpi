require 'j903-user/projects/fredjpi/fredjpi.ijs'
require 'j903-user/projects/fredjpi/stats.ijs'
require'plot'
require'j903-user/projects/fredjpi/calcforregress.ijs'
require'debug/dissect'

NB. test params
NB. add functionality to put in multiple series at once, ex) 'GDP GNPCA SP500'
test=:getseriesobs 'GDP';'json';'2001-01-31';'2023-01-31';'100000';'0';'asc';'lin';'a'
NB.2 chg/\ 1{"1 test
NB.2 \ >1{"1 test
NB.datatype each >1{"1 test
NB.numdata=:2 [\ makenum 1{"1 test
yh=:y_hat test
b=:yh
pd'reset'
W=:i.#test
g=:}."1 test

fk=:(;/1+i.#test),.(}."1 test)
