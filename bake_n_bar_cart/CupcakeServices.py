import pyrebase
import re

class Cupcake:
    def __init__(self, cake, frosting, quantity):
        self.cake = cake
        self.frosting = frosting
        self.quantity = quantity

class Order:
    def __init__(self, email, cupcakes, status):
        self.email = email
        self.cupcakes = cupcakes
        self.status = status

config = {
   "apiKey": "AIzaSyBUnfE1hVilu9r43ldXZChS9vrnPV74xm8",
  "authDomain": "bake-n-bar.firebaseapp.com",
  "databaseURL": "https://bake-n-bar.firebaseio.com",
  "storageBucket": "bake-n-bar.appspot.com",
  "serviceAccount": "./credentials.json"
}

firebase = pyrebase.initialize_app(config)

auth = firebase.auth()

db = firebase.database()

cupcakeOrders = [ ]

user = None

def sign_in(email, password):
    global user 
    user = auth.sign_in_with_email_and_password(email, password)
    print(user)
    global cupcakeOrders
    cupcakeOrders = []
    return user

def sign_out():
    global user
    user = None

def register(email, password, first_name, last_name):
    user = auth.create_user_with_email_and_password(email, password)
    full_name =  str(first_name) + " " + str(last_name)
    data = {"name": full_name}
    results = db.child("users").push(data, user['idToken'])
    user = auth.sign_in_with_email_and_password(email, password)
    return user

def get_cupcakes():
    return cupcakeOrders

def save_cupcake(cake, frosting, quantity):
    quantity = re.sub("[^0-9]", "", quantity)
    if (cake!="" and frosting!="" and quantity!=""):
        cupcake = {"cake":cake, "frosting":frosting, "quantity":quantity}
        cupcakeOrders.append(cupcake)

def delete_cupcake(cake, frosting, quantity):
    cupcake = {"cake":cake, "frosting":frosting, "quantity":quantity}
    cupcakeOrders.remove(cupcake)

def submit_order():
    global cupcakeOrders
    if (len(cupcakeOrders) > 0):
        data = {"email": user['email'],"cupcakes": cupcakeOrders,"status": "0"}
        db.child("orders").push(data)
        
        cupcakeOrders = []