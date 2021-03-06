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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>试听课程级别选择</title>
    <link rel="stylesheet" href="../stylesheet/bootstrap.min.css">
    <link rel="stylesheet" href="../stylesheet/courseLevel.css">
    <style>
    	html,body {
    		height:100%;
    	}
    	.container.clCnt {
    		height: 100%;
    		width: 90%;
    		margin: 0 auto;
    		padding: 0;
    		overflow:hidden;
    	}
    	.container .videoCntDiv {
    		margin-bottom: 20px;
    		min-height: 114px;
    	}
    </style>
</head>
<body>
<div class="container clCnt">
    <h3 class="">试听课程级别选择</h3>
    <h4>名侦探柯南</h4>
   <!-- <p class="navbar-text ">
        <span>初级课程</span>
        <span></span>
    </p>-->
    <div class="clearfix videoCntDiv">
        <div class="clIntduc">
            <div id="decription1"></div>
            <input type="hidden" id="courseid1" value=""/>
            <div id="course_list1"></div>
        </div>
        <div class="clImg">
            <a id="img1" href="#"><img id="head_image1" src="../img/course_level/climg.png" alt=""></a>
        </div>
    </div>
    <!--<p class="navbar-text">
        <span>中级课程</span>
        <span></span>
    </p>-->
    <div class="clearfix videoCntDiv">
        <div class="clIntduc">
            <div id="decription2"></div>
            <input type="hidden" id="courseid2" value=""/>
            <div id="course_list2"></div>
        </div>
        <div class="clImg">
            <a id="img2" href="#"><img id="head_image2" src="../img/course_level/climg.png" alt=""></a>
        </div>
    </div>
    <!--<p class="navbar-text">
    <span>高级课程</span>
    <span></span>
</p>-->
    <div class="clearfix videoCntDiv">
    <div class="clIntduc">
        <div id="decription3"></div>
        <input type="hidden" id="courseid3" value=""/>
        <div id="course_list3"></div>
    </div>
    <div class="clImg">
        <a id="img3" href="#"><img id="head_image3" src="../img/course_level/climg.png" alt=""></a>
    </div>
    </div>
</div>
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/template.js"></script>
<script>
    $(document).ready(function () {
        var commentList;

        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_courses_sample.aspx",
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.status == 0) {
                    if (data.courses.length > 0) {
                        for (var i = 0; i < data.courses.length; i++) {
                            if (data.courses[i].level == "初级") {
                                $("#decription1").text(data.courses[i].decription);
                                $("#head_image1").attr("src", data.courses[i].head_image);
                                $("#courseid1").attr("value", data.courses[i].id);
                                getcourse_list1(data.courses[i].id);
                            } else if (data.courses[i].level == "中级") {
                                $("#decription2").text(data.courses[i].decription);
                                $("#head_image2").attr("src", data.courses[i].head_image);
                                $("#courseid2").attr("value", data.courses[i].id);
                                getcourse_list2(data.courses[i].id);
                            } else if (data.courses[i].level == "高级") {
                                $("#decription3").text(data.courses[i].decription);
                                $("#head_image3").attr("src", data.courses[i].head_image);
                                $("#courseid3").attr("value", data.courses[i].id);
                                getcourse_list3(data.courses[i].id);
                            }
                        }
                    }
                } else {
                    alert("接口异常");
                }
            }
        });
    });

    function getcourse_list1(i) {
        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
            data: {"courseid": i},
            dataType: "json",
            success: function (data) {
                inn1(data);
            }
        });
    }

    function getcourse_list2(i) {
        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
            data: {"courseid": i},
            dataType: "json",
            success: function (data) {
                inn2(data);
            }
        });
    }

    function getcourse_list3(i) {
        $.ajax({
            type: "post",
            url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
            data: {"courseid": i},
            dataType: "json",
            success: function (data) {
                inn3(data);
            }
        });
    }

    function inn1(o) {
            commentList = o.lessons;
            //列表模板引擎
            if (commentList.length > 0) {
                var courselist_id = "course_list1";
                var list = commentList;
                var url = $("#" + courselist_id);
                var compiled = $.template($("#tpl1").text());
                if (list.length > 0) {
                    var result = compiled({
                        list: list
                    })
                    url.append($(result));
                }
                $('#btn_cj1').click();
            }
        }

        function inn2(o) {
            commentList = o.lessons;
            //列表模板引擎
            if (commentList.length > 0) {
                var courselist_id = "course_list2";
                var list = commentList;
                var url = $("#" + courselist_id);
                var compiled = $.template($("#tpl2").text());
                if (list.length > 0) {
                    var result = compiled({
                        list: list
                    })
                    url.append($(result));
                }
                $('#btn_zj1').click();
            }
        }

        function inn3(o) {
            commentList = o.lessons;
            //列表模板引擎
            if (commentList.length > 0) {
                var courselist_id = "course_list3";
                var list = commentList;
                var url = $("#" + courselist_id);
                var compiled = $.template($("#tpl3").text());
                if (list.length > 0) {
                    var result = compiled({
                        list: list
                    })
                    url.append($(result));
                }
                $('#btn_gj1').click();
            }
        }
