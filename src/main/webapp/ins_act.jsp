<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
<title>Activity Insertion</title><style>
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
<body><section id="form-details"> <h1>INCLUDE ACTIVITY</h1>
    <form action="insact" method="post" enctype="multipart/form-data">
        <!-- Title -->
        <label for="title">Title of the event:</label>
        <input type="text" name="title" id="product_title" autocomplete="off" required>

         <label for="description">Description:</label>
<textarea name="description" id="description" rows="4" cols="50"></textarea><br><br>
         
        <!-- Date -->
        <label for="date">Date of the event:</label>
        <input type="date" name="date" autocomplete="off" required>

        <!-- Description -->
        


        <!-- Image Upload -->
        <label for="image">Upload Image:</label>
        <input type="file" name="image" id="image" required>

        <!-- Submit Button -->
        <button class="normal" name="insert_product" id="insert_product">Submit</button>
    </form></section>
</body>
</html>
