<head>
    <title>Cupcake Order Form</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">

<style>
    @media only screen and (max-width: 320px) {

    table { 
        font-size: .5em; 
        width: 75%;
        overflow-x:auto;
    }

    }
</style>

<body>
     <a href="/sign-out" class="w3-btn w3-round-large w3-purple w3-right w3-margin w3-display-topright">Sign Out</a>

    <h1 class="w3-text-purple w3-center w3-wide" style="text-decoration: underline overline; font-family: 'Love Ya Like A Sister', cursive">Bake 'n Bar</h1>

        <div class="w3-container w3-cell w3-half w3-margin-bottom">
            <div class="w3-card-4">
                <header class="w3-container w3-gray">
                    <h3>Orders To Be Fulfilled</h3>
                </header>
            
                <table class="w3-table" style="overflow-x:auto;">
                    <tr>
                        <th>Email</th>
                        <th>Order</th>
                        <th>Fulfilled</th>
                    </tr>
                    %for order in newOrders:
                        <tr>
                            <td>{{order[1]['email']}}</td>
                            <td>
                                <table>
                                    <tr>
                                        <th>Cake</th>
                                        <th>Frosting</th>
                                        <th>Quantity</th>
                                    </tr>
                                %for cupcake in order[1]['cupcakes']:
                                    <tr>
                                    <td>{{cupcake['cake']}}</td>
                                    <td>{{cupcake['frosting']}}</td>
                                    <td>{{cupcake['quantity']}}</td>
                                    </tr>
                                %end
                                </table>
                            </td>
                            <td><a href="/update-order/{{order[0]}}" class="w3-btn w3-circle w3-teal">&#10004;</a></td>
                        </tr>
                    %end
                </table>
        
            </div>
        </div>
        <div class="w3-container w3-cell w3-half">
            <div class="w3-card-4">
                <header class="w3-container w3-gray">
                    <h3>Finished Orders</h3>
                </header>

                <table class="w3-table">
                    <tr>
                        <th>Email</th>
                        <th>Order</th>
                    </tr>
                    %for order in oldOrders:
                        <tr>
                            <td>{{order[1]['email']}}</td>
                            <td>
                                <table>
                                    <tr>
                                        <th>Cake</th>
                                        <th>Frosting</th>
                                        <th>Quantity</th>
                                    </tr>
                                %for cupcake in order[1]['cupcakes']:
                                    <tr>
                                    <td>{{cupcake['cake']}}</td>
                                    <td>{{cupcake['frosting']}}</td>
                                    <td>{{cupcake['quantity']}}</td>
                                    </tr>
                                %end
                                </table>
                            </td>
                        </tr>
                    %end
                </table>
            </div>
        </div>
</body>