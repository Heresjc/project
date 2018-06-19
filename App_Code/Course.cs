using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Course
/// </summary>
public class Course
{
    public DataRow _fields;

    public Course()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public double Price
    {
        get
        {
            return double.Parse(_fields["price"].ToString().Trim());
        }
    }

    public int Show
    {
        get
        {
            return int.Parse(_fields["show"].ToString().Trim());
        }
    }

    

    public static Course[] GetAllCourses()
    {
        DataTable dt = DBHelper.GetDataTable(" select * from course ");
        Course[] cArr = new Course[dt.Rows.Count];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cArr[i] = new Course();
            cArr[i]._fields = dt.Rows[i];
        }
        return cArr;
    }
}