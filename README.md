# fitLED
A function for performing curve fitting to estimate lethal fraction (LF) kinetics 

# Data Preparation

•	This function fits lethal fraction (LF) data over time at a given concentration to the lag exponential death model (LED) to quantify cell death kinetics (see Forcina et al. Cell Systems)

•	Make sure the ‘fitLED.m’ and ‘fitflat.m’ functions are in the same file directory (generally the current file path).

•	LF can be calculated by dividing the number of dead cells by the number of total cells in a given treatment condition

•	Dead cell numbers are over time are determined using SYTOX fluorescence values quantified using a fluorescence plate reader

•	Total cell numbers over time are determined using the fitGrowth function. 

•	Time points do not need to be in a sequential order and replicates do not need to be averaged


# fitLED structure

    fitLED(time,y_norm)

time – time points (in hours) for LF measurements in a column vector

y_norm – calculated LF that correspond to time points in ‘time’ in a column vector for a single concentration

# Running fitLED

•	Generate ‘time’ and ‘LF’ variables as described in fitLED structure.

•	To run the supplied example data (README-fitLED_Ex.mat):

     load README-fitGrowth_Ex.mat;

•	Quantification of cell death kinetics is achieved by fitting LF data over time to the LED model using the function fitLED:

    [fitresult, header] = fitLED(time,LF)

•	fitLED requires a column vector of time points and a column vector of corresponding LF values.  Each row can be a different time point or replicate.  fitLED returns the fitting results (fitresult) and the description of each column in fitresult (header)

•	The output of fitLED will include:

scatter_LF – contains the original data sent to fitLED (time,LF)
plot_LED – model predictions from LED fitting.  First column is time and second column is predicted LF values
y0 – baseline value (model parameter)
D0 – onset time  (model parameter)
Dr – maximal rate of death (model parameter)
Plateau – Maximal LF value (model parameter)
AUC – Area under the LF curve
Fit-type – model descriptor (LED or flat)