</script>

<script type="text/template" id="tpl1">
    {{ for(var i = 0; i < commentList.length; i++) { }}
    <div class="btn-group" role="group">
        <div class="btnNoone fl" id="btn_cj{{- i+1}}" onclick="change('_cj{{- i+1}}')">{{- i+1}}</div>
        <input type="hidden" id="description_cj{{- i+1}}" value="{{- commentList[i].description}}"/>
        <input type="hidden" id="head_image_cj{{- i+1}}" value="{{- commentList[i].head_image}}"/>
        <input type="hidden" id="lessons_id_cj{{- i+1}}" value="{{- commentList[i].id}}"/>
        <input type="hidden" id="course_id_cj{{- i+1}}" value="{{- commentList[0].course_id}}"/>
        <input type="hidden" id="media_url_cj{{- i+1}}" value=""/>
        <input type="hidden" id="caption_file_url_cj{{- i+1}}" value=""/>
    </div>
    {{ } }}
</script>

<script type="text/template" id="tpl2">
    {{ for(var i = 0; i < commentList.length; i++) { }}
    <div class="btn-group" role="group">
        <div class="btnNoone fl" id="btn_zj{{- i+1}}" onclick="change('_zj{{- i+1}}')">{{- i+1}}</div>
        <input type="hidden" id="description_zj{{- i+1}}" value="{{- commentList[i].description}}"/>
        <input type="hidden" id="head_image_zj{{- i+1}}" value="{{- commentList[i].head_image}}"/>
        <input type="hidden" id="lessons_id_zj{{- i+1}}" value="{{- commentList[i].id}}"/>
        <input type="hidden" id="course_id_zj{{- i+1}}" value="{{- commentList[0].course_id}}"/>
        <input type="hidden" id="media_url_zj{{- i+1}}" value=""/>
        <input type="hidden" id="caption_file_url_zj{{- i+1}}" value=""/>
    </div>
    {{ } }}
</script>

<script type="text/template" id="tpl3">
    {{ for(var i = 0; i < commentList.length; i++) { }}
    <div class="btn-group" role="group">
        <div class="btnNoone fl" id="btn_gj{{- i+1}}" onclick="change('_gj{{- i+1}}')">{{- i+1}}</div>
        <input type="hidden" id="description_gj{{- i+1}}" value="{{- commentList[i].description}}"/>
        <input type="hidden" id="head_image_gj{{- i+1}}" value="{{- commentList[i].head_image}}"/>
        <input type="hidden" id="lessons_id_gj{{- i+1}}" value="{{- commentList[i].id}}"/>
        <input type="hidden" id="course_id_gj{{- i+1}}" value="{{- commentList[0].course_id}}"/>
        <input type="hidden" id="media_url_gj{{- i+1}}" value=""/>
        <input type="hidden" id="caption_file_url_gj{{- i+1}}" value=""/>
    </div>
    {{ } }}
</script>

