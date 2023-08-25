import os
import pickle
import pandas as pd
from imblearn.over_sampling import SMOTE
from sklearn.ensemble import RandomForestClassifier

df = pd.read_csv('predictive_maintenance.csv')
df1 = pd.get_dummies(df, columns=['Type'])
df1[['Type_H', 'Type_L', 'Type_M']] = df1[['Type_H', 'Type_L', 'Type_M']].astype(int)

X = df1[['Air temperature [K]', 'Process temperature [K]',
       'Rotational speed [rpm]', 'Torque [Nm]', 'Tool wear [min]',
       'Type_H', 'Type_L', 'Type_M']]
y = df1.Target

smote = SMOTE()
X_smote, y_smote = smote.fit_resample(X, y)

best_model = RandomForestClassifier(n_estimators=300, verbose=2)
best_model.fit(X_smote, y_smote)

if not os.path.exists('models'):
    os.mkdir('models')

if not os.path.exists('uploaded'):
    os.mkdir('uploaded')

with open('models/is_failure.pkl', 'wb') as f:
    pickle.dump(best_model, f)

X = df1[['Air temperature [K]', 'Process temperature [K]',
       'Rotational speed [rpm]', 'Torque [Nm]', 'Tool wear [min]',
       'Type_H', 'Type_L', 'Type_M']]
y = df1['Failure Type']

labelEncoding = {j:i for i,j in enumerate(y.unique())}
inverse = {j:i for i,j in labelEncoding.items()}
y = y.map(labelEncoding)

smote = SMOTE()
X_smote, y_smote = smote.fit_resample(X, y)

best_model = RandomForestClassifier(n_estimators=300, verbose=2)
best_model.fit(X_smote, y_smote)

with open('models/failure_type.pkl', 'wb') as f:
    pickle.dump(best_model, f)

with open('models/encoding.pkl', 'wb') as f:
    pickle.dump(inverse, f)
