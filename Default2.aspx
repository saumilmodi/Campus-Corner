<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>asdf</title>
<script  type="text/javascript"  src="scripts/jquery-1.4.1.min.js" ></script>
<script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
<script type="text/javascript" src="scripts/piecemaker/swfobject/swfobject.js"></script>
<script type="text/javascript">
    var flashvars = {};
    flashvars.cssSource = "scripts/piecemaker/piecemaker.css";
    flashvars.xmlSource = "scripts/piecemaker/piecemaker.xml";
    var params = {};
    params.play = "false";
    params.menu = "false";
    params.scale = "showall";
    params.wmode = "transparent";
    params.allowfullscreen = "true";
    params.allowscriptaccess = "sameDomain";
    params.allownetworking = "all";
    swfobject.embedSWF('scripts/piecemaker/piecemaker.swf', 'piecemaker', '960', '430', '10', null, flashvars, params, null);
</script>

</head>
<body>
    <div id="piecemaker"> 
    <img src="scripts/images/demo/piecemaker/home.jpg" alt=""  />
    </div>
</body>
</html>
