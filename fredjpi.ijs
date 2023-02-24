require 'web/gethttp'
require 'convert/pjson'
require 'tables/dsv'
NB. expat docs https://github.com/jsoftware/api_expat
require 'api/expat'
coinsert 'jexpat'
require 'c:/users/bplec/j903-user/projects/genericfredjpi/crurl.ijs'
require 'c:/users/bplec/j903-user/projects/genericfredjpi/parse.ijs'


NB. figure out how to work env variable
APIKEY=:'a167f84b32adacebe5fd055960294a6b'
NB. create modules (split up into files), get multiple series in one call, start stats/lin reg package w/ json

NB. params (series id**, file type, start, end, limit, offset, sort order, units, frequency
NB. returns 2 _ $ matrix
getseriesobs=: monad define
NB.retrieves file data from FREDAPI
data=: gethttp url y

NB.parses data by either json or xml
(>1{y) parse data
)
