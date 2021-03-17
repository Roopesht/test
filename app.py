
from flask import Flask
import os

app = Flask(__name__)
port=81
@app.route('/')
def index():
    return 'Web App with Python Flask! (new ver1)'

    

port=os.environ['port']
print ("port: ", port)
app.run(host='0.0.0.0', port=port)
