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
    <link rel="stylesheet" href="../stylesheet/bootstrap.min.css">
    <link rel="stylesheet" href="../stylesheet/handout.css">
    <link rel="stylesheet" href="../stylesheet/zy.media.min.css">
    <style>
    	.videohrT .vtitle {
    		height: 30px;
    		line-height: 30px;
    		text-align:center;
    	}
    	.videoCnt .video {
    		margin-top: 40px;
    		height: 200px;
    	}
    	.change {
    		margin-top: 50px;
    		position: absolute;
    		top: 0;
    		right:0;
    		left:0;
    	}
    	.change a {
    		display: inline-block;
		    height: 30px;
		    line-height: 30px;
		    background-color: #99CCFF;
		    color: #fff;
		    border-radius: 4px;
		    padding: 0 10px;
		    margin-right: 0px;
		    cursor: pointer;
    	}
    </style>
</head>
<body>
<div id="tabdemo">
    <ul class="videohrT">
        <li rel="tab-1" class="vtitle">背景</li>
        <li class="list"></li>
        <li rel="tab-2" class="vtitle">视频</li>
        <li class="list"></li>
        <li rel="tab-3" class="vtitle">音频</li>
        <li class="list"></li>
        <li rel="tab-4" class="vtitle">讲义</li>
    </ul>
    <div rel="tab-1" class="content">
        <div class="box" id="box"></div>
    </div>
    <div rel="tab-2" class="content">
        <div class="videoCnt">
            <h1 class="videoCntName"></h1>
            <div class="video">
                <div class="zy_media" id="vvv">
                    <video id='video_1' poster="../img/curAdu/aduImg.jpg" src='' controls='true'
                           controlslist='nodownload' preload="auto" webkit-playsinline playsinline></video>
                    <input id="video_2" type="hidden" value=""/>
                    <input id="video_3" type="hidden" value=""/>
                </div>
            </div>
        </div>
        <div class="change">
        		<a id="url1">视频源１</a>
        		<a id="url2">视频源２</a>
            <!-- <div class="buttonOpen videoBtn" onclick="changeVideo()"></div> -->
        </div>
    </div>
    <div rel="tab-3" class="content">
        <div class="vdoSubtitle">
            <div class="vdoSubtle">水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网</div>
        </div>
        <div class="vdoSub">
            <audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls">
                Your browser does not support the audio element.
            </audio>
        </div>
    </div>
    <div rel="tab-4" class="content">
        <div class="container handout">
            <div class="blog-header">
                <h3>Andersen's Fairy Tale -chapter 10 -知识点总结</h3>
                <h4>2018-07-15 Eason 薄荷阅读MintReading</h4>
                <h4 class="narration">
                    薄荷阅读MintReading薄荷阅读MintReading薄荷阅读MintReading薄荷阅读MintReading薄荷阅读MintReading薄荷阅读MintReading薄荷阅读MintReading</h4>
                <audio src="../img/video/ai_xiao_de_yan_jing.mp3" controls="controls">
                    Your browser does not support the audio element.
                </audio>

                <div class="handoutKw">
                    <h3 class="text-center">—重点单词—</h3>
                    <div id="zddc0"></div>
                    <!-- <p class="lead blog-description keywords">
                         1.<span class="keyword">[turn]</span>在文中的幕府将军阿娇阿娇费劲啊发奖金阿娇阿娇将阿飞咳咳恶寇。
                     </p>
                     <p class="lead blog-description kwExplain">
                         <span class="kwExStart">原句：</span>The official example template of creating a blog
                         <span class="thisWord">Bootstrap</span>The
                         official example template of creating a blog with Bootstrap,The official example template of creating a
                         blog
                         with Bootstrap,The official example template of creating a blog with Bootstrap.</p>
                     <p class="lead blog-description kwExplain">
                         <span class="kwExStart">例句:</span>The official example template of creating a blog with <span
                             class="thisWord">Bootstrap</span>.</p>-->
                </div>
                <div class="handoutEw">
                    <h3 class="text-center">—引申单词—</h3>
                    <div id="ysdc0"></div>
                    <!--<p class="lead blog-description ew">
                        1.The official example template of creating a blog<span class="exWords">Bootstrap</span>.
                    </p>
                    <p class="lead blog-description keywords">
                    <li><span class="keyword">[turn]</span>在文中的幕府将军阿娇阿娇费劲啊发奖金阿将军阿娇阿娇费劲啊发
                        奖金阿将军阿娇阿娇费劲啊发奖金阿将军阿娇阿娇费劲啊发奖金阿将军阿娇阿娇费劲啊发奖金阿将军阿娇阿娇费劲啊
                        发奖金阿将军阿娇阿娇费劲啊发奖金阿娇阿娇将阿飞咳咳恶寇。
                    </li>
                    <li><span class="keyword">[turn]</span>在文中的幕府将军阿娇阿娇费劲啊发奖金阿娇阿娇将阿飞咳咳恶寇。</li>
                    <li><span class="keyword">[turn]</span>在文中的幕府将军阿娇阿娇费劲啊发奖金阿娇阿娇将阿飞咳咳恶寇。</li>
                    </p>-->
                </div>
                <div class="handoutEw">
                    <h3 class="text-center">—今日短语—</h3>
                    <div id="jrdy0"></div>
                    <!--<p class="text-center">come true 实现</p>
                    <p class="text-center">come true 实现</p>
                    <p class="text-center">come true 实现</p>
                    <p class="text-center">come true 实现</p>
                    <p class="text-center">come true 实现</p>
                    <p class="text-center">come true 实现</p>-->
                </div>
                <div class="handoutPic">
                    <h3 class="text-center ">—重点句型—</h3>
                    <div id="zdjx0"></div>
                    <!--<p class="lead blog-description">
                    <h4 class="ftBold textUnder">减肥减肥减肥减肥减肥减肥就</h4>
                    </p>
                    <p class="lead blog-description">
                        减肥减肥减肥减肥减肥减肥就分居费就放假几分几分计算机老师乱收费抗衰老深蓝色六神磊磊孙孚凌 抗衰老受苦受累深蓝色
                    </p>-->
                </div>
                <div class="handoutPic">
                    <h3 class="text-center ">—对话中文翻译—</h3>
                    <div id="dhzwfy0"></div>
                    <div id="dhimgdiv"></div>
                    <!--<p class="lead blog-description">
                    <h4 class="ftBold textUnder">减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就</h4>
                    <p class="lead blog-description">
                        减肥减肥减肥减肥减肥减肥就分居费就放假几分几分计减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就算机老师乱收费抗衰老深蓝色六神磊磊孙孚凌
                        抗衰老受苦受累深蓝色
                    </p>
                    </p>
                    <img src="../img/handout/aduImg.jpg" class="img-responsive" alt="Responsive image">-->
                </div>
                <div class="handoutPic">
                    <h3 class="text-center ">—引申知识的讲解—</h3>
                    <div id="yszsjj0"></div>
                    <div id="ysimgdiv"></div>
                   <!-- <p class="lead blog-description">
                    <h4 class="ftBold textUnder">减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就</h4>
                    <p class="lead blog-description">
                        减肥减肥减肥减肥减肥减肥就分居费就放假几分几分计减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就减肥减深蓝色劳伦斯里山路减肥减肥减肥减肥就算机老师乱收费抗衰老深蓝色六神磊磊孙孚凌
                        抗衰老受苦受累深蓝色
                    </p>
                    </p>
                    <img src="../img/handout/aduImg.jpg" class="img-responsive" alt="Responsive image">-->
                </div>
                <div class="handoutPic">
                    <h3 class="text-center ">—每日一句—</h3>
                    <div class="dayImg">
                        <div id="mryj_img"></div>
                        <!--<img src="../img/handout/aduImg.jpg" class="img-responsive" alt="Responsive image">-->
                    </div>
                </div>
                <div class="handoutPic">
                    <h3 class="text-center copyright"></h3>
                    <!--<p>版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权版权</p>-->
                    <div class="dayImg">
                        <div id = "bqsm"></div>
                        <!--<img src="../img/handout/aduImg.jpg" class="img-responsive" alt="Responsive image">-->
                    </div>
                </div>
            </div>
        </div>
        <footer class="qtnFt">
            <p>Blog template built for <a href="#">Bootstrap</a> by <a
                    href="#">@mdo</a>.</p>
            <p>
                <a href="#">Back to top</a>
            </p>
        </footer>
    </div>
