<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tech-X</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="hw4-sol.css" rel="stylesheet" type="text/css">
        <link rel="icon"       type="image/png" href="images/tab_icon.ico">
        <link rel="stylesheet" type="text/css" href="css/extra.css">
        <link rel="stylesheet" type="text/css" href="css/graph.css">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type ="text/css" href="css/right-sidebar.css">
        <link rel="stylesheet" type="text/css" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="js/jquery-2.1.3.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

    </head>
    <body background="images/bckg.jpg">

        <div id="wrapper">
                        
            <!--This adds the banner on the right side-->
            <div id="right-sidebar-wrapper"></div>
            
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active"><a href="query.jsp">Query</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="http://k34.kn3.net/D/9/0/B/6/F/1ED.gif" target="_blank"><img src="images/hammer.ico" height="25" width="25"/></a>

                </ul>
            </div>
            <div id="page-content-wrapper">
                <div class='container-fluid' align="center">
                    <h1 class="page-header" align="center">Analyzation Tool</h1>
                    <form method="get">
                        <p>
                        <h3>Choose a Division:</h3>
                        </p>
                        <head>
                            <title>divsch.js example</title>
                            <script src="divsch.js"></script>
                            <style>
                                select {width: 225px;}
                            </style>
                        </head>
                        <body>

                            <select id="div_num" name="div_num" size="10">
                            </select>

                            <script>
                                // initialize drop-down lists
                                update_div();
                            </script>

                        </body>
                        <p>
                            <input type="submit">
                        </p>
                    </form>

                    <%
                        Query query = new Query(request);
                    %>

                    <script>
                        document.getElementById("div_num").value = "<%= query.div_num%>";
                    </script>

                    <!-- Tab pane for the charts   -->
                    <div class="container" style="width: 932px;">
                        <ul class="nav nav-tabs nav-justified">

                            <li class="active"><a data-toggle="tab" href="#sol_ch">SOL</a></li>
                            <li><a data-toggle="tab" href="#fun_ch">Funding</a></li>
                            <li><a data-toggle="tab" href="#don_ch">Internet Access</a></li>

                        </ul>

                        <div class="tab-content">

                            <div id="sol_ch" class="tab-pane fade in active">
                                <table border='1' cellpadding='3'>
                                    <tbody>
                                        <tr rowspan='12'><td><div id="chart_SOL_div" style="width: 900px; height: 500px;"></div></td></tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="fun_ch" class="tab-pane fade active">
                                <table border='1' cellpadding='3'>
                                    <tbody>
                                        <tr rowspan='12'><td><div id="chart_Fun_div" style="width: 900px; height: 500px;"></div></td></tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="don_ch" class="tab-pane fade active">
                                <table border='1' cellpadding='3'>
                                    <tbody>
                                        <tr rowspan='12'><td><div id="donutchart" style="width: 900px; height: 500px;"></div></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        // This selects two tabs, which in turn remove unneccessary scrolling
                        $('.nav-tabs a[href="#don_ch"]').tab('show');
                        $('.nav-tabs a[href="#sol_ch"]').tab('show');
                    </script>

                    <!--This is where the google chart scripts are imported-->
                    <%@ include file="WEB-INF/GoogleSegment.jspf" %>
                </div>
            </div>
        </div>
    </body>
</html>
