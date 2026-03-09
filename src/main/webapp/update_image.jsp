<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#form-details h1{
    font-size: 50px; 
    line-height: 64px;
    color:#530404;;

}
button.normal{
    font-size: 14px;
    font-weight: 300;
    padding: 10px 15px;
    color: #211912;
    background-color: #ffffff;
    border-radius: 4px;
    cursor: pointer;
    border: none;
    outline: none;
    transition: 0.2 ease;
    
    
}
button.normal:hover{
    color: #ffffff;
    background-color: #800000;
}
</style>
<title>Update Child Info</title>
</head>
<body><section id="form-details">
<h1>UPDATE CHILD INFORMATION</h1>
<form action="up_servlet" method="post" enctype="multipart/form-data">

    <label for="id">Child ID:</label>
    <input type="text" name="id" id="" required>

    <label for="name">Name of the child:</label>
    <input type="text" name="name" id="" required>

    <label for="image">Upload Image (if any):</label>
    <input type="file" name="image" id="">

    <label for="health">Health issues:</label>
    <input type="text" name="health" id="">

    <label for="diagnose">Diagnosed with:</label>
    <input type="text" name="diagnose" id="">

    <label for="treat">Treatments:</label>
    <input type="text" name="treat" id="">

    <label for="check">Last Checkup Date:</label>
    <input type="date" name="check" id="">

    <button class="normal" name="insert_product" id="insert_product" type="submit">Update Info</button>
</form></section>
</body>
</html>
