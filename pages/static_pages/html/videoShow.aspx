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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="../stylesheet/base.css">
    <link rel="stylesheet" href="../stylesheet/video.css"/>
    <link rel="stylesheet" href="../stylesheet/frozen.css"/>
    <link rel="stylesheet" href="../stylesheet/video-js.css"/>
    <link rel="stylesheet" href="../stylesheet/bootstrap.min.css">
    <link rel="stylesheet" href="../stylesheet/handout.css">
    <link rel="stylesheet" href="../stylesheet/zy.media.min.css">
</head>
<body>
<div id="tabdemo">
    <ul class="videohrT">
        <li rel="tab-1" class="vtitle">**</li>
        <li rel="tab-2" class="vtitle">视频</li>
        <li rel="tab-3" class="vtitle">音频</li>
        <li rel="tab-4" class="vhandout">讲义</li>
        <div class="vdoCart" id="vdoCarta"></div>
    </ul>
    <div rel="tab-1" class="content">
        <!--<div class="videoCnt">-->
            <!--<h1 class="videoCntName"></h1>-->
            <!--<div class="video">-->
                <!--<div class="zy_media" id="vvv"></div>-->
            <!--</div>-->
        <!--</div>-->
        <!--<div class="vdoSub">-->
            <!--<div class="box" id="box">-->

            <!--</div>-->
            <!--<input type="button" name="vdoShare" value="分享" class="vdoShare">-->
            <!--<audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls">-->
                <!--Your browser does not support the audio element.-->
            <!--</audio>-->
        <!--</div>-->
    </div>
    <div rel="tab-2" class="content">
        <div class="videoCnt">
            <h1 class="videoCntName"></h1>
            <div class="video">
                <div class="zy_media" id="vvv">
                    <video id='example_video_1' class='video-js vjs-default-skin' src='' x5-video-player-type='h5' x5-video-player-fullscreen='true' controls='true' controlslist='nodownload' preload='none' webkit-playsinline playsinline> </video>
                </div>
            </div>
        </div>
    </div>
    <div rel="tab-3" class="content">
        <div class="vdoSub">
            <div class="box" id="box">

            </div>
            <input type="button" name="vdoShare" value="分享" class="vdoShare">
            <audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls">
                Your browser does not support the audio element.
            </audio>
        </div>
    </div>
    <div rel="tab-4" class="content">
    <div class="container handout">
        <div class="blog-header" id="list">
            <div class="handoutKw">
                <h3 class="text-center">—重点单词—</h3>
                <div id="zddc0"></div>
            </div>
            <div class="handoutEw">
                <h3 class="text-center">—引申单词—</h3>
                <div id="ysdc0"></div>
            </div>
            <div class="handoutEw">
                <h3 class="text-center">—今日短语—</h3>
                <div id="jrdy0"></div>
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
            <footer class="qtnFt">
                <p>
                    <a href="#">Back to top</a>
                </p>
            </footer>
        </div>
    </div>
</div>
</div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/tabs.js"></script>
<script src="../js/video.js"></script>

<script type="text/javascript">
    $(function () {
        tabs_takes.init("tabdemo");
    })

    $(document).ready(function(){
        var storage=window.localStorage;
        //视频URL
        var media_url = storage.getItem("media_url");
        $("#example_video_1").attr("src" , media_url);

        var lessons_id = storage.getItem("lessons_id");
        var short_content = storage.getItem("short_content");
        $("#box").html("<div>"+short_content+"</div>");
    });

    function getRootPath(){
        var curWwwPath=window.document.location.href;
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        var localhostPaht=curWwwPath.substring(0,pos);
        var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
        return(localhostPaht+projectName);
    }


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
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    j++;
                }
            }
            $("#zddc0").html(html);
        }
    }

    function innysdc(o) {
        if (o.length > 0){
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    j++;
                }
            }
            $("#ysdc0").html(html);
        }
    }

    function innjrdy(o) {
        if (o.length > 0){
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    j++;
                }
            }
            $("#jrdy0").html(html);
        }
    }

    function innzdjx(o) {
        if (o.length > 0){
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    j++;
                }
            }
            $("#zdjx0").html(html);
        }
    }

    function inndhzwfy(o) {
        if (o.length > 0){
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    if (o[i].english_content.length > 3){
                        html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                        j++;
                    }else{
                        html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                        j++;
                    }
                }
            }
            $("#dhzwfy0").html(html);
        }
    }

    function innyszsjj(o) {
        if (o.length > 0){
            var html = "";
            var j = 1;
            for(var i = 0; i < o.length; i++){
                if (o[i].medias.length > 0){
                    if (o[i].medias[0].type == "picture"){
                        html = html + "<img src='"+o[i].medias[0].media_url+"'>";
                    }
                }else{
                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    j++;
                }
            }
            $("#yszsjj0").html(html);
        }
    }

</script>
</body>
</html>