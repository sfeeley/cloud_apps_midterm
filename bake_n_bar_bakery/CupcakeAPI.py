import warnings

with warnings.catch_warnings():
    warnings.filterwarnings("ignore",category=DeprecationWarning)
    from bottle import *

import CupcakeServices as order_list

@get('/')
def get_sign_in():
    return template('sign-in.tpl')

@post('/sign-in')
def sign_in():
    email = request.POST.email.strip()
    password = request.POST.password.strip()

    user = order_list.sign_in(email, password)
    if user:
        if user['localId'] == "zzAiZ8m8jWNxjrqdin4BvynmDRx1":
            newOrders = order_list.get_orders_by_status("0")
            oldOrders = order_list.get_orders_by_status("1")

            return template('OrderPage.tpl', newOrders=newOrders, oldOrders=oldOrders)
        else:
            return template('sign-in-error.tpl')
    else:
        return "<h1>Invalid login. Please try again</h1>"

@get('/sign-out')
def sign_out():
    order_list.sign_out()
    return template('sign-in.tpl')

@post('/new-user')
def regiser():
    email = request.POST.email.strip()
    password = request.POST.password.strip()
    first_name = request.POST.first_name.strip()
    last_name = request.POST.last_name.strip()

    user = order_list.register(email, password, first_name, last_name)
    if user:
        return template('sign-in.tpl')
    else:
         return "<h1>Registration failed. Please try again</h1>"

@route('/orders')
@get('/order-list')
def get_order_list():
    newOrders = order_list.get_orders_by_status("0")
    oldOrders = order_list.get_orders_by_status("1")

    output = template('OrderPage.tpl', newOrders=newOrders, oldOrders=oldOrders)
    return output

@get('/test')
def test():
    newOrders = order_list.get_orders_by_status("0")
    

@get('/update-order/<id>')
def update_order_to_done(id):
    order_list.update_order(id)
    newOrders = order_list.get_orders_by_status("0")
    oldOrders = order_list.get_orders_by_status("1")
    
    output = template('OrderPage.tpl', newOrders=newOrders, oldOrders=oldOrders)
    return output



debug(True)
run(host='0.0.0.0', port=8080)