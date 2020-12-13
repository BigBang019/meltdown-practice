import pandas as pd
from sklearn.svm import LinearSVC

TRAIN_PATH = './meltdown-practice/dataset/train.txt'
train_dataset = pd.read_csv(TRAIN_PATH)
print(train_dataset[:-1])
print(train_dataset['label'])
# X_train, X_test, y_train, y_test = train_test_split(, iris.target, test_size=0.4, random_state=0) 

# clf_svc = svm.SVC(kernel='linear').fit(X_train,y_train)
# clf_svc.score(X_test,y_test)