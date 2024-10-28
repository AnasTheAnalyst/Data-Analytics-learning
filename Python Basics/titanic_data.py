# important point
# 1-no spaces in dataset



import pandas as pd

# import data from file
chilla = pd.read_csv("titanic.csv")
print(chilla)

import seaborn as sns
import matplotlib.pyplot as plt
sns.set_theme(style="ticks",color_codes=True)

p = sns.countplot(x="PassengerId",hue="Ticket", data=chilla)
plt.show()


