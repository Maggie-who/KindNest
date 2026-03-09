<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <body>
    <section id="hero">
       
        <div class="container">
            
            <video autoplay loop muted plays-inline class="backy">
                <source src="vdo/v4.mp4" type="video/mp4">
            </video><div class="logo"><img src="vdo/logo/1.png" alt="Logo" height="150" width="150"></div>
            <div class="content">
                
                <h1>KIND-NEST</h1>
                <h2>Login</h2>
                <h4>Warm Greetings!!</h4>
            
                
                <p>Give, Love, Hope.    Support Makes Change</p>
                <div class="container form-details">
                    <form action="loginservlet" method="post" >
                        <!--name-->
                        <label for="admin_name" style="color:beige">Name: </label>
                        <input type="text" name="name" id="product_title" placeholder="enter the name" autocomplete="off" required="req">
                       
                        <!--password-->
                        <label for="pass" style="color:beige">Password: </label>
                        <input type="password" name="pass" id="price"  autocomplete="off" required="req">
                        
                        <!--button-->
                        <button class="normal"  id="">Submit</button>
                        <br>
    <div style="width: 150%; text-align: right; margin-top: 20px; position: relative;">
    <a href="register_user.jsp" style="color: white; text-decoration: none; position: absolute; right: 0;">
        Register now
    </a>
</div>



                    </form>
                    
                    </div>
                   
            </div>
           
        </div>
      
    </section>
    
</body>

</html> 