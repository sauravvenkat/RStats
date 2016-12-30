CompanyData <- (readxl::read_excel('CompanyData.xlsx'))
CompanyData <- CompanyData[-c(14), ]
CompanyData


Actual <- CompanyData$Actual
Actual <- as.numeric(Actual)
Actual <- as.matrix(Actual)



Budgeted <- CompanyData$Budgeted
Budgeted <- as.numeric(Budgeted)
Budgeted <- as.matrix(Budgeted)

for(i in 1:length(Budgeted)){
  Budgeted[i][1] <- Budgeted[i][1] - Actual[i][1]
}

Budgeted <- as.numeric(Budgeted)
Actual <- as.numeric(Actual)
Budgeted
Actual

ActualBudgeted <- rbind(Budgeted, Actual)

ActualBudgeted

Names <- CompanyData$Quarters
Names
length(Names)
Names

barplot(ActualBudgeted, xlab='Quarters', ylab='Amount($)',main='Actual vs Budgeted By Quarter', col=c('darkgray', 'red'))
text(1:13, par("usr")[1], labels=CompanyData$Quarters, srt=60, pos=2, xpd=TRUE, cex=0.6)

legend("topleft", inset=.02, c('Actual', 'Budgeted'), fill=c('red', 'darkgray'), horiz=FALSE, cex=0.8)