<script>
    function change(flag) {
            var description = "description" + flag;
            var head_image = "head_image" + flag;
            var lessons = "lessons_id" + flag;
            var course = "course_id" + flag;
            if (flag.indexOf("_cj") != -1) {
                $("#decription1").text($("#" + description).val());
                $("#head_image1").attr("src", $("#" + head_image).val());
                //lessons_id
                var lessons_id = $("#" + lessons).val();
                //course_id
                var course_id = $("#" + course).val();
                $.ajax({
                    type: "post",
                    url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
                    data: {"courseid": course_id},
                    dataType: "json",
                    success: function (data) {
                        if (data.lessons.length > 0) {
                            for (var i = 0; i < data.lessons.length; i++) {
                                if (data.lessons[i].id == lessons_id) {
                                    if (data.lessons[i].medias.length > 0) {
                                        var short_content = data.lessons[i].short_content;
                                        //视频路径
    //                                    var media_url = data.lessons[i].medias[0].media_url;
                                        var media_url;
                                        //视频字幕路径
    //                                    var caption_file_url = data.lessons[i].medias[0].caption_file_url;
                                        var caption_file_url;
                                        //音频路径
                                        var audioUrl;
                                        //音频字幕路径
                                        var audio_caption_file_url;
                                        for(var j = 0; j < data.lessons[i].medias.length ; j++){
                                            if(data.lessons[i].medias[j].type == "video"){
                                                media_url = data.lessons[i].medias[j].media_url;
                                                caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }else if (data.lessons[i].medias[j].type == "audio"){
                                                audioUrl = data.lessons[i].medias[j].media_url;
                                                audio_caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }
                                        }

                                        $("#media_url" + flag).attr("value", media_url);
                                        $("#caption_file_url" + flag).attr("value", caption_file_url);
                                        //为图片动态添加点击事件
                                        $("#head_image1").click(function () {
                                            toVideo(lessons_id, media_url, caption_file_url, "img1", short_content , audioUrl,audio_caption_file_url);
                                        });
                                    }
                                }
                            }
                        }
                    }
                });

            } else if (flag.indexOf("_zj") != -1) {
                $("#decription2").text($("#" + description).val());
                $("#head_image2").attr("src", $("#" + head_image).val());
                //lessons_id
                var lessons_id = $("#" + lessons).val();
                //course_id
                var course_id = $("#" + course).val();
                $.ajax({
                    type: "post",
                    url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
                    data: {"courseid": course_id},
                    dataType: "json",
                    success: function (data) {
                        if (data.lessons.length > 0) {
                            for (var i = 0; i < data.lessons.length; i++) {
                                if (data.lessons[i].id == lessons_id) {
                                    if (data.lessons[i].medias.length > 0) {
                                        var short_content = data.lessons[i].short_content;
                                        //视频路径
    //                                    var media_url = data.lessons[i].medias[0].media_url;
                                        var media_url;
                                        //视频字幕路径
    //                                    var caption_file_url = data.lessons[i].medias[0].caption_file_url;
                                        var caption_file_url;
                                        //音频路径
                                        var audioUrl;
                                        //音频字幕路径
                                        var audio_caption_file_url;
                                        for(var j = 0; j < data.lessons[i].medias.length ; j++){
                                            if(data.lessons[i].medias[j].type == "video"){
                                                media_url = data.lessons[i].medias[j].media_url;
                                                caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }else if (data.lessons[i].medias[j].type == "audio"){
                                                audioUrl = data.lessons[i].medias[j].media_url;
                                                audio_caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }
                                        }

                                        $("#media_url" + flag).attr("value", media_url);
                                        $("#caption_file_url" + flag).attr("value", caption_file_url);
                                        //为图片动态添加点击事件
                                        $("#head_image2").click(function () {
                                            toVideo(lessons_id, media_url, caption_file_url, "img2", short_content , audioUrl,audio_caption_file_url);
                                        });
                                    }
                                }
                            }
                        }
                    }
                });
            } else if (flag.indexOf("_gj") != -1) {
                $("#decription3").text($("#" + description).val());
                $("#head_image3").attr("src", $("#" + head_image).val());
                //lessons_id
                var lessons_id = $("#" + lessons).val();
                //course_id
                var course_id = $("#" + course).val();
                $.ajax({
                    type: "post",
                    url: "https://weixin-new-time-english.chinacloudsites.cn/api/get_lessons_of_course.aspx",
                    data: {"courseid": course_id},
                    dataType: "json",
                    success: function (data) {
                        if (data.lessons.length > 0) {
                            for (var i = 0; i < data.lessons.length; i++) {
                                if (data.lessons[i].id == lessons_id) {
                                    if (data.lessons[i].medias.length > 0) {
                                        var short_content = data.lessons[i].short_content;
                                        //视频路径
    //                                    var media_url = data.lessons[i].medias[0].media_url;
                                        var media_url;
                                        //视频字幕路径
    //                                    var caption_file_url = data.lessons[i].medias[0].caption_file_url;
                                        var caption_file_url;
                                        //音频路径
                                        var audioUrl;
                                        //音频字幕路径
                                        var audio_caption_file_url;
                                        for(var j = 0; j < data.lessons[i].medias.length ; j++){
                                            if(data.lessons[i].medias[j].type == "video"){
                                                media_url = data.lessons[i].medias[j].media_url;
                                                caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }else if (data.lessons[i].medias[j].type == "audio"){
                                                audioUrl = data.lessons[i].medias[j].media_url;
                                                audio_caption_file_url = data.lessons[i].medias[j].caption_file_url;
                                            }
                                        }

                                        $("#media_url" + flag).attr("value", media_url);
                                        $("#caption_file_url" + flag).attr("value", caption_file_url);
                                        //为图片动态添加点击事件
                                        $("#head_image3").click(function () {
                                            toVideo(lessons_id, media_url, caption_file_url, "img3", short_content , audioUrl,audio_caption_file_url);
                                        });
                                    }
                                }
                            }
                        }
                    }
                });
            }
        }


    /**
     * @param a  讲义页面需要的lessonsid
     * @param b  视频URL
     * @param c  字幕URL
     */
function toVideo(a, b, c, d, e , f, g) {
        var storage = window.localStorage;
        storage.setItem("lessons_id", a);
        storage.setItem("media_url", b);
        storage.setItem("caption_file_url", c);
        storage.setItem("short_content", e);
        storage.setItem("audioUrl", f);
        storage.setItem("audio_caption_file_url", g);
        //跳转到视频页面
//        $("#" + d).attr("href", "video视频页面.html");
        $("#" + d).attr("href", "videoShow.aspx");
    }

    function getRootPath() {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPaht = curWwwPath.substring(0, pos);
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }
</script>

</html>