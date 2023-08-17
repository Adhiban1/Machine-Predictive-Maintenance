from model import is_failure, failure_type
import pandas as pd
from sklearn.metrics import accuracy_score

df = pd.read_csv('predictive_maintenance.csv')

is_failure_score = accuracy_score(is_failure(df), df.Target)
failure_type_score = accuracy_score(failure_type(df), df['Failure Type'])

print(f'{is_failure_score = }')
print(f'{failure_type_score = }')