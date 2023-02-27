
NB. took partial derivative w/ respect to B_0:
NB. 	dS/dB_0 +/(y_i - B_0 - B_1*x_i)^2 to get B_0 = y_bar - B_1x_bar
NB. then took partial der. w/ respect to B_1:
NB. 	got (+/(x_i*y_i) - 1%n(+/y_i*+/x_i))%(+/x_i^2 - 1%n*(+/x_i)^2
NB.       cov(x,y) will calculate the numerator
NB.       var(x) will calculate the denominator
NB. formula is based off https://stats.stackexchange.com/questions/133554/least-squares-calculus-to-find-residual-minimizers

NB. (+/(x_i*y_i) - 1%n(+/y_i*+/x_i)
NB. 
cov=: 3 : 0
NB. takes in date;value array and transforms into x;f(x) (basically index;value)
xyd=: (;/1+i.#y),.(}."1 y)
sumxtimesy=:+/((>_1}."1 xyd) * (>}."1 xyd))  NB. sum(x_i*y_i)
oneoverntimessumxsumy=:(1%#xyd)*(+/>}."1 xyd)*(+/>_1}."1 xyd) NB.1%n(sum(y_i)*sum(x_i))
sumxtimesy-oneoverntimessumxsumy
)

var=: 3 : 0
sumxsquare=:+/((1+i.#y)^2)  NB. sum of x_i^2
squaresumxdividen=:(1%#y)*((+/(1+i.#y))^2) NB. 1%n times (sum x)^2
sumxsquare-squaresumxdividen
) 

bta_1=: 3 : 0
NB. passes full matrix(x,y) to cov, passes vector(y) to var
(cov y)%(var y)
)


NB. why is my Beta 0 calculation 16000, rather than 10-ish
bta_0=: 3 : 0
y_bar=:(+/ % #) >}."1 y
x_bar=:(+/ % #) 1+i.#y
NB.y_bar-bta_1*x_bar NB. beta_0 = y_bar - beta_1*x_bar\
x_bar
)

NB. returns array of y_hat stitched with x_i
y_hat=: 3 : 0
NB.(bta_0 y)+((bta_1 y)* (i.#y))
bt1=:{.,bta_1 y
bt0=:{.,bta_0 y
x_i=:1+i.#y
bt0+bt1*x_i
)

ssd=: 3 : 0
y_h=:y_hat y
y_r=: >,}."1 y
y_h
)

require 'j903-user/projects/fredjpi/fredjpi.ijs'
test=:getseriesobs 'GDP';'json';'2001-01-31';'2023-01-31';'100000';'0';'asc';'lin';'a'
bta_0 test
NB. sumxtimesy=4.74556e6
NB. oneoverntimessuumxsumy=4.19969e6
