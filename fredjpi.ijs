require 'web/gethttp'
require 'convert/json'

APIKEY=: 'a167f84b32adacebe5fd055960294a6b'


NB. params(Boxed Strings: (0)content=ex)series/observations, (1)id=ex)GDP, (2)ftype='json'

getdata=: monad define

NB. takes each parameter out of its box
content=: >0{y
id=: >1{y
ftype=: >2{y

NB. generalize this url creation, allow for use of all parameters, optionals?defaults?
url=:; 'https://api.stlouisfed.org/fred/';content;'?series_id=';id;'&api_key=';APIKEY;'&file_type=';ftype

data=: gethttp url
)

NB. test params
getdata 'series/observations';'GNPCA';'json'
