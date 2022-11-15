from collections import Counter
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats

mydata = pd.read_csv('vgsales.csv')
df = mydata
# print(df.head())
# print("--------------------------------------------------")
print(df.describe())
# ("--------------------------------------------------")
# print(df.loc[: , "JP_Sales"])
# ("--------------------------------------------------")
# print(df.loc[: , "JP_Sales"].mean())
# ("--------------------------------------------------")
# print(Counter(df.loc[: , "Genre"]))
# ("--------------------------------------------------")
# df["Global_Sales"].hist()
# df["Global_Sales"].plot(kind='density')
# df_temp = df.set_index('Year', inplace=False)
# df_temp['Global_Sales'].plot(legend=True, marker='.', linestyle='none')
# df['Global_Sales'].plot(kind='box')
# sns.set(rc={'figure.figsize':(11.7, 8.27)})
# sns.boxplot(x='Genre', y='EU_Sales', data=df)
# plt.show()
# df_gs_action = df["Global_Sales"][df["Genre"]== "Action"]
# var = np.var(df_gs_action)
# df_gs_action = df["Global_Sales"][df["Genre"]== "Sports"]
# var = np.var(df_gs_action)
# print(var)
# shapiro_test = stats.shapiro(df["Global_Sales"][df["Genre"] == "Adventure"])
shapiro_test = stats.shapiro(df["Global_Sales"][df["Genre"] == "Strategy"])
print(shapiro_test)

