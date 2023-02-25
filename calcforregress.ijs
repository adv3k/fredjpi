
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
xyd=: (;/i.#y),.(}."1 y)
sumxtimesy=:+/((>_1}."1 xyd) * (>}."1 xyd))  NB. sum(x_i*y_i)
avgytimessumx=:((+/>}."1 xyd)*(+/>_1}."1 xyd))%#xyd NB.1%n(sum(y_i)*sum(x_i))
sumxtimesy-avgytimessumx
)

var=: 3 : 0
sumxsquare=:+/((i.#y)^2)  NB. sum of x_i^2
squaresumxdividen=:(1%#y)*((+/(i.#y))^2) NB. 1%n times (sum x)^2
sumxsquare-squaresumxdividen
)

bta_1=: 3 : 0
NB. passes full matrix(x,y) to cov, passes vector(y) to var
(cov y)%(var y)
)

bta_0=: 3 : 0
y_bar=:(+/ % #) >}."1 y
x_bar=:(+/ % #) i.#y
y_bar-bta_1*x_bar NB. beta_0 = y_bar - beta_1*x_bar
)

NB. returns array of y_hat stitched with x_i
y_hat=: 3 : 0
NB.(bta_0 y)+((bta_1 y)* (i.#y))
bt1=:{.,bta_1 y
bt0=:{.,bta_0 y
x_i=:i.#y
bt0+(bt1*x_i)
)
