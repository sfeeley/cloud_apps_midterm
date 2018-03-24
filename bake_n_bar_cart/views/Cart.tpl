<head>
    <title>Cupcake Order Form</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    @media only screen and (max-width: 500px) {
        body {
            width:90%;
        }

        body.option{
            font-size: .75em; 
        }

        table { 
            font-size: .75em; 
        }

    }
</style>

<body>
    <h1 class="w3-text-purple w3-center w3-wide" style="text-decoration: underline overline; font-family: 'Love Ya Like A Sister', cursive">Bake 'n Bar</h1>

    <div class="w3-card-4 w3-mobile w3-padding w3-margin">
        <header class="w3-container w3-gray">
            <h3>Your Order</h3>
        </header>

        <form action="/new-cupcake" method="post" id="cupcakeForm" class="w3-row w3-card-2 w3-margin">
            <div class="w3-quarter w3-container w3-margin">
                <select class="w3-select w3-margin-right" name="cake" form="cupcakeForm">
                    <option value="" disabled selected>Choose your cake</option>
                    <option value="Death By Chocolate">Death By Chocolate</option>
                    <option value="Eggnog">Eggnog</option>
                    <option value="Espresso Pound">Espresso Pound</option>
                    <option value="Ginger Bread">Ginger Bread</option>
                    <option value="Graham Cracker">Graham Cracker</option>
                    <option value="Grapefruit Olive Oil">Grapefruit Olive Oil</option>
                    <option value="Lemon Olive Oil">Lemon Olive Oil</option>
                    <option value="Maple Bacon">Maple Bacon</option>
                    <option value="Orange Olive Oil">Orange Olive Oil</option>
                    <option value="Tres Leches">Tres Leches</option>
                    <option value="Vanilla">Vanilla</option>
                    <option value="Lime Tequilla">Lime Tequilla</option>
                    <option value="Mexican Chocolate">Mexican Chocolate</option>
                    <option value="Blood Orange Olive Oil">Blood Orange Olive Oil</option>
                    <option value="Lemon Butter">Lemon Butter</option>
                    <option value="Chocolate Stout">Chocolate Stout</option>
                    <option value="Pumpkin">Pumpkin</option>
                    <option value="Salted Caramel">Salted Caramel</option>
                    <option value="Lemon Pound">Lemon Pound</option>
                </select>
            </div>
            <div class="w3-quarter w3-container w3-margin">
                <select class="w3-select w3-margin-right" name="frosting" form="cupcakeForm">
                    <option value="" disabled selected>Choose your frosting</option>
                    <option value="Whipped Cream">Whipped Cream</option>
                    <option value="Lemon Meringue">Lemon Meringue</option>
                    <option value="Marshmallow">Marshmallow</option>
                    <option value="Salted Carmel">Salted Carmel</option>
                    <option value="Citrus Whipped Cream">Citrus Whipped Cream</option>
                    <option value="Peanut Butter">Peanut Butter</option>
                    <option value="Maple Cream Cheese">Maple Cream Cheese</option>
                    <option value="Lime Tequilla">Lime Tequilla</option>
                    <option value="Honey">Honey</option>
                    <option value="Molases Cream Cheese">Molases Cream Cheese</option>
                    <option value="Vanilla">Vanilla</option>
                    <option value="Whipped Chocolate Genache">Whipped Chocolate Genache</option>
                    <option value="Italian Meringue">Italian Meringue</option>
                    <option value="Cinnamon">Cinnamon</option>
                    <option value="Strawberry Jam">Strawberry Jam</option>
                    <option value="Raspberry Jam">Raspberry Jam</option>
                    <option value="Irish Cream">Irish Cream</option>
                    <option value="Nutella">Nutella</option>
                    <option value="Red Wine">Red Wine</option>
                    <option value="Bourbon">Bourbon</option>
                </select>
            </div>
            <div class="w3-quarter w3-container w3-margin w3-margin-right">
                <input type="text" name="quantity" placeholder="How Many?"></input>
            </div>
            <input value="Add Cupcake" type="submit" class="w3-btn w3-round-large w3-purple w3-right w3-margin"></input>
        </form>
    <table class="w3-table-all w3-centered">
            <tr>
                <th>Cake Flavor</th>
                <th>Frosting Flavor</th>
                <th>Quantity</th>
                <th></th>
            </tr>
            %for order in cupcakeOrder:
            <tr>
                <td style="vertical-align:middle">
                    {{order['cake']}}
                </td>
                <td style="vertical-align:middle">
                    {{order['frosting']}}
                </td>
                <td style="vertical-align:middle">
                    {{order['quantity']}}
                </td>
                <td style="vertical-align:middle">
                    <a href="/delete-cupcake/{{order['cake']}}/{{order['frosting']}}/{{order['quantity']}}" class="w3-button w3-circle w3-purple w3-margin">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            %end
         </table>
         </div>
        

    <a href="/submit-order" class="w3-btn w3-round-large w3-purple w3-margin">Submit Order</a>

</body>


