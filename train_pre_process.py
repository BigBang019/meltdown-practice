import os
import pandas as pd

from sklearn.utils import shuffle

PATH = "./meltdown-practice/samples"
MELTDOWN_PREFIX = "meltdown"
OUTPUT_PATH = "./meltdown-practice/dataset"
COLUMN_NAMES = ["PAPI_L3_TCM", "PAPI_STL_ICY", "PAPI_CA_SHR", "PAPI_BR_CN"]

# os.mkdir(OUTPUT_PATH)

filenames = []

for root, dirs, files in os.walk(PATH):
    for f in files:
        filenames.append(str(f))

final_df = None

for fn in filenames:
    df = pd.read_csv(os.path.join(PATH, fn), sep=",", names=COLUMN_NAMES)
    if fn.startswith(MELTDOWN_PREFIX):
        df['LABEL'] = 1
    else:
        df['LABEL'] = 0
    if final_df is None:
        final_df = df
    else:
        final_df = pd.concat([final_df, df])

final_df = shuffle(final_df)
final_df.to_csv(os.path.join(OUTPUT_PATH, 'train.txt'), index=False)