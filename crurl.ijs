

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
 