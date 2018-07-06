<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    public string openId = "";

    public string userToken = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string currentPageUrl = Server.UrlEncode(Request.Url.ToString());
        if (Session["user_token"] == null || Session["user_token"].ToString().Trim().Equals(""))
        {
            Response.Redirect("../../../authorize.aspx?callback=" + currentPageUrl, true);
        }
        userToken = Session["user_token"].ToString().Trim();
        openId = WeixinUser.CheckToken(userToken);
        if (openId.Trim().Equals(""))
        {
            Response.Redirect("../../../authorize.aspx?callback=" + currentPageUrl, true);
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>讲义</title>
    <link rel="stylesheet" href="../stylesheet/bootstrap.min.css">
    <link rel="stylesheet" href="../stylesheet/handout.css">
</head>
<body>
<div class="container handout">
    <div class="blog-header" id="list">
        <div class="handoutKw">
            <h3 class="text-center">—重点单词—</h3>
            <div id="zddc0"></div>
        </div>
        <div class="handoutEw">
            <h3 class="text-center">—引申单词—</h3>
            <div id="ysdc0">
            </div>
        </div>
        <div class="handoutEw">
            <h3 class="text-center">—今日短语—</h3>
            <div id="jrdy0">
            </div>
        </div>
        <div class="handoutPic">
            <h3 class="text-center ">—重点句型—</h3>
            <div id="zdjx0"></div>
        </div>
        <div class="handoutPic">
            <h3 class="text-center ">—对话中文翻译—</h3>
            <div id="dhzwfy0"></div>
            <div id="dhimgdiv"></div>
        </div>
        <div class="handoutPic">
            <h3 class="text-center ">—引申知识的讲解—</h3>
            <div id="yszsjj0"></div>
            <div id="ysimgdiv"></div>
        </div>
    </div>
</div>
<footer class="qtnFt">
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/template.js"></script>
<script>

    $(document).ready(function(){
        var storage=window.localStorage;
        var lessonsid = storage.getItem("lessons_id");
        getContent(lessonsid);
    });

    function getContent(o) {
        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_handout_of_lesson.aspx",
            data: {"lessonid":o},
            success: function(data){
                if (data.status == 0){
                    if (data.handouts.length > 0){
                        var zddc = new Array();
                        var ysdc = new Array();
                        var jrdy = new Array();
                        var zdjx = new Array();
                        var dhzwfy = new Array();
                        var yszsjj = new Array();
                        for(var i = 0; i < data.handouts.length; i++){
                            if(data.handouts[i].type == "重点单词"){
                                zddc.push(data.handouts[i]);
                            }else if(data.handouts[i].type == "引申单词"){
                                ysdc.push(data.handouts[i]);
                            }else if(data.handouts[i].type == "今日短语"){
                                jrdy.push(data.handouts[i]);
                            }else if(data.handouts[i].type == "重点句型"){
                                zdjx.push(data.handouts[i]);
                            }else if(data.handouts[i].type == "对话中文翻译"){
                                dhzwfy.push(data.handouts[i]);
                            }else if(data.handouts[i].type == "引申知识的讲解"){
                                yszsjj.push(data.handouts[i]);
                            }
                        }
                        innzddc(zddc);
                        innysdc(ysdc);
                        innjrdy(jrdy);
                        innzdjx(zdjx);
                        inndhzwfy(dhzwfy);
                        innyszsjj(yszsjj);
                    }
                }else{
                    alert("接口异常");
                }
            }
        });
    }


    function innzddc(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#zddc"+i).after("<div id='zddc"+j+"'>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>");
            }
        }
    }

    function innysdc(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#ysdc"+i).after("<div id='ysdc"+j+"'>" + j+"."+o[i].english_content + ":"+o[i].chinese_content+"</div>");
            }
        }
    }

    function innjrdy(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#zdjx"+i).after("<div id='zdjx"+j+"'>" + j+"."+o[i].english_content + ":"+o[i].chinese_content+"</div>");
            }
        }
    }

    function innzdjx(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#zdjx"+i).after("<div id='zdjx"+j+"'>" + j+"."+o[i].english_content + ":"+o[i].chinese_content+"</div>");
            }
        }
    }

    function inndhzwfy(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#dhzwfy"+i).after("<div id='dhzwfy"+j+"'>" + j+"."+o[i].chinese_content+"</div>");

                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        $("#dhimgdiv").html("<img id='dhimg' src='"+o[i].medias[0].media_url+"'>");
                    }
                }
            }
        }
    }

    function innyszsjj(o) {
        if (o.length > 0){
            for(var i = 0; i < o.length; i++){
                var j = i+1;
                $("#yszsjj"+i).after("<div id='yszsjj"+j+"'>" + j+"."+o[i].english_content + ":"+o[i].chinese_content+"</div>");

                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        $("#ysimgdiv").html("<img id='ysimg' src='"+o[i].medias[0].media_url+"'>");
                    }
                }
            }
        }
    }
</script>
</html>

