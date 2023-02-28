NB. returns pct change from one data point to the next
chg=: 4 : 0
((y-x)%x)*100
)

NB. percent change between data points
NB. returns array of percentage points
NB. figure out how _ ".S:0 works
pctchg=: monad define
2 chg/\ _ ".S:0 {:"1 y
)
NB. ex usage: pct_change=:2 chg/\a
