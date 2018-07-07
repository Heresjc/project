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
    <title>视频页面</title>
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../stylesheet/base.css">
    <link rel="stylesheet" href="../stylesheet/video.css"/>
    <link rel="stylesheet" href="../stylesheet/frozen.css"/>
        <link rel="stylesheet" href="../stylesheet/video-js.css"/>
    <style type="text/css">
        .zy_media {
            z-index: 999999999
        }
        .box {
            margin: 130px auto 0 auto;
            width: 400px;
        }
    </style>
    <link rel="stylesheet" href="../stylesheet/zy.media.min.css">
</head>
<body>
    <div class="ui-row-flex ui-whitespace videohrT">
        <div class="ui-col ui-col-4 ">
            <div class="vtitle"><a href="#">视频</a></div>
            <div class="vhandout" id="handout"><a id="tojy" href="#">讲义</a></div>
        </div>
        <div class="ui-col">
            <div class="vdoCart" id="vdoCarta"></div>
        </div>
    </div>
    <div class="videoCnt">
        <h1 class="videoCntName">奥巴马演讲视频</h1>
        <div class="video">
           <div class="zy_media" id="vvv"></div>
        </div>
    </div>
    <div class="vdoSub">
        <div class="box" id="box">

        </div>
        <input type="button" name="vdoShare" value="分享" class="vdoShare">
        <audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls">
            Your browser does not support the audio element.
        </audio>
    </div>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/video.js"></script>

<script>
    $(document).ready(function(){
            var storage=window.localStorage;
            //视频URL
            var media_url = storage.getItem("media_url");
            //视频字幕URL
            var caption_file_url = storage.getItem("caption_file_url");
            var html = "<video id='example_video_1' class='video-js vjs-default-skin' controls preload='none'> <source id='sour' src='"+media_url+"'  type='video/mp4'/><track id='tra' src='"+caption_file_url+"' kind='subtitles' srclang='en' label='English'/></video>";
            $("#vvv").html(html);

            var lessons_id = storage.getItem("lessons_id");
            var short_content = storage.getItem("short_content");
            $("#box").html("<div>"+short_content+"</div>");
            //为讲义按钮动态添加点击事件
            $("#handout").click(function () {
                toVideo(lessons_id);
            });
        });

    function toVideo(a) {
            var storage=window.localStorage;
            storage.setItem("lessons_id",a);
            //跳转到讲义页面
            $("#tojy").attr("href","Handout讲义.aspx");
        }

    function getRootPath(){
        var curWwwPath=window.document.location.href;
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        var localhostPaht=curWwwPath.substring(0,pos);
        var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
        return(localhostPaht+projectName);
    }
</script>

</html>