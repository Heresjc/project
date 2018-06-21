<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Util.GetSafeRequestValue(Request, "sandbox", "1").Trim().Equals("1"))
        {
            
            Response.Write("{\"status\": 0, \"lessons\": ["
                + "{\"id\": 1, \"title\": \"第一课\", \"description\": \"内容内容balabala\", \"head_image\": \"http://www.abc.com/lesson1.jpg\", \"sort\": 0, \"show\": 1}" 
                + "]}");

        }
    }
</script>