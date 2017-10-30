# TabuSearch
2017 Intelligent Manufacturing Systems(IMS) Homework3

According to the example code (IMS Course TA:ChinYiTseng), I modify some place to fit the assignment requirement.
I modify the tabu size and the  iteration number as default value 2 and 100. And change the dataset p,d,w(Processing time, due date, weights) as the Table1.
The number of jobs depend on the p array size at dim(dimension) 2.Finally, I change the data presentation arrangement.


The assignment requirement as below:
Please use Excel VBA or Matlab (MUST use one of them, other languages are not allowed) to answer the following questions. Provide your code and justify your answer. Show all your work in detail including specific algorithm and parameter design. You should hand in TWO files (one for Tabu and one for Genetic Algorithm) regarding to each meta-heuristic algorithm, respectively. The result should include optimal solution (i.e., job sequence), optimal function (i.e. fitness) value, running time, average tardiness, number of tardy jobs. For the parameter settings (eg. tabu size, crossover rate, mutation rate, etc.), please give a simple design of experiment for sensitivity analysis.

So I chooose the Matlab to answer the following questions(Single-Machine Scheduling Problem)
Please answer following single-machine total weighted tardiness problem.
The objective function is to minimize the total weighted tardiness.
|Jobs|Processing Time|Due Date|Weights|
| ----- | ----- | ----- | ----- |
|1|10|50|10|
|2|10|38|5|
|3|13|49|1|
|4|4|12|5|
|5|9|20|10|
|6|4|105|1|
|7|8|73|5|
|8|15|45|10|
|9|7|6|5|
|10|1|64|1|
|11|9|15|5|
|12|3|6|10|
|13|15|92|10|
|14|9|43|5|
|15|11|78|1|
|16|6|21|10|
|17|5|15|5|
|18|14|50|5|
|19|18|150|1|
|20|3|99|5|
Table 1. The dataset for Single-Machine Scheduling Problem.

(a) Please use Tabu Search (TS) algorithm to solve the problem. Show your design and the “result”.