</div>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/tabs.js"></script>

<script type="text/javascript">
    $(".videoBtn").click(function () {
        if ($(this).hasClass("buttonOpen")) {
            $(this).removeClass("buttonOpen").addClass("buttonOff");
        } else {
            $(this).removeClass("buttonOff").addClass("buttonOpen");
        }
    });
		changeVideo();
    function changeVideo() {
        var flag = $("#video_3").val();
        var video1Url = $("#video_1").attr("src");
        var video2Url = $("#video_2").val();
        $("#url1").click(function(){
        		$("#video_1").attr("src", video2Url);
            $("#video_2").attr("value", video1Url);
            $("#video_3").attr("value", "video_2");
        })
        $("#url2").click(function(){
        		$("#video_1").attr("src", video2Url);
            $("#video_2").attr("value", video1Url);
            $("#video_3").attr("value", "video_1");
        })
        //if (flag == "video_1"){
            //var video1Url = $("#video_1").attr("src");
            //var video2Url = $("#video_2").val();

           // $("#video_1").attr("src", video2Url);
           // $("#video_2").attr("value", video1Url);
           // $("#video_3").attr("value", "video_2");
        //}else if(flag == "video_2"){
           // var video1Url = $("#video_1").attr("src");
           // var video2Url = $("#video_2").val();

           // $("#video_1").attr("src", video2Url);
            //$("#video_2").attr("value", video1Url);
           // $("#video_3").attr("value", "video_1");
        //}
    }


    $(function () {
        tabs_takes.init("tabdemo");
    })

    $(document).ready(function () {
        var storage = window.localStorage;
        //视频URL
        var media_url = storage.getItem("media_url");

        var videoUrls = media_url.split(",");

        if (videoUrls.length>0){
            if (videoUrls.length == 1){
                $("#video_1").attr("src", videoUrls[0]);
                $("#video_3").attr("value", "video_1");
            }else if(videoUrls.length == 2){
                $("#video_1").attr("src", videoUrls[0]);
                $("#video_2").attr("value", videoUrls[1]);
                $("#video_3").attr("value", "video_1");
            }
        }
        var lessons_id = storage.getItem("lessons_id");
        var short_content = storage.getItem("short_content");
        $("#box").html("<div>" + short_content + "</div>");
    });

    function getRootPath() {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPaht = curWwwPath.substring(0, pos);
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }


    $(document).ready(function () {
        var storage = window.localStorage;
        var lessonsid = storage.getItem("lessons_id");
        getContent(lessonsid);
    });

    function getContent(o) {
        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_handout_of_lesson.aspx",
            data: {"lessonid": o},
            success: function (data) {
                if (data.status == 0) {
                    if (data.handouts.length > 0) {
                        var zddc = new Array();
                        var ysdc = new Array();
                        var jrdy = new Array();
                        var zdjx = new Array();
                        var dhzwfy = new Array();
                        var yszsjj = new Array();
                        var bqsm = new Array();
                        var mryj = new Array();
                        for (var i = 0; i < data.handouts.length; i++) {
                            if (data.handouts[i].type == "重点单词") {
                                zddc.push(data.handouts[i]);
                            } else if (data.handouts[i].type == "引申单词") {
                                ysdc.push(data.handouts[i]);
                            } else if (data.handouts[i].type == "今日短语") {
                                jrdy.push(data.handouts[i]);
                            } else if (data.handouts[i].type == "重点句型") {
                                zdjx.push(data.handouts[i]);
                            } else if (data.handouts[i].type == "对话中文翻译") {
                                dhzwfy.push(data.handouts[i]);
                            } else if (data.handouts[i].type == "引申知识的讲解") {
                                yszsjj.push(data.handouts[i]);
                            }else if (data.handouts[i].type == "版权声明") {
                                bqsm.push(data.handouts[i]);
                            }else if (data.handouts[i].type == "每日一句") {
                                mryj.push(data.handouts[i]);
                            }
                        }
                        innzddc(zddc);
                        innysdc(ysdc);
                        innjrdy(jrdy);
                        innzdjx(zdjx);
                        inndhzwfy(dhzwfy);
                        innyszsjj(yszsjj);
                        innbqsm(bqsm);
                        innmryj(mryj);
                    }
                } else {
                    alert("接口异常");
                }
            }
        });
    }


    function innzddc(o) {
        if (o.length > 0) {
            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
//                    html = html + "<div>"+ j+"." + o[i].english_content + ":"+o[i].chinese_content+"</div>";
                    html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    j++;
                }
            }
            $("#zddc0").html(html);
        }
    }

    function innysdc(o) {
        if (o.length > 0) {
            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    j++;
                }
            }
            $("#ysdc0").html(html);
        }
    }

    function innjrdy(o) {
        if (o.length > 0) {
            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    j++;
                }
            }
            $("#jrdy0").html(html);
        }
    }

    function innzdjx(o) {
        if (o.length > 0) {
            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    j++;
                }
            }
            $("#zdjx0").html(html);
        }
    }

    function inndhzwfy(o) {
        if (o.length > 0) {

            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    if (o[i].english_content.length > 3) {
                        html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                        j++;
                    } else {
                        html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                        j++;
                    }
                }
            }
            $("#dhzwfy0").html(html);
        }
    }

    function innyszsjj(o) {
        if (o.length > 0) {

            var html = "";
            var j = 1;
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    if (o[i].english_content.length>0 && o[i].chinese_content.length>0){
                        html = html + "<div>" + j + "." + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                        j++;
                    }else if (o[i].english_content.length == 0){
                        html = html + "<div>" + j + "." + o[i].chinese_content + "</div>";
                        j++;
                    }else if (o[i].chinese_content.length == 0){
                        html = html + "<div>" + j + "." + o[i].english_content + "</div>";
                        j++;
                    }
                }
            }
            $("#yszsjj0").html(html);
        }
    }

    function innbqsm(o) {
        if (o.length > 0) {

            var html = "";
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    if (o[i].english_content.length>0){
                        html = html + "<div>" + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    }else{
                        html = html + "<div>" + o[i].chinese_content + "</div>";
                    }
                }
            }
            $("#bqsm").html(html);
        }
    }


    function innmryj(o) {
        if (o.length > 0) {

            var html = "";
            for (var i = 0; i < o.length; i++) {
                if (o[i].medias.length > 0) {
                    if (o[i].medias[0].type == "picture") {
                        html = html + "<img src='" + o[i].medias[0].media_url + "' class='img-responsive' alt='Responsive image'>";
                    }
                } else {
                    if (o[i].english_content.length>0){
                        html = html + "<div>" + o[i].english_content + ":" + o[i].chinese_content + "</div>";
                    }else{
                        html = html + "<div>" + o[i].chinese_content + "</div>";
                    }
                }
            }
            $("#mryj_img").html(html);
        }
    }

</script>
</html>