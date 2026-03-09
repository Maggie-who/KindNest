<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
<title>Register</title>
<style>
#form-details {
    display: flex;
    justify-content: space-between;
    margin: 100px;
    padding: 80px;
    border: 1px solid #a68080;
}
#form-details form {
    width: 65%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}
#form-details form input,
#form-details form textarea,
#form-details form select {
    width: 70%;
    padding: 12px 15px;
    outline: none;
    margin-bottom: 20px;
    border: 1px solid #a68080;
}
#form-details form button {
    background-color: #863636;
    color: #fff;
}
</style>
</head>
<body><section id="form-details"> <h1> To Register</h1>
 <form action="registerrah" method="post" >
                        <!--name-->
                        <label for="admin_name" style="color:beige">Name: </label>
                        <input type="text" name="name" id="product_title" placeholder="enter your name" autocomplete="off" required="req">
                       
                        <!--password-->
                        <label for="pass" style="color:beige">Password: </label>
                        <input type="password" name="pass" placeholder="set a strong password" id="price"  autocomplete="off" required="req">
                        
                        <!--button-->
                        <button class="normal"  id="">Submit</button>
                        <br>
                       
                    </form></section>
</body>
</html>