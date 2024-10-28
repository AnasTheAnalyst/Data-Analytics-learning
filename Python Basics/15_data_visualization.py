# # points for graphics
# 1_Aesthetic(theme, color,shape,size)
# 2_mapping(data)
# 3_Geometric(Objects:Line,bar,points,Box,Map)   


# STEPS TO MAKE A COUNTPLOT

# step 1 import libraries

# from turtle import color
# import seaborn as sns
# import matplotlib.pyplot as plt
# import pandas as pd

# # step 2 set theme

# sns.set_theme(style="ticks", color_codes=True)

# # # step 3 import dataset (you can also import your own data)

# kashti = sns.load_dataset("titanic")
# print(kashti)

# # step_4 plot basic graph for 1 variable(countplot)

# # p = sns.countplot(x="sex",data=kashti)
# # plt.show()

# # step_4 plot basic graph for 2 variable(countplot for 2 variable)

# # p = sns.countplot(x="sex",data=kashti ,hue="class")
# # plt.show()

# # step_5 plot basic graph for 2 variable(countplot for 2 variable) use title

# p = sns.countplot(x="sex",data=kashti ,hue="class")
# p.set_title("anas ka count plot")
# plt.show()

 


#for categorical variables we make
# bar plot

# import seaborn as sns                           #import library  
# import matplotlib.pyplot as plt                  #import library
# sns.set_theme(style="ticks", color_codes=True)        #set theme (color,shape,size)
# titanic = sns.load_dataset("titanic")                  # set dataset
# print(titanic)
# sns.catplot(x='survived',y='sex',hue='class' ,kind='bar',data='titanic')        #(bar,points)
# plt.show()


# count plot

import seaborn as sns
import matplotlib.pyplot as plt

titanic = sns.load_dataset("titanic")
sns.set_theme(style="ticks",color_codes=True)
p1=sns.countplot(x='sex', data=titanic, hue='class')
p1.set_title("Plot for counting")
plt.show()

# for continous variable we make scatterplot
# scatterplot

# import seaborn as sns
# import matplotlib.pyplot as plt
# sns.set_theme(style="ticks",color_codes=True)
# titanic = sns.load_dataset("titanic")
# g=sns.FacetGrid(titanic,row="sex",hue="alone")
# g=(g.map(plt.scatter,"age","fare")).add_legend()
# plt.show()


# 

