
<%@page import="demo.web.app.authentication.AuthorizationManager"%>
<%@page import="net.web.app.senior.bll.SeniorBLGateWay"%>
<%@page import="net.web.app.senior.beans.CityBean"%>
<%@page import=" static net.web.app.senior.dal.DBConnectionManager.*"%>
<%@page import="net.web.app.senior.dal.entity.CityEntity"%>
<%@page import="net.web.app.senior.dal.repo.CityRepo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage City</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/app_style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/app_script.js"></script>
        <script type="text/javascript">
        </script>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>City</b></h2>
                        </div>

                        <div class="col-sm-6">
                            <a href="find_City.html" class="btn btn-success" > <span>Logout</span></a>
                            <a href="find_City.html" class="btn btn-success" > <span>Back</span></a>
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New City</span></a>
                        </div>
                    </div>

                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>City Id</th>
                            <th>City Name In Arabic</th>
                            <th>City Name In English</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%!
                            private final SeniorBLGateWay gateWay = new SeniorBLGateWay();
                            private final AuthorizationManager authManager = new AuthorizationManager();
                            String cityName = null;
                            List<CityBean> cityList = null;
                        %>
                        <%
                            /*if (!authManager.isAuthorized(request)) {
                                response.sendRedirect("Login.jsp");
                            }*/

                            cityName = request.getParameter("cityName");
                            if (cityName != null) {
                                cityList = gateWay.searchCityByName(cityName);
                            } else {
                                cityList = gateWay.findCityList();
                            }
                            for (CityBean city : cityList) {
                        %>
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>
                                <a href="ViewCity.jsp?id=<%= city.getId()%>">
                                    <%= city.getId()%>
                                </a>
                            </td>
                            <td><%= city.getNameAr()%></td>
                            <td><%= city.getNameEn()%></td>
                            <td>
                                <a href="UpdateCity.jsp?id=<%=city.getId()%>">
                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                </a>
                                <a href="DeleteCurrentCity?delete_id=<%= city.getId()%>" class="delete" data-toggle="modal"
                                   onclick="if (confirm('Confirm Remove <%= city.getNameAr()%> ?')) {
                                               return true;
                                           } else {
                                               return false;
                                           }">
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </a>                                        
                            </td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b><%=cityList.size()%></b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addNewCity" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New City</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>City Name In Arabic</label>
                                <input type="text" name="nameAr" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>City Name In English</label>
                                <input type="text" name="nameEn" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="UpdateCity">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit City</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div hidden="" class="form-group">
                                <label>City ID</label>
                                <input type="text" name="city_id" value="" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>City Name In Arabic</label>
                                <input type="text" name="nameAr" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>City Name In English</label>
                                <input type="text"  name="nameEn" class="form-control" required>
                            </div>					
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>                                		       