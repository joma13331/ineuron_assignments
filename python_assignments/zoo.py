import optuna
import xgboost as xgb

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split

from sklearn.metrics import accuracy_score, confusion_matrix, roc_auc_score, roc_curve

from sklearn.preprocessing import StandardScaler

wine_red_df = pd.read_csv("https://raw.githubusercontent.com/zygmuntz/wine-quality/master/winequality/winequality-red.csv", delimiter=";")

wine_red_df

feat_df = wine_red_df.drop(columns=["quality"])
y_df = wine_red_df["quality"]
y_df = pd.Categorical(y_df)

def objective(trial):
    x_train, x_test, y_train, y_test = train_test_split(feat_df, y_df, test_size=.20)
    
    params = {
        "tree_method": "gpu_hist",
        "verbosity": 3,
        "objective":"multi:softmax",
        "booster": trial.suggest_categorical("booster", ["dart", "gbtree", "gblinear"]),
        "lambda": trial.suggest_float("lambda",1e-4, 1),
        "alpha": trial.suggest_float("alpha",1e-4, 1),
        "subsample": trial.suggest_float("subsample",.1, .5),
        "colsample_bytree": trial.suggest_float("colsample_bytree",.1, .5)
    }
    
    if params["booster"] in ["dart", "gbtree"]:
        params["gamma"] = trial.suggest_float("gamma",1e-3, 4)
        params["eta"] = trial.suggest_float("eta",.001, 5)
    
    xgb_class = xgb.XGBClassifier(**params)
    xgb_class.fit(x_train, y_train, eval_set=[(x_test, y_test)], verbose=True)
    pred_xgb = xgb_class.predict(x_test)
    accuracy = xgb_class.score(x_test, y_test)
    return accuracy

find_param = optuna.create_study(direction='minimize')
find_param.optimize(objective, n_trials=100)
find_param.best_trial.params