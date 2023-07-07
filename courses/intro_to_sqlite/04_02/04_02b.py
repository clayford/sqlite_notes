
import sqlite3

conn = sqlite3.connect("Chinook_Learning_Sqlite.sqlite")

cur = conn.cursor()

results = cur.execute("SELECT Name FROM Genre")

[row[0] for row in results]

import pandas as pd

df = pd.read_sql("SELECT * FROM Genre", conn)

df.head(10)

df.to_sql("Genre2", conn)
