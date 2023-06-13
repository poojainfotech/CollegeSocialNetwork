<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CollegeSocialNetwork.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">


        var check_status = false;
        var like_cnt = $("#like-cnt");
        var like_parent = $(".like-container");

        var burst = new mojs.Burst({
            parent: like_parent,
            radius: { 20: 60 },
            count: 15,
            angle: { 0: 30 },
            children: {
                delay: 250,
                duration: 700,
                radius: { 10: 0 },
                fill: ['#ddca7e'],
                easing: mojs.easing.bezier(.08, .69, .39, .97)
            }
        });

        $("#like-cnt").click(function () {
            var t1 = new TimelineLite();
            var t2 = new TimelineLite();
            if (!check_status) {
                t1.set(like_cnt, { scale: 0 });
                t1.set('.like-btn', { scale: 0 });
                t1.to(like_cnt, 0.6, { scale: 1, background: '#ddca7e', ease: Expo.easeOut });
                t2.to('.like-btn', 0.65, { scale: 1, ease: Elastic.easeOut.config(1, 0.3) }, '+=0.2');
                //    t1.timeScale(5);
                check_status = true;
                //circleShape.replay();
                burst.replay();
            }
            else {
                t1.to(like_cnt, 1, { scale: 1 })
                    .to(like_cnt, 1, { scale: 1, background: 'rgba(255,255,255,0.3)', ease: Power4.easeOut });
                t1.timeScale(7);
                check_status = false;
            }

        })
    </script>
    <style>

        body{background: #333;}
.like-container{filter: url('#filter');}
.like-cnt{  
  position: absolute; 
  cursor: pointer;
  left: 50%; 
  top: 50%; 
  transform: translate(-50%, -50%);     background: rgba(255,255,255,0.3);     width: 60px; 
  height: 60px;  
  border-radius: 50%;
  text-align: center;
  line-height: 75px;
  z-index: 10;
}
.like-btn{
  color: #fff;
}

.gp-header{font-family: georgia; font-size: 40px; color: #ddca7e; font-style: italic; text-align: center; margin-top: 31px;}
.gp-footer{position: fixed; color: #fff; bottom: 10px; left: 50%; font-family: georgia; font-style: italic; transform: translateX(-50%);}
.gp-footer .soc_icons{display: inline-block; color: #ddca7e; margin: 0px 0px;}


::-moz-selection { background: transparent;}
::selection {background: transparent;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="like-container">
  <div class="like-cnt unchecked" id="like-cnt">
  <i class="like-btn material-icons">thumb_up</i>
</div>
</div>
<div class="gp-footer">
  Follow me on : 
  <a href="facebook.com/gowriprasanthvm" class="soc_icons">facebook</a> /
    <a href="https://twitter.com/gowriprasanthvm" class="soc_icons">twitter</a>
</div>
        </div>
    </form>
</body>
</html>
