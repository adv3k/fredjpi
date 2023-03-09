require'debug/dissect'

parse=: 3 : 0
NB.decodes json data into boxed array, giving: 13 2$ of json data, last row is observations
jsondata=:dec_pjson_ y
NB. (right to left) grabs last box from jsondata (observations)
NB.	          removes the observation label, and unboxes, leaves box of boxes
NB.		removes both realtime dates (first each)
NB. 		removes the date/value labels (second each
NB.		turns 1 size 2 1 shaped array into size 2 shaped array
dv=:,/"1 >{. }."1 each 2}."2 each >}. {: jsondata

NB. right side (turns literal values into numbers)
NB. left side (turns literal dates into numbers) (do 
(". -.&'-'"1 >{."1 dv),.(makenum ,}."1 dv)
)