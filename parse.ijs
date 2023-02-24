

parse=: verb define
:
NB. if json matches(-:) file type param 
if. 'json'-:x
  do.
    NB.decodes json data into boxed array, giving: 13 2$ of json data, last row is observations
    jsondata=:dec_pjson_ y
    NB.from last box of jsondata (observations, box of boxes(4 2$), take the second column (real start/end, date, val), and then drop real start/end
    NB.test=: >1{ {:jsondata
    lbldv=: 2}. each > 1{ {:jsondata
    NB. unboxes and looks vertical
    dateval=:1{"1 > lbldv
    dateval
NB. if xml matches (-:) file type param
elseif. 'xml'-:x
  do.
NB. need to parse the xml
    y
end.
)
