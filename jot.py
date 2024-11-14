import tkinter as tk
import math
import time


class SpinningCircle:
    def __init__(self, root, radius=50, dot_radius=5, num_dots=12, speed=50):
        self.root = root
        self.radius = radius
        self.dot_radius = dot_radius
        self.num_dots = num_dots
        self.speed = speed  # milliseconds delay between frames
        self.angle = 0  # initial angle
        self.canvas = tk.Canvas(root, width=2*radius+40, height=2*radius+40, bg='white')
        self.canvas.pack()
        self.dots = []
        self.cnt = 0
        self.create_dots()
        time.sleep(1)
        self.animate()


    def create_dots(self):
        """Create dots arranged in a circular pattern"""
        for i in range(self.num_dots):
            angle = (2 * math.pi / self.num_dots) * i
            x = self.radius * math.cos(angle) + self.radius + 20
            y = self.radius * math.sin(angle) + self.radius + 20
            dot = self.canvas.create_oval(
                x - self.dot_radius, y - self.dot_radius, 
                x + self.dot_radius, y + self.dot_radius, 
                fill="black"
            )
            self.dots.append(dot)

    def animate(self):
        """Animate the spinning circle by changing dot opacities in sequence"""
        self.angle = (self.angle + 1) % self.num_dots
        self.cnt += 1 
        
        for i, dot in enumerate(self.dots):
            # Adjust the dot's brightness based on its position in the circle
            brightness = 255 - int(200 * ((i - self.angle) % self.num_dots) / self.num_dots)
            color = f'#{brightness:02x}{brightness:02x}{brightness:02x}'
            self.canvas.itemconfig(dot, fill=color)
        
        self.root.after(self.speed, self.animate)

# Main application window
if __name__ == "__main__":
    root = tk.Tk()
    root.title("Code-Based Spinning Circle")
    app = SpinningCircle(root)
    root.mainloop()




# import itertools
# import sys
# import time

# # Characters to create a spinning circle
# spinner = itertools.cycle(['|', '/', '-', '\\'])

# def loading_animation(duration=5):
#     start_time = time.time()
#     while time.time() - start_time < duration:
#         sys.stdout.write('\r' + next(spinner))
#         sys.stdout.flush()
#         time.sleep(0.1)
#     # Reset the line after the animation is done
#     sys.stdout.write('\rDone!\n')

# # Run the loading animation for 5 seconds
# loading_animation(5)



# import os
# import dotenv 
# import pymssql

# dotenv.load_dotenv(".env")

# MSSQL_DB_SERVER = os.getenv('MSSQL_DB_SERVER')
# MSSQL_DB = os.getenv('MSSQL_DB')
# MSSQL_DB_USER = os.getenv('MSSQL_DB_USER')
# MSSQL_DB_PWD = os.getenv('MSSQL_DB_PWD')
# MSSQL_DB = os.getenv('MSSQL_DB')


# def exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, SQL_Command, mode): 
#     with pymssql.connect(server=MSSQL_DB_SERVER, database=MSSQL_DB, user=MSSQL_DB_USER,password=MSSQL_DB_PWD) as connection:
#         with connection.cursor() as cursor:
#             cursor.execute(SQL_Command)
#             if mode == 1:
#                 print(cursor.fetchall())
#             else:
#                 print(f'{sql} runs successfully!')
#                 connection.commit()
            

# sql = 'select * from stock_20220112'

# mode = 1 # mode 1 --> select , 2 --> update, delete, insert
# exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, sql, mode)





# # This is a package in preview.
# from azureml.opendatasets import NycTlcYellow

# from datetime import datetime
# from dateutil import parser


# end_date = parser.parse('2018-05-06')
# start_date = parser.parse('2018-05-01')
# nyc_tlc = NycTlcYellow(start_date=start_date, end_date=end_date)
# nyc_tlc_df = nyc_tlc.to_pandas_dataframe()

# nyc_tlc_df.info()


 