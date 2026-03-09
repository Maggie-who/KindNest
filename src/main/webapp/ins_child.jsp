<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
<title>Insert child details</title>
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
<body>
<section id="form-details">
<form action="ins_servlet" method="post" enctype="multipart/form-data">
<h2>INSERT CHILD DETAILS</h2><br><br>
            <!--title-->
            <label for="name">Name of the child:</label>
            <input type="text" name="name" id="product_title"  autocomplete="off" required="req">
            <!--description-->
            <label for="dob">Date of birth:</label>
            <input type="date" name="dob" id=""  autocomplete="off" required="req">
            
            <label for="place">Place found:</label>
            <input type="text" name="place" id="description"  autocomplete="on" required="req">
            
             <label for="gender">Gender:</label><br>
             <label for="female">Female</label>
             <input type="radio" id="female" name="gender" value="female">
             <br>
             <label for="male">Male</label><input type="radio" id="male" name="gender" value="male">
             <br><br>

            <!--key words-->
            <label for="keyword">Child keyword</label>
            <input type="text" name="keyword" id="keyword"  autocomplete="off" required="req">
            <!--select-->
            
                 <!--image -->
            <label for="image">Upload Image:</label>
    <input type="file" name="image" id="image">
            <!--price-->
            <label for="health">Health issues:</label>
            <input type="text" name="health" id="price"  autocomplete="off" >
            
            <label for="diagnose">Diagnosed with:</label>
            <input type="text" name="diagnose" id=""  autocomplete="off" >
            <br>
            <label for="treat">Treatments:</label>
            <input type="text" name="treat" id=""  autocomplete="off" >
            
            <label for="check">Last Checkup:</label>
            <input type="date" name="check" id=""  autocomplete="off" >
            
            <!--button-->
            <button class="normal" name="insert_product" id="insert_product">Submit</button>
        </form></section>
</body>
</html>