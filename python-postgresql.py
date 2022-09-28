import pg8000
from sqlalchemy import create_engine
def psql_connect():
  engine = create_engine('postgresql+pg8000://:@127.0.0.1:5410/spanner-pg',echo=True)
  tab = engine.execute('select tablename from pg_tables;')
  print(str([t[0] for t in tab]))
  return

def main():
    print("output")
    psql_connect()



if __name__ == "__main__":
    main()
    
    
