# Data-Visualization-with-R

I used the networkD3 package in R to visualize the vendor relationships .
This package provides an interface to D3 in java, and it can support two kinds
of organizational charts: The Hyperbolic Tree Chart and the Diagonal Network
Chart. However, it requires a JSON-like input list that describes the
hierarchical relationships. Hence, I developed a code to convert the input data
frame to a JSON-like list by using the unique, append and strsplit function in
R.


**Figure 1. Hyperbolic Tree Chart (Left) and Diagonal Network Chart (Right)**

<img width=450px height=300px src="https://github.com/yipinlyu/Data-Visualization-wth-R/blob/master/demo5.png"></img> 
<img width=450px height=300px src="https://github.com/yipinlyu/Data-Visualization-wth-R/blob/master/demo4.png"></img> 
As Fig. 1 shows, the Hyperbolic Tree Chart gives us an excellent overall
picture, while the Diagonal Network Chart clearly illustrate the hierarchical
relationships. Notice that in this case, the node A has two supervisors. But we
can still visualize the two relationships independently. Therefore, even if we
have four or five levels, this method can still work efficiently to visualize
the vendor relationships correctly.

**Reference**

[1] 	Gandrud,C. Allaire, JJ. Russell,K. and Yetman, CJ. (2017, March 18). networkD3: D3 JavaScript Network Graphs from R. Retrived from http://christophergandrud.github.io/networkD3/.
