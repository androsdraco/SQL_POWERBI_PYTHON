import pandas as pd
import numpy as np

loan = pd.read_csv("Loan_data.csv")

loan_clean = loan.dropna(subset=['LoanAmount', 'Loan_Amount_Term', 'Credit_History']).bfill().copy()
