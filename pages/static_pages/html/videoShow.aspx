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
    		text-align: center;
    	}
    	.change a {
    		display: inline-block;
		    height: 30px;
		    line-height: 30px;
		    padding: 0 10px;
		    margin-right: 0px;
		    cursor: pointer;
    	}
    	.change a.set {
		    background-color: #99CCFF;
		    color: #fff;
		    border-radius: 4px;
    	}
    	.blog-header img {
    		width: 100%;
    	}
    	.videohrT {
    		z-index: 99;
    	}
    	.back {
    		width: 10px;
    		height: 10px;
    		border: 1px solid #ccc;
    		line-height: 10px;
    		text-align: center;
    		bakcground: #fff;
    		position: fixed;
    		bottom: 30px;
    		right: 10px;
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
        		<a id="url1" class="set">视频源１</a>
        		<a id="url2">视频源２</a>
            <!-- <div class="buttonOpen videoBtn" onclick="changeVideo()"></div> -->
        </div>
    </div>
    <div rel="tab-3" class="content">
        <div class="vdoSubtitle">
            <div class="vdoSubtle">
                <div id="lyricContainer"></div>
                <!--水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网水边%20各种空灵鸟叫_爱给网-->
            </div>
        </div>
        <div class="vdoSub">
            <audio src="../img/video/水边%20各种空灵鸟叫_爱给网_aigei_com.mp3" controls="controls" id="audioUrl">
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
                <div class="handoutPic">
                    <h3 class="text-center ">—每日一句—</h3>
                    <div class="dayImg">
                        <div id="mryj_img"></div>
                    </div>
                </div>
                <div class="handoutPic">
                    <h3 class="text-center copyright"></h3>
                    <div class="dayImg">
                        <div id = "bqsm"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/tabs.js"></script>

<script type="text/javascript">

    var audio;
        window.onload = function(){
            audio=document.getElementById("audioUrl");


            //显示歌词的元素
            var lyricContainer = $("#lyricContainer");
            //获取lrc转换成的字幕文件的
            var lrcText = "[00:00.17]庭竹 - 公主的天堂\n" +
                "[00:05.40]作曲:陈嘉唯、Skot Suyama 陶山、庭竹\n" +
                "[00:07.33]作词:庭竹\n" +
                "[00:15.59]风铃的音谱 在耳边打转\n" +
                "[00:18.62]城堡里 公主也摆脱了黑暗的囚禁\n" +
                "[00:22.82]她一点点地 无声悄悄地慢慢长大\n" +
                "[00:26.36]期待着 深锁木门后的世界\n" +
                "[01:38.72][00:29.76]\n" +
                "[01:51.48][00:30.32]树上 小鸟的轻响 在身边打转\n" +
                "[01:55.35][00:34.09]公主已 忘记木制衣橱背后的惆怅\n" +
                "[01:59.65][00:38.35]她跳舞唱歌天真无邪地寻找属于自己的光亮和快乐\n" +
                "[02:06.98][00:45.76]\n" +
                "[02:07.41][00:46.06]树叶一层层拨开了伪装\n" +
                "[02:11.29][00:50.25]彩虹一步步露出美丽脸庞 无限的光亮\n";

            //通过正则拆分的字幕arr
            var resultArr = parseLyric(lrcText);

            console.dir(resultArr);

            audio.ontimeupdate = function(e) {
                //遍历所有歌词，看哪句歌词的时间与当然时间吻合
                for (var i = 0, l = resultArr.length; i < l; i++) {
                    if (this.currentTime /*当前播放的时间*/ > resultArr[i][0]) {
                        //显示到页面
    //                    lyricContainer.textContent = resultArr[i][1];
                        $("#lyricContainer").html(resultArr[i][1]);
                    };
                };
            };
        }


    $(".videoBtn").click(function () {
        if ($(this).hasClass("buttonOpen")) {
            $(this).removeClass("buttonOpen").addClass("buttonOff");
        } else {
            $(this).removeClass("buttonOff").addClass("buttonOpen");
        }
    });
        $("#url1").click(function(){
					changeVideo();
					$(this).addClass("set").siblings("a").removeClass("set");
        })
        $("#url2").click(function(){
        		changeVideo();
					$(this).addClass("set").siblings("a").removeClass("set");
        })

    function changeVideo() {
        var flag = $("#video_3").val();
        if (flag == "video_1"){
            var video1Url = $("#video_1").attr("src");
            var video2Url = $("#video_2").val();

            $("#video_1").attr("src", video2Url);
           $("#video_2").attr("value", video1Url);
           $("#video_3").attr("value", "video_2");
        }else if(flag == "video_2"){
           var video1Url = $("#video_1").attr("src");
            var video2Url = $("#video_2").val();

            $("#video_1").attr("src", video2Url);
            $("#video_2").attr("value", video1Url);
            $("#video_3").attr("value", "video_1");
        }
    }


    $(function () {
        tabs_takes.init("tabdemo");
    })

    $(document).ready(function () {
            var storage = window.localStorage;
            //视频URL
            var media_url = storage.getItem("media_url");
            //音频URL
            var audioUrl = storage.getItem("audioUrl");
            var videoUrls = media_url.split(",");

            $("#audioUrl").attr("src" , audioUrl);

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