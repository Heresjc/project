using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Lesson
/// </summary>
public class Lesson
{

    public DataRow _fields;

    public Lesson()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static Handout[] GetHandouts(int lessonId)
    {
        DataTable dt = DBHelper.GetDataTable(" select * from handout where lesson_id = " + lessonId.ToString() + " order by sort ");
        Handout[] handoutArray = new Handout[dt.Rows.Count];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            handoutArray[i] = new Handout();
            handoutArray[i]._fields = dt.Rows[i];
        }
        return handoutArray;
    }
}