<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <!-- ************************** slider *****************************-->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>
        <script type="text/javascript">
            var flashvars = {};
            flashvars.cssSource = "piecemaker.css";
            flashvars.xmlSource = "piecemaker.xml";

            var params = {};
            params.play = "true";
            params.menu = "false";
            params.scale = "showall";
            params.wmode = "transparent";
            params.allowfullscreen = "true";
            params.allowscriptaccess = "always";
            params.allownetworking = "all";

            swfobject.embedSWF('piecemaker.swf', 'piecemaker', '1000', '600', '10', null, flashvars,
      params, null);
    
        </script>
        <!-- ************************** slider *****************************-->
    </head>
    <body>
        <%-- **********************************  slider *************************** --%>
                  <div class="main">
                <div class="main_resize">
                    <div id="piecemaker">
                        <p>
                        </p>
                    </div>
                </div>
            <div class="main_resize">
              <%--  <div class="content">
                    <div class="content_bg">
                        <div class="mainbar">
                            <div class="article">
                                <div class="clr">
                                </div>
                                <!--<p>Curabitur purus mi, pharetra vitae viverra et, mattis sit amet nunc. Quisque enim ipsum, convallis sit amet molestie in, placerat vel urna. Praesent congue auctor elit, nec pretium ipsum volutpat vitae. Vivamus eget ipsum sit amet ipsum tincidunt fermentum. Sed hendrerit neque ac erat condimentum vulputate. Nulla velit massa, dictum etinterdum quis, tempus at velit.</p>-->
                            </div>
                            <div class="article">
                                <div class="clr">
                                </div>
                                <!--<p>Maecenas vestibulum fermentum eleifend. Mauris erat sem, suscipit non tincidunt quis, vestibulum eget elit. Duis eget arcu ante. Proin nulla elit, elementum sit amet commodo et, eleifend vitae quam. Nam vel aliquam tortor. Aliquam bibendum erat a urna interdum quis mattis augue interdum. Phasellus fermentum bibendum mauris, ut semper justo pharetra vestibulum. Duis dictum purus sed nibh commodo a congue elit lobortis. Nunc sed feugiat tellus. Mauris aliquet lorem non enim euismod quis fermentum erat porta. Nullam non elit orci. Aliquam blandit mattis feugiat. Cras pulvinar aliquet massa, quis laoreet mi pulvinar ac. Aliquam mi augue, vehicula in consectetur in, porttitor sed tellus. Mauris convallis dapibus auctor. Integer in egestas lorem. In nulla dolor, sollicitudin vitae sollicitudin quis, viverra at lorem.</p>
            <p>Ut ullamcorper velit et nisi feugiat non sagittis tortor pharetra. Mauris ut urna et magna commodo cursus. Curabitur quis elementum arcu. Maecenas eleifend, urna vitae vehicula bibendum, felis tellus tincidunt lorem, at iaculis neque eros ac dui. Nunc malesuada pulvinar suscipit. Phasellus sed tortor quis ligula facilisis aliquam. Aliquam quis magna eu dolor posuere malesuada. Quisque consequat, metus fermentum convallis imperdiet, ante justo pharetra enim, vel commodo ipsum mauris eget purus. Morbi lacinia nisl urna, scelerisque suscipit lacus. Nulla ac orci ut nunc venenatis gravida.</p>-->
                            </div>
                        </div>
                        <!--<div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Sidebar</span> Menu</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">TemplateInfo</a></li>
              <li><a href="#">Style Demo</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Archives</a></li>
              <li><a href="#">Web Templates</a></li>
            </ul>
          </div>
          <div class="gadget">
            <h2 class="star"><span>Sponsors</span></h2>
            <div class="clr"></div>
            <ul class="ex_menu">
              <li><a href="http://www.dreamtemplate.com">DreamTemplate</a><br />
                Over 6,000+ Premium Web Templates</li>
              <li><a href="http://www.templatesold.com/">TemplateSOLD</a><br />
                Premium WordPress &amp; Joomla Themes</li>
              <li><a href="http://www.imhosted.com">ImHosted.com</a><br />
                Affordable Web Hosting Provider</li>
              <li><a href="http://www.myvectorstore.com">MyVectorStore</a><br />
                Royalty Free Stock Icons</li>
              <li><a href="http://www.evrsoft.com">Evrsoft</a><br />
                Website Builder Software &amp; Tools</li>
              <li><a href="http://www.csshub.com/">CSS Hub</a><br />
                Premium CSS Templates</li>
            </ul>
          </div>
          <div class="gadget">
            <h2 class="star"><span>Wise Words</span></h2>
            <div class="clr"></div>
            <div class="testi">
              <p><span class="q"><img src="images/qoute_1.gif" width="20" height="15" alt="" /></span> We can let circumstances rule us, or we can take charge and rule our lives from within. <span class="q"><img src="images/qoute_2.gif" width="20" height="15" alt="" /></span></p>
              <p class="title"><strong>Earl Nightingale</strong></p>
            </div>
          </div>
        </div>-->--%>
                      <div>
                        <h2>
                            <span>About This</span> Project</h2>
               
                            <strong>Campus Corner is a project created by 3 friends to make coleege activities more
                                effective.Center idea about this project is to provide a free yet comprehensive
                                environment for student and teacher to communicate while they are off-campus.</strong>
                        <h2>
                            <span>Our</span> Mission</h2>
                       
                            <strong>Our mission is to make the college campus more closed.Communication between
                                student and faulty must be effective in order to gain reputaion of college.So this
                                project provides the way in which student and teachers can interact with each other
                                and find the solution of their problem even when they are not in college.</strong>

                        </div>
                   <%-- </div>
                </div>
            </div>--%>
            <!--<div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image Gallery</span></h2>
        <a href="#"><img src="images/pic_1.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_2.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_3.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_4.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_5.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_6.jpg" width="58" height="58" alt="" /></a> </div>
      <div class="col c2">
        <h2><span>Lorem Ipsum</span></h2>
        <p>Lorem ipsum dolor<br />
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam</a>, lectus turpis varius lorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam.</p>
      </div>
      <div class="col c3">
        <h2><span>About</span></h2>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum. <a href="#">Learn more...</a></p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
</div>-->
        </div>
      
        </div> </div>
        <%-- **********************************  slider *************************** --%>
        <%-- <div class="header">
                    <img src="images/IIT_GN1.jpg" width="950" height="291" alt="" /></div>--%>
        <div class="main">
    </div>
</asp:Content>
