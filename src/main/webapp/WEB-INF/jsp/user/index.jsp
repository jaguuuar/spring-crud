<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>Users</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

<style type="text/css">

form ul { list-style-type: none; }
form ul li { display: inline-block }
form { box-sizing: border-box; }

.add-user{
    font-family: 'Open Sans Condensed', arial, sans;
    width: auto;
    height: 40px;
    background: #4D4D4D;
}

}
.add-user input[type="text"],
.add-user input[type="date"],
{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    outline: none;
    display: block;
    width: 100%;
    padding: 7px;
    border: none;
    border-bottom: 1px solid #ddd;
    background: transparent;
    margin-bottom: 10px;
    font: 16px Arial, Helvetica, sans-serif;
    width: auto;
    height: 32px;

}

.add-user input[type="button"],
.add-user input[type="submit"]{
    -moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    -webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    box-shadow: inset 0px 1px 0px 0px #45D6D6;
    background: -moz-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    background: -webkit-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    background: linear-gradient(to bottom, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    border: 1px solid #27A0A0;
    display: inline-block;
    cursor: pointer;
    color: #FFFFFF;
    font-family: 'Open Sans Condensed', sans-serif;
    font-size: 14px;
    padding: 8px 18px;
    text-decoration: none;
    text-transform: uppercase;
}

.w3-button {
    -moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    -webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
    box-shadow: inset 0px 1px 0px 0px #45D6D6;
    background: -moz-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    background: -webkit-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    background: linear-gradient(to bottom, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
    border: 1px solid #27A0A0;
    display: inline-block;
    cursor: pointer;
    color: #FFFFFF;
    font-family: 'Open Sans Condensed', sans-serif;
    font-size: 10px;
    padding: 5px 12px;
    text-decoration: none;
    text-transform: uppercase;
}

.add-user input[type="button"]:hover,
.add-user input[type="submit"]:hover,
.w3-button:hover {
    background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
    background-color:#34CACA;
    text-decoration: none;
}

input {
    width: auto;
    height: 30px;
}

table.cinereousTable {
  font-family: Verdana, Geneva, sans-serif;
  border: 6px solid #4D4D4D;
  background-color: #FFE3C6;
  width: 100%;
  height: 200%;
  text-align: center;
}
table.cinereousTable td, table.cinereousTable th {
  border: 1px solid #4D4D4D;
  padding: 4px 4px;
}
table.cinereousTable tbody td {
  font-size: 13px;
}
table.cinereousTable thead {
  background: #4D4D4D;
  background: -moz-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
  background: -webkit-linear-gradient(top, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
  background: linear-gradient(to bottom, #afa396 0%, #4D4D4D 66%, #4D4D4D 100%);
}
table.cinereousTable thead th {
  font-size: 18px;
  font-weight: bold;
  color: #F0F0F0;
  text-align: center;
  border-left: 1px solid #4D4D4D;
}
table.cinereousTable thead th:first-child {
  border-left: none;
}

table.cinereousTable tfoot td {
  font-size: 16px;
}

</style>

  <script type="text/javascript">
  //auto expand textarea
  function adjust_textarea(h) {
      h.style.height = "20px";
      h.style.height = (h.scrollHeight)+"px";
  }
  </script>


</head>
<body>

<table class="cinereousTable">
<thead>
<tr>
    <th>ID</th>
    <th>User name</th>
    <th>Password</th>
    <th>First name</th>
    <th>Last name</th>
    <th>Date of birth</th>
    <th>Action</th>
</tr>
</thead>
<tbody>
<c:forEach var = "user" items = "${users}">
  <tr>
    <td>${user.id}</td>
    <td>${user.userName}</td>
    <td>${user.password}</td>
    <td>${user.firstName}</td>
    <td>${user.lastName}</td>
    <td>${user.birthDate}</td>
    <td>
        <a class="w3-button" href="/user/view/${user.id}">View</a>
        <a class="w3-button" href="/user/delete/${user.id}">Delete</a>
        <a class="w3-button" href="/user/edit/${user.id}">Edit</a>
    </td>
  </tr>
  </c:forEach>
</tbody>
</table>

<div class="add-user">
    <form  method="post" action="/user/save">
        <ul>
        <li><input type="hidden" name="id" value=""/></li>
        <li><input type="text" name="user_name" placeholder="User name" /></li>
        <li><input type="text" name="password" placeholder="Password" /></li>
        <li><input type="text" name="first_name" placeholder="First name" /></li>
        <li><input type="text" name="last_name" placeholder="Last name" /></li>
        <li><input type="date" name="date_of_birth" placeholder="Date of birth"/></li>
        <li><input type="submit" value="Add user" /></li>
        </ul>
    </form>
</div>

</body>
</html>

