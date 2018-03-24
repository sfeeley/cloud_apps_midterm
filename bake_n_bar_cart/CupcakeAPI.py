import warnings

with warnings.catch_warnings():
    warnings.filterwarnings("ignore",category=DeprecationWarning)
    from bottle import *

import CupcakeServices as order_list

@error(500)
def sign_in_error(error):
    return template('sign-in-error.tpl')

@get('/')
def get_sign_in():
    return template('sign-in.tpl')

@post('/sign-in')
def sign_in():
    email = request.POST.email.strip()
    password = request.POST.password.strip()

    user = order_list.sign_in(email, password)
    if user:  
        cupcakeOrder = order_list.get_cupcakes()
        return template('Cart.tpl', cupcakeOrder=cupcakeOrder)
    else:
        return template('sign-in-error.tpl')

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
        return template('sign-in-error.tpl')

@post('/new-cupcake')
def add_cupcake():
    cake = request.POST.cake.strip()
    frosting = request.POST.frosting.strip()
    quantity = request.POST.quantity.strip()

    order_list.save_cupcake(cake, frosting, quantity)
    cupcakeOrder = order_list.get_cupcakes()

    return template('Cart.tpl', cupcakeOrder=cupcakeOrder)

@get('/delete-cupcake/<cake>/<frosting>/<quantity>')
def delete_cupcake(cake, frosting, quantity):
    order_list.delete_cupcake(cake, frosting, quantity)
    cupcakeOrder = order_list.get_cupcakes()
    return template('Cart.tpl', cupcakeOrder=cupcakeOrder)

@get('/submit-order')
def submit_order():
    order_list.submit_order()
    cupcakeOrder = order_list.get_cupcakes()
    return template('Cart.tpl', cupcakeOrder=cupcakeOrder)





run(host='0.0.0.0', port=8080)