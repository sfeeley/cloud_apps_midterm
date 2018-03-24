<head>
    <title>Cupcake Order Form</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">

<body>
    <h1 class="w3-text-purple w3-center w3-wide" style="text-decoration: underline overline; font-family: 'Love Ya Like A Sister', cursive">Bake 'n Bar</h1>

    <form action="/sign-in" method="post" class="w3-row w3-card-2 w3-margin">
        <header class="w3-container w3-blue">
            <h3>Existing User</h3>
        </header>
        <div style="vertical-align: middle">
            <input type="email" name="email" placeholder="email" class="w3-margin"></input>
            <input type="password" name="password" placeholder="password" class="w3-margin"></input>
            <input value="Sign In" type="submit" class="w3-btn w3-round-large w3-purple w3-right w3-margin"></input>
        </div>
    </form>

    <form action="/new-user" method="post" class="w3-row w3-card-2 w3-margin">
        <header class="w3-container w3-blue">
            <h3>New User</h3>
        </header>
        <div style="vertical-align: middle">
            <input type="text" name="first_name" placeholder="First Name" class="w3-margin"></input>
            <input type="text" name="last_name" placeholder="Last Name" class="w3-margin"></input>
            <input type="email" name="email" placeholder="email" class="w3-margin"></input>
            <input type="password" name="password" placeholder="password" class="w3-margin"></input>
            <input value="Register" type="submit" class="w3-btn w3-round-large w3-purple w3-right w3-margin"></input>
        </div>
    </form>

</body>


