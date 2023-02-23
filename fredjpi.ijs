require 'web/gethttp'
require 'convert/pjson'
require 'tables/dsv'
NB. expat docs https://github.com/jsoftware/api_expat
require 'api/expat'
coinsert 'jexpat'


NB. figure out how to work env variable
APIKEY=:'a167f84b32adacebe5fd055960294a6b'

NB. create modules (split up into files), get multiple series in one call, start stats/lin reg package w/ json


url=: monad define
NB. **only required parameter is series id, can be found when searching through the FRED series database (typically next to name of series)
NB. default param definitions
NB. additional options for parameters can be found at https://fred.stlouisfed.org/docs/api/fred/series_observations.html   PS. Realtime is always default

ftype=:'json'
obsstart=:'1776-07-04'
obsend=:'9999-12-31'
limit=:'100000'
offset=:'0'
sorto=:'asc'
units=:'lin'
freq=:''
NB. read notes under frequency on FREDAPI page, errors come from asking for higher frequency than series is
NB. shows up as an index error, ex) asking for daily values of GDP, where the highest frequency is quarterly
NB. series id
if. 1=#y
  do.
    id=: y
NB. series id, file type
elseif. 2=#y
  do.
    id=: >0{y
    ftype=:>1{y
NB. series, file type, start, end
elseif. 4=#y
  do.
    id=: >0{y
    ftype=: >1{y
    obsstart=: >2{y
    obsend=: >3{y
elseif. 5=#y
  do.
    id=: >0{y
    ftype=: >1{y
    obsstart=: >2{y
    obsend=: >3{y
    freq=:>4{y
NB. all are defined
else.
  id=: >0{y
  ftype=: >1{y
  obsstart=: >2{y
  obsend=: >3{y
  limit=:>4{y
  offset=:>5{y
  sorto=:>6{y
  units=:>7{y
NB. use try/catch to test if an error is thrown using the given frequency
  freq=:>8{y
end.

; 'https://api.stlouisfed.org/fred/series/observations?series_id=';id;'&api_key=';APIKEY;'&file_type=';ftype;'&observation_start=';obsstart;'&observation_end=';obsend;'&limit=';limit;'&offset=';offset;'&sort_order=';sorto;'&units=';units;'&frequency=';freq
)
 

NB. params (series id**, file type, start, end, limit, offset, sort order, units, frequency
getseriesobs=: monad define
NB.retrieves file data
data=: gethttp url y

NB. if json matches(-:) file type param 
if. 'json'-:>1{y
  do.
    NB.decodes json data into boxed array, giving: 13 2$ of json data, last row is observations
    jsondata=:dec_pjson_ data
    NB.from last box of jsondata (observations, box of boxes(4 2$), take the second column (real start/end, date, val), and then drop real start/end
    lbldateval=:2}. each > 1{ {:jsondata
NB.
    dateval=:1{"1 > lbldateval
    dateval
NB. if xml matches (-:) file type param
elseif. 'xml'-:>1{y
  do.
NB. need to parse the xml
    data
end.
)

NB. test params
NB. add functionality to put in multiple series at once, ex) 'GDP GNPCA SP500'
getseriesobs 'GDP';'json';'2000-01-31';'2023-01-31';'100000';'0';'asc';'lin';'q'
