<head>
    <title>Cupcake Order Form</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">

<body>
    <h1 class="w3-text-purple w3-center w3-wide" style="text-decoration: underline overline; font-family: 'Love Ya Like A Sister', cursive">Bake 'n Bar</h1>

    <div class="w3-panel" style="text-align:center">
        <h2>This is an invalid log-in.</h2>
        
        <form action="/new-user" method="post" class="w3-row w3-card-2 w3-margin w3-padding">
            <p>If you are a new user, please register below.</p>
            <header class="w3-container w3-blue w3-margin-bottom">
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
        <a href="/sign-out" class="w3-btn w3-round-large w3-purple w3-right w3-margin">Return to Log In</a>
    </div> 
    
</body>


