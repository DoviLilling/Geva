import requests as req
import sqlite3
import pandas as pd
import lxml


def get_flight_data():
    url = 'https://data.gov.il/api/3/action/datastore_search?resource_id=e83f763b-b7d7-479e-b172-ae981ddc6de5&limit=1000'
    response = req.post(url)
    response = response.json()['result']['records']
    return response


conn = sqlite3.connect('flights.db')

# flights = get_flight_data()
# df = pd.DataFrame(flights)
# df.to_sql('flight', conn, if_exists='replace')

df = pd.read_html('https://www.geonames.org/countries/')[1]
print(df)
df.to_sql('country', conn, if_exists='replace')
