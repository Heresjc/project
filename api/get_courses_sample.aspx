<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Util.GetSafeRequestValue(Request, "sandbox", "1").Trim().Equals("1"))
        {
            Response.Write("{\"status\": 0, \"courses\":[" 
                +  "{\"course_id\": 1, \"title\": \"英语阅读入门\", \"description\": \"学期介绍介绍介绍balabala\", \"head_image\": \"http://www.abc.com/xxx.jpg\", \"sort\": \"美食篇\", \"level\": \"入门\", \"teacher\": \"Tom Cat\", \"order\": 10},"
                +  "{\"course_id\": 2, \"title\": \"英语阅读提高\", \"description\": \"发现狂野澳洲\", \"head_image\": \"http://www.abc.com/yyy.jpg\", \"sort\": \"户外篇\", \"level\": \"提高\", \"teacher\": \"Mickey Mouse\", \"order\": 20}"
                + "]}");
        }
    }
</script>