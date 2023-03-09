require 'web/gethttp'
require 'convert/pjson'
require 'tables/dsv'
NB. expat docs https://github.com/jsoftware/api_expat
require 'api/expat'
coinsert 'jexpat'
require 'j9.4-user/projects/fredjpi/crurl.ijs'
require 'j9.4-user/projects/fredjpi/parse.ijs'


NB. figure out how to work env variable
APIKEY=:''
NB. create modules (split up into files), get multiple series in one call, start stats/lin reg package w/ json
NB. params (series id**, file type, start, end, limit, offset, sort order, units, frequency
NB. returns 2 _ $ matrix
getseriesobsdateval=: monad define
NB.retrieves file data from FREDAPI
data=: gethttp url y
NB.parses data by either json or xml
parsed=:parse data
NB. transforms literals to nums
)
