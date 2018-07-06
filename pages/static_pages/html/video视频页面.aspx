﻿<%@ Page Language="C#" %>

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
            <div class="zy_media">
                <video id="v" controls="controls">
                   <!-- <source id="sour" src="../img/video/79k888piC6bM.mp4"  type="video/mp4"/>
                    <track id="tra" src="../vtt/12345.vtt" kind="subtitles" label="English" srclang="zh" default/>-->
                    <source id="sour" src=""  type="video/mp4"/>
                    <track id="tra" src="" kind="subtitles" label="English" srclang="zh" default/>
                </video>
            </div>
        </div>
    </div>
    <div class="vdoSub">
        <div class="box" id="box">
            <p>
                壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。</br>
                </br>
                于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。</br>
                </br>
                苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”</br>
                </br>
                苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者如彼，而卒莫消长也。盖将自其变者而观之，则天地曾不能以一瞬；自其不变者而观之，则物与我皆无尽也，而又何羡乎!且夫天地之间，物各有主,苟非吾之所有，虽一毫而莫取。惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色，取之无禁，用之不竭，是造物者之无尽藏也，而吾与子之所共适。”</br>
                </br>
                客喜而笑，洗盏更酌。肴核既尽，杯盘狼籍。相与枕藉乎舟中，不知东方之既白。
            </p>
        </div>
        <input type="button" name="vdoShare" value="分享" class="vdoShare">
        <audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls">
            Your browser does not support the audio element.
        </audio>
    </div>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>

<script>
    $(document).ready(function(){
            var storage=window.localStorage;
            var lessons_id = storage.getItem("lessons_id");
            //视频URL
            var media_url = storage.getItem("media_url");
            //视频字幕URL
            var caption_file_url = storage.getItem("caption_file_url");

            $("#sour").attr("src",media_url);
            $("#tra").attr("src",caption_file_url);
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