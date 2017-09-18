

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"">
        <title>Tech-X</title>

        <script src="js/jquery-2.1.3.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

        <link rel="icon"       type="image/png" href="images/tab_icon.ico">
        <link rel="stylesheet" type="text/css"  href="css/extra.css">
        <link rel="stylesheet" type="text/css"  href="css/graph.css">
        <link rel="stylesheet" type="text/css"  href="css/sidebar.css">     
        <link rel="stylesheet" type ="text/css" href="css/right-sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css"  href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    </head>
    <body  background="images/bckg.jpg">

        <div id="wrapper">
            
            <!--This adds the banner on the right side-->
            <div id="right-sidebar-wrapper"></div>
            
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="query.jsp">Query</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="http://k34.kn3.net/D/9/0/B/6/F/1ED.gif" target="_blank"><img src="images/hammer.ico" height="25" width="25"/></a>

                </ul>
            </div>
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header"align="center" >Tech-X Analyzer</h1>

                    <!--Here we have a message about our app-->
                    <div class="col-md-8 col-md-offset-2">
                        <!--The index classes are there for the css file, which makes the text appear to be centered.-->
                        <p class="index">
                            Welcome to the Tech-X Analyzer. We are working to determine the
                            impact of technology access on student success in the state of
                            Virginia. To get started, navigate to the Help section for more 
                            information on how to use this tool.
                        </p>
                        <p class="index">
                            Shown in the Query section are a few tabs containing graphs. The SOL tab shows a bar chart with the
                            average SOL test scores in the selected division. The Funding tab shows a line graph
                            of the Funding per Student in the State and selected division starting in 2011, when the VPSA Technology and
                            e-Learning Backpack Initiative Grants began. These grants are investments by the state towards implementing general technology in public education.
                            The Internet Access tab shows another line graph showing the  percentage of Internet access per Household in the state and selected division.
                            The data represented in these graphs can help education providers determine a relation between technology access and student
                            success in the state and each individual division.
                        </p>
                        <p class="index">
                            All data used for this project was provided by the <a href="http://www.doe.virginia.gov" target="_blank">Virginia
                                Department of Education</a> (VDOE) and obtained from the <a href="https://www.fcc.gov/" target="_blank">Federal
                                Communications Commission</a> (FCC). Visit their websites for more information.
                        </p>
                        <p class="index">
                            This project was sponsored by the <a href="http://vlds.virginia.gov/" target="_blank">Virginia
                                Data Longitudinal System</a> (VLDS). Visit their website for more information.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </body>


</html>

