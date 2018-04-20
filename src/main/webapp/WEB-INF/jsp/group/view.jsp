<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>SpringBoot</title>
<style>


h1, h2 {
    background: #4D4D4D;
    text-transform: uppercase;
    font-family: 'Open Sans Condensed', sans-serif;
    color: #797979;
    font-size: 18px;
    font-weight: 100;
    padding: 5px;
    margin: 0;
}

form ul { list-style-type: none; }
form ul li { display: inline-block }

.join-group {
    font-family: 'Open Sans Condensed', arial, sans;
    width: auto;
    height: 40px;
    margin-top: -20px;
    background: #4D4D4D;

}

}
.join-group input[type="text"],
.join-group input[type="date"],
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

.join-group input[type="button"],
.join-group input[type="submit"]{
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
    position: absolute;
    left: 450px;
    text-decoration: none;
    text-transform: uppercase;
}

.join-group form select {
    height: 30px;
    width: 200%;
}


.back-button {
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

.join-group input[type="button"]:hover,
.join-group input[type="submit"]:hover,
.w3-button:hover,
.back-button:hover {
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

<h1>Group details</h1>
 <table class="cinereousTable">
  <tbody>
      <tr>
        <th>ID</th>
        <td>${group.id}</td>
      </tr>
      <tr>
         <th>Group name</th>
         <td>${group.name}</td>
      </tr>
  </tbody>
 </table>

 <h2>Group members</h2>
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
        <c:forEach var = "user" items = "${group.usersList}">
       <tr>
         <td>${user.id}</td>
         <td>${user.userName}</td>
         <td>${user.password}</td>
         <td>${user.firstName}</td>
         <td>${user.lastName}</td>
         <td>${user.birthDate}</td>
         <td>
             <a class="w3-button" href="/group/view/${group.id}/remove/${user.id}">Remove</a>
         </td>
       </tr>
       </c:forEach>
  </tbody>
  </table>

 <div class="join-group">
     <form method="post" action="/group/view/${group.id}/add">
         <ul>
         <li><input type="hidden" name="groupId" value="${group.id}"/></li>
         <li>
               <select name="userId">
                  <c:forEach var = "user" items = "${allUsers}">
                        <c:if test="${!group.usersList.contains(user)}">
                           <option value="${user.id}">${user.userName}</option>
                        </c:if>
                 </c:forEach>
               </select>
          </li>
         <input type="submit" value="Add" />
         </ul>
     </form>
 </div>

 <a class="back-button" href="/group">Back</a>
</body>
</html>