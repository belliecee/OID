using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;

/// <summary>
/// Summary description for CMRCode
/// </summary>
public class CMRCode
{
    public CMRCode()
    {
    }

    public static DataTable GetFullPath(int id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("get_full_path", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters[0].Value = id;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    private static int FindByDotNotation(string oid_str)
    {
        if (!(oid_str.StartsWith("2.16.764.1")))
        {
            return -1;
        }
        if (oid_str.Equals("2.16.764.1"))
            return 1; // it's root node

        string sub_oid = oid_str.Substring("2.16.764.1.".Length);
        string[] oids = sub_oid.Split('.');
        int parent_id = 1;
        int target_node = 0;

        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();

            string sql = "SELECT node_id FROM [node] WHERE primary_int=@node_id AND node_parent_id=@parent";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Clear();
            cmd.Parameters.Add(new SqlParameter("@node_id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@parent", SqlDbType.Int));
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            foreach (string oid in oids)
            {
                cmd.Parameters[0].Value = Convert.ToInt32(oid);
                cmd.Parameters[1].Value = parent_id;

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    target_node = Convert.ToInt32(dt.Rows[0][0]);
                    parent_id = target_node;
                }
                else
                {
                    target_node = 0;
                    break;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        return target_node;
    }
    private static int FindByOIDIRINotation(string oid_str)
    {
        if (!(oid_str.StartsWith("2.16.764.1")))
        {
            return -1;
        }
        if (oid_str.Equals("2.16.764.1"))
            return 1; // it's root node

        string sub_oid = oid_str.Substring("2.16.764.1.".Length);
        string[] oids = sub_oid.Split('.');
        int parent_id = 1;
        int target_node = 0;

        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();

            string sql = "SELECT node_id FROM [node] WHERE primary_int=@node_id AND node_parent_id=@parent";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Clear();
            cmd.Parameters.Add(new SqlParameter("@node_id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@parent", SqlDbType.Int));
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            foreach (string oid in oids)
            {
                cmd.Parameters[0].Value = Convert.ToInt32(oid);
                cmd.Parameters[1].Value = parent_id;

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    target_node = Convert.ToInt32(dt.Rows[0][0]);
                    parent_id = target_node;
                }
                else
                {
                    target_node = 0;
                    break;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        return target_node;
    }
    public static int GetNode(string oid)
    {
        oid = oid.Trim();

        int bad_notation = 0;
        if (oid.Contains('.'))
        {
            // try with dot notation
            return FindByDotNotation(oid);
        }
        else if (oid.Contains('/'))
        {
            // try with OID-IRI notation
            return FindByOIDIRINotation(oid);
        }
        else
        {
            // try with ASN.1 notation
            int n = oid.Length;
            if (n < 2)
                bad_notation++;

            if (bad_notation < 1)
            {
                string begin = oid.Substring(0, 1);
                string end = oid.Substring(n - 1, 1);
                if (begin.Equals("{"))
                {
                    if (end.Equals("}"))
                    {
                        oid = oid.Substring(1, n - 2);
                    }
                    else
                    {
                        bad_notation++;
                    }
                }
                else if (end.Equals("}"))
                {
                    bad_notation++;
                }
            }

            return 0;
        }
    }
    public static DataTable GetNodeByNotation(string id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "get_node";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add(new SqlParameter("@find", SqlDbType.NVarChar, 4000));
            cmd.Parameters[0].Value = id;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetNode(int id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [node] WHERE node_id=" + id;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    //--By BELL --Create Date 3 Nov 2014
    public static DataTable GetNodeSummary(int id) 
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        
        try
        {
            conn.Open();
            string sql = "query_node_summary";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);


            cmd.Parameters.Add(new SqlParameter("@root_id", SqlDbType.Int));
            cmd.Parameters[0].Value = id;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetSearchList(string t)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            string find = "%" + t + "%";
            conn.Open();
            string sql = "SELECT * FROM [node] WHERE (unicode_label LIKE @find ) OR (secondary_id LIKE @find) OR (description LIKE @find) OR (information LIKE @find)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@find", SqlDbType.NVarChar, 200));
            cmd.Parameters[0].Value = find;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int CreateNode(int pid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "create_node";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@pid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@node_id", SqlDbType.Int));

            cmd.Parameters[0].Value = @pid;
            cmd.Parameters[1].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            return Convert.ToInt32(cmd.Parameters[1].Value);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void DeleteNode(int id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "delete_node";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));

            cmd.Parameters[0].Value = id;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateNode(int id, int key, string label, string secondary, string description, string info)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "update_node";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@key", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@label", SqlDbType.NVarChar, 120));
            cmd.Parameters.Add(new SqlParameter("@secondary", SqlDbType.NVarChar, 120));
            cmd.Parameters.Add(new SqlParameter("@desc", SqlDbType.NVarChar, 2000));
            cmd.Parameters.Add(new SqlParameter("@info", SqlDbType.NVarChar, 2000));

            cmd.Parameters[0].Value = id;
            cmd.Parameters[1].Value = key;
            cmd.Parameters[2].Value = label;
            cmd.Parameters[3].Value = secondary;
            cmd.Parameters[4].Value = description;
            cmd.Parameters[5].Value = info;

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateNode(int reqby, int id, string description, string info)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "request_update_node";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqby", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@desc", SqlDbType.NVarChar, 2000));
            cmd.Parameters.Add(new SqlParameter("@info", SqlDbType.NVarChar, 2000));

