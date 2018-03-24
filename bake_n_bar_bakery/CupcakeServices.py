import pyrebase
import re

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

def register(email, password, first_name, last_name):
    user = auth.create_user_with_email_and_password(email, password)
    full_name =  str(first_name) + " " + str(last_name)
    data = {"name": full_name}
    results = db.child("users").push(data, user['idToken'])
    user = auth.sign_in_with_email_and_password(email, password)
    return user

def get_orders():
    all_orders = list(db.child("orders").get().each())
    for order in all_orders:
        order = order.val()
    return all_orders

def get_orders_by_status(value):
    orders = list(db.child("orders").get().each())
    order_list = list()
    for order in orders:
        if order.val()['status'] == value:
            item = (str(order.key()), order.val())
            order_list.append(item)
    return order_list

def update_order(id):
    db.child("orders").child(id).update({"status": "1"})

def sign_out():
    global user
    user = None