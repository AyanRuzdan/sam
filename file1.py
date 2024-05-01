from datetime import date

today = date.today()

# print("Build run at:", today)
f = open("log_file.txt", "a")
f.write("Build run at:")
f.write(today)
f.close()