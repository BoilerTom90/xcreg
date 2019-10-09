<?php 

require_once('includes/checkLogin.inc.php'); // session is started in here
require_once('includes/head.inc.php');
require_once('includes/adminusercheck.inc.php');

?>


<body>

<?php 
require_once('includes/navbar.inc.php'); 
OutputNavBar("Schools");
?>

<br/>
<div class="container">
    <div class="row">
        <div class="col-xs-3"></div>
        <div class="col-xs-6">
            <div class="btn-group">
                <a class="btn btn-primary" href="SchoolsMain.php">Cancel</a>
            </div>
        </div>
    </div>
    <div class="row"></br></div>
</div>
<div class="container-fluid"></div><div class="container">
    <div class="row">
        <div class="col-xs-3"></div>
        <div class="col-xs-6 col-md-offsetx-7">
            <div class="panel panel-primary">
                <div class="panel-heading"> <strong class="">Printable Listing</strong>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="post" 
                            target="_blank"
                            action="SchoolsPrintHandler.php">
                        <div class="form-group">
                            <label for="event_name" class="col-sm-2 control-label">Event</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="event_name" 
                                    value="<?php echo PHPSession::Instance()->GetSessionVariable('event_name'); ?>" 
                                    id="event_name" 
                                    disabled>
                            </div>
                        </div>
                		<hr/>
                        <div class="form-group last">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="button" value="print" class="btn btn-primary btn-md">Print</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-xs-3"></div>
    </div>
</div>

<?php 
require_once('includes/footer.inc.php'); 
?>