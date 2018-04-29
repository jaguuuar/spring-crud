<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>Groups</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>


  <script type="text/javascript">
  //auto expand textarea
  function adjust_textarea(h) {
      h.style.height = "20px";
      h.style.height = (h.scrollHeight)+"px";
  }
  </script>

<style>

form ul {
    list-style-type: none;
    margin-top: 0px;
}

form ul li { display: inline-block }
form { box-sizing: border-box; }

.add-group{
    font-family: 'Open Sans Condensed', arial, sans;
    width: auto;
    height: 40px;
    background: #4D4D4D;
}

}
.add-group input[type="text"],
.add-group input[type="date"],
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
    height: 45px;
}

.add-group input[type="button"],
.add-group input[type="submit"]{
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

.add-group input[type="button"]:hover,
.add-group input[type="submit"]:hover,
.w3-button:hover {
    background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
    background-color:#34CACA;
    text-decoration: none;
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
</head>
<body>

<table class="cinereousTable">
<thead>
<tr>
  <th>ID</th>
  <th>Name</th>
  <th>Action</th>
</tr>
</thead>
<tbody>
     <c:forEach var = "group" items = "${groups}">
    <tr>
      <td>${group.id}</td>
      <td>${group.name}</td>
      <td>
            <a class="w3-button" href="/group/view/${group.id}">View</a>
            <a class="w3-button" href="/group/delete/${group.id}">Delete</a>
            <a class="w3-button" href="/group/edit/${group.id}">Edit</a>
      </td>
    </tr>
    </c:forEach>
</tbody>
</table>

<div class="add-group">
    <form  method="post" action="/group/save">
        <ul>
        <li><input type="hidden" name="id" value=""/></li>
        <li><input type="text" name="name" placeholder="Group name" /></li>
        <li><input type="submit" value="Add group" /></li>
        </ul>
    </form>
</div>

</body>
</html>