            cmd.Parameters[0].Value = reqby;
            cmd.Parameters[1].Value = id;
            cmd.Parameters[2].Value = description;
            cmd.Parameters[3].Value = info;

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CreateNode(int regid, int pid, int oidint, string label, string secodary, string ulabel, string info, string desc)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "request_create_node";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@regid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@oidint", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@label", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@secondary", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@ulabel", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@info", SqlDbType.NVarChar, 2000));
            cmd.Parameters.Add(new SqlParameter("@des", SqlDbType.NVarChar, 2000));

            cmd.Parameters[0].Value = regid;
            cmd.Parameters[1].Value = pid;
            cmd.Parameters[2].Value = oidint;
            cmd.Parameters[3].Value = label;
            cmd.Parameters[4].Value = secodary;
            cmd.Parameters[5].Value = ulabel;
            cmd.Parameters[6].Value = info;
            cmd.Parameters[7].Value = desc;

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CreateNode(string file_id, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("request_batch_node", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@file_id", SqlDbType.VarChar, 100));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[0].Value = file_id;
            cmd.Parameters[1].Value = uid;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void ConfirmNode(int reqid, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("request_confirm", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.VarChar, 100));
            cmd.Parameters[0].Value = reqid;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void NotConfirmNode(int reqid, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("request_notconfirm", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.VarChar, 100));
            cmd.Parameters[0].Value = reqid;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int CheckID(int pid, int key, string label, string secondary)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "check_node_available";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@pid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@key", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@label", SqlDbType.NVarChar, 120));
            cmd.Parameters.Add(new SqlParameter("@secondary", SqlDbType.NVarChar, 120));
            cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));

            cmd.Parameters[0].Value = pid;
            cmd.Parameters[1].Value = key;
            cmd.Parameters[2].Value = label;
            cmd.Parameters[3].Value = secondary;
            cmd.Parameters[4].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            int result = Convert.ToInt32(cmd.Parameters[4].Value);
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int CheckOIDEntry(int pid, string secondary, string ulabel)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            int check = 0;

            conn.Open();
            string sql = "SELECT node_id, secondary_id, unicode_label FROM [node] WHERE node_parent_id=" + pid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            int n = dt.Rows.Count;
            for (int i = 0; i < n; i++)
            {
                DataRow dr = dt.Rows[i];
                if (Convert.ToString(dr[1]).Equals(secondary))
                {
                    check = check | 2;
                }
                if (Convert.ToString(dr[2]).Equals(ulabel))
                {
                    check = check | 4;
                }
            }
            return check;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int CheckOIDInt(int pid, int oid_no)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT node_id FROM [node] WHERE node_parent_id=" + pid + " AND primary_int=" + oid_no;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt.Rows.Count;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static string GetParent(int parentid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            int check = 0;

            conn.Open();
            string sql = "SELECT secondary_id FROM [root] WHERE primary_int=" + parentid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            return dt.Rows[0]["secondary_id"].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    // Node Validation
    public static int NodeCheckSecondary(string t)
    {
        if (!char.IsLower(t[0]))
            return 1;

        // try match character set
        if (!Regex.IsMatch(t, @"^[a-zA-Z0-9\-]*$"))
            return 2;

        /* 
        int count = t.Count(f => f == '-');
        if (count > 1)
            return 3;
        */
        if (t.IndexOf("--") >= 0)
            return 3;

        return 0;
    }
    public static int NodeCheckULabel(string t)
    {
        // try match character set
        if (!Regex.IsMatch(t, @"^[a-zA-Z0-9_\-\.\~\u0E00-\u0E7F]*$"))
            return 2;

        if (t.StartsWith("-") || t.EndsWith("-"))
            return 3;

        if (t.Length > 3)
        {
            if (t[2] == '-' && t[3] == '-')
                return 4;
        }

        return 0;
    }
    public static bool CheckEmail(string e)
    {
        return Regex.IsMatch(e, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
    }
    public static bool CheckPhone(string e)
    {
        if (Regex.IsMatch(e, @"^\(?([0-9]{2})\)*-([0-9]{3})*-([0-9]{4})$"))
        {
            return true;
        }
        else
        {
            return false;
        }
           
         
    }
    public static bool CheckMobile(string e)
    {
        if (Regex.IsMatch(e, @"^\(?([0-9]{3})\)*-([0-9]{3})*-([0-9]{4})$"))
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    public static bool CheckEng(string e)
    {

        if (Regex.IsMatch(e, @"^[A-Za-z\.\d\s]*$"))
        {
            return true;
        }
        else
        {
            return false;
        }
           
    }

    public static bool CheckThai(string e)
    {


        if (Regex.IsMatch(e, @"^[\u0E01-\u0E5B\.\d\s]+$"))
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }

    // email
    private static string GetEditKey(int reg_id)
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, 100)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());

        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [register_update] (regid, reg_update_key, reg_created_date, reg_expired_date)" +
                "VALUES (" + reg_id + ",'" + result + "',GETDATE(), DATEADD(DAY, 30, GETDATE()))", conn);

            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

        return result;
    }
    public static DataTable GetRegisterInfo(int regid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [register] WHERE reg_id=" + regid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetRegistrationInfo(int node_raid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [registration] WHERE ra_id=" + node_raid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void NotifyReceived(string reqid, string file_path)
    {
         string subject = "แจ้งยืนยันคำร้องขอลงทะเบียนหมายเลขโอไอดี";

        string template = file_path + "email/received.txt";
        using (StreamReader sr = new StreamReader(template))
        {
            String body = sr.ReadToEnd();

            // replace text by keyword
            DataTable dt = GetRegisterInfo(Convert.ToInt32(reqid));
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string app_name_th = Convert.ToString(dr["app_name_th"]);
                int reg_id = Convert.ToInt32(dr["reg_id"]);
                string org_name = Convert.ToString(dr["org_name_th"]);

                body = body.Replace("<fullname>", app_name_th);
                body = body.Replace("<org_name>", org_name);
                body = body.Replace("<request_id>", reg_id.ToString());

                string to = Convert.ToString(dr["app_email"]);
                SendMail(subject, to, body);
            }
        }
    }
    public static string GetRejectReason(int reject_id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            string reason = "";
            conn.Open();
            string sql = "SELECT reason_desc FROM [reject_reason] WHERE reason_id=" + reject_id;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                reason = dr.GetString(0);
            }
            dr.Close();
            return reason;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void NotifyRequestToChange(string reqid, string file_path, int rejectid, string remark)
    {
        int rid = Convert.ToInt32(reqid);
        string key = GetEditKey(rid);

         string subject = "แจ้งแก้ไขข้อมูลคำร้องขอลงทะเบียนหมายเลขโอไอดี";

        string template = file_path + "email/request_to_change.txt";
        string url_link = ConfigurationManager.AppSettings["WebRegister"] + "/request.aspx?id=" + key;

        using (StreamReader sr = new StreamReader(template))
        {
            String body = sr.ReadToEnd();

            // replace text by keyword
            DataTable dt = GetRegisterInfo(Convert.ToInt32(reqid));
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string app_name_th = Convert.ToString(dr["app_name_th"]);
                int reg_id = Convert.ToInt32(dr["reg_id"]);
                string org_name = Convert.ToString(dr["org_name_th"]);

                body = body.Replace("<fullname>", app_name_th);
                body = body.Replace("<org_name>", org_name);
                body = body.Replace("<request_id>", reg_id.ToString());
                body = body.Replace("<link_edit>", url_link);

                string detail = "";
                if (rejectid > 0)
                {
                    detail = CMRCode.GetRejectReason(rejectid) + "\n";
                }
                detail += remark;

                body = body.Replace("<information>", detail);

                string to = Convert.ToString(dr["app_email"]);
                SendMail(subject, to, body);
            }
        }
    }
    public static void NotifyApprove(int regid, int root_id, string file_path, string u1, string p1, string u2, string p2)
    {
        string subject = "แจ้งอนุมัติคำร้องขอลงทะเบียนหมายเลขโอไอดี";

        string template = file_path + "email/approve1.txt";
        string url_link = ConfigurationManager.AppSettings["WebRegister"] + "Login.aspx";


        using (StreamReader sr = new StreamReader(template))
        {
            String body = sr.ReadToEnd();
            String body1 = body;

            // replace text by keyword
            DataTable dt = GetRegisterInfo(Convert.ToInt32(regid));
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string app_name_th = Convert.ToString(dr["app_name_th"]);
                string contact_name_th = Convert.ToString(dr["contact_name_th"]);
                int reg_id = Convert.ToInt32(dr["reg_id"]);
                string org_name = Convert.ToString(dr["org_name_th"]);

                body = body.Replace("<fullname>", app_name_th);
                body = body.Replace("<org_name>", org_name);
                body = body.Replace("<request_id>", reg_id.ToString());
                body = body.Replace("<userlogin>", u1);
                body = body.Replace("<userpass>", p1);
                body = body.Replace("<linkview>", url_link);

                string to = Convert.ToString(dr["app_email"]);
                SendMail(subject + "-1", to, body);

                body1 = body1.Replace("<fullname>", contact_name_th);
                body1 = body1.Replace("<org_name>", org_name);
                body1 = body1.Replace("<request_id>", reg_id.ToString());
                body1 = body1.Replace("<userlogin>", u2);
                body1 = body1.Replace("<userpass>", p2);
                body1 = body1.Replace("<linkview>", url_link);

                to = Convert.ToString(dr["org_email"]);
                SendMail(subject + "-2", to, body1);
            }


        }
    }
    public static void NotifyReject(int regid, string file_path, string reason)
    {
        string subject = "แจ้งยกเลิกคำร้องขอลงทะเบียนหมายเลขโอไอดี";
        string template = file_path + "email/reject.txt";

        using (StreamReader sr = new StreamReader(template))
        {
            String body = sr.ReadToEnd();

            // replace text by keyword
            DataTable dt = GetRegisterInfo(regid);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string app_name_th = Convert.ToString(dr["app_name_th"]);
                int reg_id = Convert.ToInt32(dr["reg_id"]);
                string org_name = Convert.ToString(dr["org_name_th"]);

                body = body.Replace("<fullname>", app_name_th);
                body = body.Replace("<org_name>", org_name);
                body = body.Replace("<request_id>", regid.ToString());
                body = body.Replace("<reject_reason>", reason);

                string to = Convert.ToString(dr["app_email"]);
                SendMail(subject, to, body);
            }
        }
    }
    public static void SendMail(string subject, string to, string body)
    {
        var client = new SmtpClient("smtp.gmail.com", 587)
        {
            Credentials = new NetworkCredential("oid-ra@npms.or.th", "q8Ajg2GY"),
            EnableSsl = true
        };
        client.Send("oid-ra@npms.or.th", to, subject, body);


        //MailMessage m = new MailMessage();
        //SmtpClient sc = new SmtpClient();
        //try
        //{

        //    m.From = new MailAddress("sale2747@gmail.com");
        //    m.To.Add(to);
        //    m.Subject = subject;
        //    m.IsBodyHtml = true;
        //    m.Body = body;
        //    sc.Host = "smtp.gmail.com";
        //    sc.Port = 587;
        //    sc.Credentials = new System.Net.NetworkCredential("sale2747@gmail.com", "Tiew2747");

        //    sc.EnableSsl = true;

        //    sc.Send(m);

        //}

        //catch (Exception ex)
        //{

        //}


    }

    // Registration Request
    public static void databaseFilePut(SqlCommand cmd, int file_id, string varFilePath)
    {
        byte[] file;
        using (var stream = new FileStream(varFilePath, FileMode.Open, FileAccess.Read))
        {
            using (var reader = new BinaryReader(stream))
            {
                file = reader.ReadBytes((int)stream.Length);
            }
        }
        cmd.CommandText = "DELETE FROM register_document_file WHERE file_id=" + file_id;
        cmd.ExecuteNonQuery();

        cmd.CommandText = "INSERT INTO register_document_file(file_id, file_data) VALUES (@id, @data)";
        cmd.Parameters.Clear();
        cmd.Parameters.Add("@id", SqlDbType.Int);
        cmd.Parameters.Add("@data", SqlDbType.VarBinary, file.Length);
        cmd.Parameters[0].Value = file_id;
        cmd.Parameters[1].Value = file;

        cmd.ExecuteNonQuery();
    }
    public static DataTable GetRequest(string id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM register INNER JOIN [registration_status] ON reg_status=status_id WHERE reg_id= " + id;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetRequestByKey(string id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT register.*, reg_expired_date FROM register INNER JOIN [register_update] ON[register].[reg_id] = [register_update].[regid] WHERE reg_update_key = @id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@id", SqlDbType.VarChar, 2000);
            cmd.Parameters[0].Value = id;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static bool CheckDuplicateOIDInfo(OIDRequest req)
    {
        string sql = "";
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {            
            conn.Open();
            sql = "SELECT [reg_id] FROM [register] ";
            sql = sql + " WHERE  [app_name_th] = '" + req.nameTh + "'";
            sql = sql + " and   [app_name_en] = '"+ req.nameEn + "'";
            sql = sql + " and   [app_email] = '" + req.email + "'";           
            sql = sql + " and   [oid_request_secondary]= '" + req.oidSecondary + "'";
            sql = sql + " and   [oid_request_nonint_label]    = '" + req.oidUnicodeLabel + "'";
            sql = sql + " and   [oid_request_desc] = '" + req.oidDescription + "'";
            sql = sql + " and   [contact_name_th] = '" + req.contactNameTh + "'";
            sql = sql + " and   [contact_name_en] = '" + req.contactNameEn + "'";
            sql = sql + " and   [contact_email] = '" + req.contactEmail + "'"; 
            sql = sql + " and   [contact_phone]  = '" + req.contactPhone + "'";
            sql = sql + " and   oid_request_parent = '" + req.parent +"'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            int n = dt.Rows.Count;
            if (n > 0)
            {
                return true;
            }
            return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int SubmitRequest(OIDRequest req)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            /*
            string sql = "INSERT INTO register (app_name_th, app_name_en, app_email, " +
                "org_name_th, org_name_en, org_ministry, org_email, org_website, org_phone, org_fax, org_address, " +
                "oid_request_secondary, oid_request_nonint_label, oid_request_info, oid_request_desc, oid_request_parent," +
                "contact_name_th, contact_name_en, contact_email, contact_phone, contact_address)" +
                "VALUES (@name1, @name2, @email, @orgname1, @orgname2, @ministry, @orgemail, @website, @orgphone, @orgfax, @orgaddr," +
                "@req_secondary, @req_label, @req_info, @req_desc, @req_parent," +
                "@contact_name1, @contact_name2, @contact_email, @contact_phone, @contact_address)";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 500));
            //cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgname1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgname2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@ministry", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgemail", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@website", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@orgphone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgfax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgaddr", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@req_secondary", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@req_label", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@req_info", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_desc", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_parent", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@contact_name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_email", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@contact_phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@contact_address", SqlDbType.NVarChar, 1000)); */

            SqlCommand cmd = new SqlCommand("create_registration", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 500));
            //cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgname1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgname2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@ministry", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgemail", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@website", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@orgphone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgfax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgaddr", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@req_secondary", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@req_label", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@req_info", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_desc", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_parent", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@contact_name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_email", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@contact_phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@contact_address", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));

            cmd.Parameters[0].Value = req.nameTh;
            cmd.Parameters[1].Value = req.nameEn;
            cmd.Parameters[2].Value = req.email;
            //cmd.Parameters[2].Value = req.phone;
            cmd.Parameters[3].Value = req.orgNameTh;
            cmd.Parameters[4].Value = req.orgNameEn;
            cmd.Parameters[5].Value = req.orgMinistry;
            cmd.Parameters[6].Value = req.orgEmail;
            cmd.Parameters[7].Value = req.orgWebSite;
            cmd.Parameters[8].Value = req.orgPhone;
            cmd.Parameters[9].Value = req.orgFax;
            cmd.Parameters[10].Value = req.orgAddress;
            cmd.Parameters[11].Value = req.oidSecondary;
            cmd.Parameters[12].Value = req.oidUnicodeLabel;
            cmd.Parameters[13].Value = req.oidInformation;
            cmd.Parameters[14].Value = req.oidDescription;
            cmd.Parameters[15].Value = req.parent;
            cmd.Parameters[16].Value = req.contactNameTh;
            cmd.Parameters[17].Value = req.contactNameEn;
            cmd.Parameters[18].Value = req.contactEmail;
            cmd.Parameters[19].Value = req.contactPhone;
            cmd.Parameters[20].Value = "";
            cmd.Parameters[21].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            int id = Convert.ToInt32(cmd.Parameters[21].Value);
            return id;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CommitRequest(string reqid, string file_path, string doc_path)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [register] SET reg_status=10 WHERE reg_id=" + reqid, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

            cmd.CommandText = "INSERT INTO [register_log] (act_date, act_regid, act_action_id, act_remark, act_by) VALUES (GETDATE()," +
                reqid + ",1000, 'USER SUBMITTED REGISTRATION INFO', 100000)";
            cmd.ExecuteNonQuery();

            // move document from temp to data
            cmd.CommandText = "SELECT doc_id, doc_file_name2 FROM [register_document] WHERE doc_reqid=" + reqid;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            int n = dt.Rows.Count;
            for (int i = 0; i < n; i++)
            {
                int fid = Convert.ToInt32(dt.Rows[i][0]);
                string fname = Convert.ToString(dt.Rows[i][1]);
                string sourceFile = file_path + "/temp/" + fname;
                //string destinationFile = file_path + "/docs/" + fname;
                string destinationFile = doc_path + fname;
                //System.IO.File.Move(sourceFile, destinationFile);
                System.IO.File.Copy(sourceFile, destinationFile, true);


                // copy file to database
                //databaseFilePut(cmd, fid, sourceFile);
            }

            // notify email
            NotifyReceived(reqid, file_path);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateRequest(int reqid, OIDRequest req)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "update_request";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@req_id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@orgname1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgname2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@ministry", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@orgemail", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@website", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@orgphone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgfax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@orgaddr", SqlDbType.NVarChar, 1000));

            cmd.Parameters.Add(new SqlParameter("@contact_name1", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_name2", SqlDbType.NVarChar, 240));
            cmd.Parameters.Add(new SqlParameter("@contact_email", SqlDbType.NVarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@contact_phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@contact_address", SqlDbType.NVarChar, 1000));

            cmd.Parameters.Add(new SqlParameter("@req_secondary", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@req_label", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@req_info", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_desc", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@req_parent", SqlDbType.Int));

            cmd.Parameters[0].Value = reqid;
            cmd.Parameters[1].Value = req.nameTh;
            cmd.Parameters[2].Value = req.nameEn;
            cmd.Parameters[3].Value = req.email;
            cmd.Parameters[4].Value = req.orgNameTh;
            cmd.Parameters[5].Value = req.orgNameEn;
            cmd.Parameters[6].Value = req.orgMinistry;
            cmd.Parameters[7].Value = req.orgEmail;
            cmd.Parameters[8].Value = req.orgWebSite;
            cmd.Parameters[9].Value = req.orgPhone;
            cmd.Parameters[10].Value = req.orgFax;
            cmd.Parameters[11].Value = req.orgAddress;

            cmd.Parameters[12].Value = req.contactNameTh;
            cmd.Parameters[13].Value = req.contactNameEn;
            cmd.Parameters[14].Value = req.contactEmail;
            cmd.Parameters[15].Value = req.contactPhone;
            cmd.Parameters[16].Value = req.contactAddress;

            cmd.Parameters[17].Value = req.oidSecondary;
            cmd.Parameters[18].Value = req.oidUnicodeLabel;
            cmd.Parameters[19].Value = req.oidInformation;
            cmd.Parameters[20].Value = req.oidDescription;
            cmd.Parameters[21].Value = req.parent;

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    private static string GetRandomString2(int size)
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, size)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());
        return result;
    }
    public static int GetRandomNumber(int maxNumber)
    {
        if (maxNumber < 1)
            throw new System.Exception("The maxNumber value should be greater than 1");
        byte[] b = new byte[4];
        new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
        int seed = (b[0] & 0x7f) << 24 | b[1] << 16 | b[2] << 8 | b[3];
        System.Random r = new System.Random(seed);
        return r.Next(1, maxNumber);
    }
    public static string GetRandomString(int length)
    {
        string[] array = new string[54]
	    {
		    "0","2","3","4","5","6","8","9",
		    "a","b","c","d","e","f","g","h","j","k","m","n","p","q","r","s","t","u","v","w","x","y","z",
		    "A","B","C","D","E","F","G","H","J","K","L","M","N","P","R","S","T","U","V","W","X","Y","Z"
	    };
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        for (int i = 0; i < length; i++) sb.Append(array[GetRandomNumber(53)]);
        return sb.ToString();
    }
    public static void FinalizeRequest(int regid, string file_path, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("finalize_request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@regid", SqlDbType.Int);
            cmd.Parameters.Add("@uid", SqlDbType.Int);
            cmd.Parameters.Add("@root_id", SqlDbType.Int);
            cmd.Parameters[0].Value = regid;
            cmd.Parameters[1].Value = uid;
            cmd.Parameters[2].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            int new_node = Convert.ToInt32(cmd.Parameters[2].Value);

            // create user
            cmd.CommandText = "INSERT INTO [registration_user] (node_root, gid, status, username, password, create_date) " +
                "VALUES (" + new_node + ",@gid, 1, @u, @p, GETDATE())";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@gid", SqlDbType.Int);
            cmd.Parameters.Add("@u", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@p", SqlDbType.VarChar, 100);

            string u1 = GetRandomString(8);
            string p1 = GetRandomString(8);
            cmd.Parameters[0].Value = 1; // user L1
            cmd.Parameters[1].Value = u1;
            cmd.Parameters[2].Value = p1;
            cmd.ExecuteNonQuery();

            string u2 = GetRandomString(8);
            string p2 = GetRandomString(8);
            cmd.Parameters[0].Value = 2; // user L1
            cmd.Parameters[1].Value = u2;
            cmd.Parameters[2].Value = p2;
            cmd.ExecuteNonQuery();

            // notify email
            NotifyApprove(regid, new_node, file_path, u1, p1, u2, p2);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    // Node Request Batch
    public static void LoadRequest(int uid, string file_id, DataTable dt)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "INSERT INTO node_request_batch(batch_file, uid, batch_item, parent_id, parent_node_id, primary_int, label_int, secondary_id, label_non_int, description, information) " +
                "VALUES ('" + file_id + "', " + uid + ", @no, @parent_id, -1, @primary_int, @label_int, @secondary, @label, @desc, @info)";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.Add(new SqlParameter("@no", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@parent_id", SqlDbType.NVarChar, 2000));
            cmd.Parameters.Add(new SqlParameter("@primary_int", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@label_int", SqlDbType.NVarChar, 10));
            cmd.Parameters.Add(new SqlParameter("@secondary", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@label", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@desc", SqlDbType.NVarChar, 4000));
            cmd.Parameters.Add(new SqlParameter("@info", SqlDbType.NVarChar, 4000));

            int n = dt.Rows.Count;
            for (int i = 0; i < n; i++)
            {
                DataRow dr = dt.Rows[i];
                cmd.Parameters[0].Value = i + 1;
                cmd.Parameters[1].Value = Convert.ToString(dr[0]); // parent
                cmd.Parameters[2].Value = Convert.ToString(dr[1]); // primary_int
                cmd.Parameters[3].Value = Convert.ToString(dr[2]); // integer_unicode_label
                cmd.Parameters[4].Value = Convert.ToString(dr[3]); // secondary_id
                cmd.Parameters[5].Value = Convert.ToString(dr[4]); // non_integer_unicode_label
                cmd.Parameters[6].Value = Convert.ToString(dr[5]); // description
                cmd.Parameters[7].Value = Convert.ToString(dr[6]); // information
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CompileRequest(int root, string batch_id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            // Load node structure
            /*            
            SqlCommand cmd = new SqlCommand("get_node_structure", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.Add(new SqlParameter("@file_id", SqlDbType.VarChar, 1000));
            cmd.Parameters[0].Value = batch_id;
            */
            SqlCommand cmd = new SqlCommand("get_sub_node", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", root);
            DataTable dtHome = new DataTable();
            da.Fill(dtHome);


            // checking pending request one by one with node structure.
            cmd.CommandText = "SELECT * FROM [node_request_batch] WHERE batch_file = '" + batch_id + "' ORDER BY batch_item";
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.CommandText = "UPDATE [node_request_batch] SET parent_node_id=@pid, item_status=@status WHERE batch_file = '" + batch_id + "' AND batch_item=@item_no";
            cmd.Parameters.Clear();
            cmd.Parameters.Add(new SqlParameter("@pid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@item_no", SqlDbType.Int));

            int n = dt.Rows.Count;
            for (int i = 0; i < n; i++)
            {
                DataRow dr = dt.Rows[i];
                string pidref = Convert.ToString(dr["parent_id"]);
                string find = "full_path = '" + pidref + "'";
                int pid = -1;
                int status = 0;

                // check dupplicate entry in current list
                DataRow[] entry = dt.Select("parent_id = '" + pidref + "' AND primary_int = " + Convert.ToInt32(dr["primary_int"]));
                if (entry.Length > 1)
                {
                    status = status | 256;
                }

                // checking parent existing
                DataRow[] parent = dtHome.Select(find);
                for (int j = 0; j < parent.Length; j++)
                {
                    pid = Convert.ToInt32(parent[j]["node_id"]);
                    string refname = Convert.ToString(parent[j]["notation2"]) + "." + Convert.ToString(parent[j]["primary_int"]);
                    if (refname.Equals("pidref"))
                        break;
                }
                if (pid < 1)
                {
                    status = status | 1;
                }

                // checking primary int
                int label_int = -1;
                if (Int32.TryParse(Convert.ToString(dr["label_int"]), out label_int))
                {
                    if (label_int == Convert.ToInt32(dr["primary_int"]))
                        label_int = Convert.ToInt32(dr["primary_int"]);
                }
                if (label_int < 0)
                {
                    status = status | 2;  // label_int does not match to primary_int
                }

                // check dupplicate primary int/secondary/ulabel under same parent;                
                string secondary_id = Convert.ToString(dr["secondary_id"]);
                if (NodeCheckSecondary(secondary_id) > 0)
                {
                    status = status | 64; // secondary not conform standard
                }

                string ulabel = Convert.ToString(dr["label_non_int"]);
                if (NodeCheckULabel(ulabel) > 0)
                {
                    status = status | 128; // secondary not conform standard
                }


                if (pid > 0)
                {
                    DataRow[] node = dtHome.Select("node_parent_id=" + pid);
                    for (int j = 0; j < node.Length; j++)
                    {
                        int node_id = Convert.ToInt32(node[j]["primary_int"]);
                        string node_ulabel = Convert.ToString(node[j]["unicode_label"]);
                        string node_secondary = Convert.ToString(node[j]["secondary_id"]);

                        if (node_id == label_int)
                        {
                            status = status | 8; // primary int dupplicate in the same row
                        }
                        if (secondary_id != string.Empty)
                        {
                            if (secondary_id == node_secondary)
                                status = status | 16; // secondary dupplicate in the same row
                        }
                        if (ulabel != string.Empty)
                        {
                            if (ulabel == node_ulabel)
                                status = status | 32; // unicode_label dupplicate in the same row
                        }
                    }
                }

                cmd.Parameters[0].Value = pid;
                cmd.Parameters[1].Value = status;
                cmd.Parameters[2].Value = Convert.ToInt32(dr["batch_item"]);
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetRequest(int id, string batch_id)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [node_request_batch] WHERE batch_file = '" + batch_id + "' ORDER BY batch_item";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UploadDocument(int reqid, int doc_type, string file_name, string new_name)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("request_save_file", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@req_id", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@doc_type", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@name1", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@name2", SqlDbType.NVarChar, 1000));
            cmd.Parameters[0].Value = reqid;
            cmd.Parameters[1].Value = doc_type;
            cmd.Parameters[2].Value = file_name;
            cmd.Parameters[3].Value = new_name;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void DeleteDocument(int fileid, string filename)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [register_document] WHERE doc_id = " + fileid, conn);
            cmd.ExecuteNonQuery();

            // delete actual file
            System.IO.File.Delete(filename);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }


    public static int Login(string u, string p, string ip)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "sp_login";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@ip", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[0].Value = u;
            cmd.Parameters[1].Value = p;
            cmd.Parameters[2].Value = ip;
            cmd.Parameters[3].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            int uid = Convert.ToInt32(cmd.Parameters[3].Value);
            return uid;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int StaffLogin(string u, string p, string ip, out int gid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "sp_login_staff";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@ip", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@gid", SqlDbType.Int));
            cmd.Parameters[0].Value = u;
            cmd.Parameters[1].Value = p;
            cmd.Parameters[2].Value = ip;
            cmd.Parameters[3].Direction = ParameterDirection.Output;
            cmd.Parameters[4].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            int uid = Convert.ToInt32(cmd.Parameters[3].Value);
            gid = Convert.ToInt32(cmd.Parameters[4].Value);

            return uid;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static int CheckUserName(int uid, string u)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [registration_user] WHERE (NOT (uid=" + uid + ")) AND [username]=@name"; ;
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 1000));
            cmd.Parameters[0].Value = u;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt.Rows.Count;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateUserName(int uid, string u, string p)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "UPDATE [registration_user] SET [username]=@u, [password]=@p, first_login=GETDATE() WHERE [uid]=" + uid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@u", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@p", SqlDbType.NVarChar, 1000));
            cmd.Parameters[0].Value = u;
            cmd.Parameters[1].Value = p;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateUserName(int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "UPDATE [registration_user] SET first_login=GETDATE() WHERE [uid]=" + uid;
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static DataTable GetUserInfo(int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "SELECT * FROM [registration_user] INNER JOIN [node] ON [registration_user].[node_root] = [node].[node_id] " +
                "INNER JOIN [registration] ON [node].[node_raid] = [registration].[ra_id] WHERE [uid] = @uid";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[0].Value = uid;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }


    // admin 
    private static Hashtable GetStateAction()
    {
        Hashtable h = new Hashtable();
        h.Add(20, 1001); // 1001 -> 20
        h.Add(11, 1002); // 1002 -> 11
        h.Add(12, 1007); // 1007 -> 12
        h.Add(40, 1008); // 1008 -> 40
        h.Add(30, 1003);
        h.Add(22, 1004);
        h.Add(31, 1005);
        h.Add(32, 1006);

        return h;
    }
    public static void AssignOID(int reqid, int oidint)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "UPDATE register SET reg_assign_oid_no=" + oidint + " WHERE reg_id=" + reqid;

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void UpdateStatus(int rid, int uid, int rejectid, string remark, int status)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "UPDATE register SET reg_status=" + status + " WHERE reg_id=" + rid;

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

            Hashtable h = GetStateAction();
            int action = Convert.ToInt32(h[status]);

            cmd.CommandText = "INSERT INTO register_log(act_date,act_regid, act_action_id, act_reject_id, act_remark, act_by) " +
                "VALUES (GETDATE(), " + rid + "," + action + "," + rejectid + ",@remark," + uid + ")";
            cmd.Parameters.Add(new SqlParameter("@remark", SqlDbType.NVarChar, 2000));
            cmd.Parameters[0].Value = remark;
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void DeleteNodeUpdate(int uid, ArrayList a)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "DELETE FROM [node_update] WHERE request_id=@reqid";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));
            foreach (object __o in a)
            {
                int id = (int)__o;
                // loop body
                cmd.Parameters[0].Value = id;
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CommitNodeUpdate(int uid, ArrayList a)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("commit_update_node", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[1].Value = 1;
            foreach (object __o in a)
            {
                int id = (int)__o;
                // loop body
                cmd.Parameters[0].Value = id;
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void DeleteNodeInsert(int uid, ArrayList a)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            string sql = "DELETE FROM [node_request] WHERE request_id=@reqid";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));
            foreach (object __o in a)
            {
                int id = (int)__o;
                // loop body
                cmd.Parameters[0].Value = id;
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CommitNodeInsert(int uid, ArrayList a)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("commit_insert_node", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[1].Value = 1;
            foreach (object __o in a)
            {
                int id = (int)__o;
                // loop body
                cmd.Parameters[0].Value = id;
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

    }
    public static void DeleteNodeRequest(int reqid, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [node_request] WHERE request_id=" + reqid, conn);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "DELETE FROM [node_request_entry] WHERE request_id=" + reqid;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void CommitNodeInsert(int reqid, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("commit_insert_node", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reqid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters[0].Value = reqid;
            cmd.Parameters[1].Value = uid;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void DeleteRequest(int reqid, int uid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [register] WHERE reg_id=" + reqid, conn);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
}

public class OIDRequest
{
    public string nameTh;
    public string nameEn;
    public string email;
    public string phone;

    public string contactNameTh;
    public string contactNameEn;
    public string contactEmail;
    public string contactPhone;
    public string contactAddress;

    public string orgNameTh;
    public string orgNameEn;
    public string orgMinistry;
    public string orgEmail;
    public string orgWebSite;
    public string orgPhone;
    public string orgFax;
    public string orgAddress;

    public string oidSecondary;
    public string oidUnicodeLabel;
    public string oidDescription;
    public string oidInformation;

    public int parent;
}