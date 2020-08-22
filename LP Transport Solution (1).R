# Clear workspace and load the lpSolve package
rm(list=ls())
require(lpSolve)

# Define the cost matrix
cost.mat = rbind(c(16,16,13,22,17),c(14,14,13,19,15),c(19,19,20,23,50),c(50,12,50,15,11))

# Define the supplies
row.signs = rep("<=",4)
row.rhs = c(50,60,50,50)

# Define the demands
col.signs = rep(">=",5)
col.rhs = c(30,20,70,30,60)

# Solve the transportation problem
result=lp.transport(cost.mat,direction="min",row.signs,row.rhs,col.signs,col.rhs)

# Prepare the results for visualization
optimal.assignment=result$solution
colnames(optimal.assignment)=c("Memphis","Milwaukee","New York City","Denver","San Francisco")
rownames(optimal.assignment)=c("Atlanta","Boston","Los Angeles","Dummy Supply")

result.table=rbind(c(result$objval,result$status))
colnames(result.table)=c("Optimal Total Cost","Status code (0 = successful)")
rownames(result.table)=c("Optimal solution")

# Print the result
optimal.assignment
result.table