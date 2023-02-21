require 'web/gethttp'
require 'convert/pjson'
require 'tables/dsv'
NB. expat docs https://github.com/jsoftware/api_expat
require 'api/expat'
install_jexpat_''
coinsert 'jexpat'


APIKEY=: 'a167f84b32adacebe5fd055960294a6b'


NB. params(series_id(required), file_type='json', observation_start='1776-07-04', observation_end='9999-12-31', limit=100000, offset=0, sort_order='asc', units='lin', 

getseriesobs=: monad define
NB. default param definitions
ftype=:'json'
obsstart=:'1776-07-04'
obsend=:'9999-12-31'
limit=:'100000'
offset=:'0'
sorto=:'asc'
units=:'lin'

NB. when id is defined
if. 1=#y
  do.
    id=: y
NB. when id and ftype are defined
elseif. 2=#y
  do.
    id=: >0{y
    ftype=:>1{y
NB. id, ftype, start and end are defined
elseif. 4=#y
  do.
    id=: >0{y
    ftype=: >1{y
    obsstart=: >2{y
    obsend=: >3{y
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
end.


NB. generalize this url creation, allow for use of all parameters, optionals?defaults?
url=:; 'https://api.stlouisfed.org/fred/series/observations?series_id=';id;'&api_key=';APIKEY;'&file_type=';ftype;'&observation_start=';obsstart;'&observation_end=';obsend;'&limit=';limit;'&offset=';offset;'&sort_order=';sorto;'&units=';units NB.;'&frequency=sa'
NB.retrieves file data
data=: gethttp url
NB.below needs to be in an if statement to allow for xml or json
if. 'json'-:ftype
  do.
    NB.decodes json data into boxed array, giving: real start/end, obs start/end, units, output type, filetype, order_by, sort_by, count_offset, limit, and observations (last boxed arra)
    jsondata=:dec_pjson_ data
    NB.from last box of jsondata (observations, box of boxes(4 2$), take the second column (real start/end, date, val), and then drop real start/end
    lbldateval=:2}. each > 1{ {:jsondata
NB.
    dateval=:1{"1 > lbldateval
    dateval
elseif. 'xml'-:ftype
  do.
    expat_parse_xml data
end.
)

NB. test params
getseriesobs 'GNPCA';'xml';'1980-01-31';'2023-01-31'
