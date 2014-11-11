using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class upload : System.Web.UI.Page
    {
        protected HtmlInputFile filMyFile;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (filMyFile.PostedFile != null)
            {
                // File was sent
                // Get a reference to PostedFile object

                HttpPostedFile myFile = filMyFile.PostedFile;

                // Get size of uploaded file

                int nFileLen = myFile.ContentLength;
                // Allocate a buffer for reading of the file

                byte[] myData = new byte[nFileLen];
                // Read uploaded file from the Stream

                myFile.InputStream.Read(myData, 0, nFileLen);
                string file = Server.MapPath(Path.Combine("~/App_Data/testupload.dat"));
                WriteToFile(file, ref myData);

                FileInfo f = new FileInfo(file);
                Label1.Text = "Save to " + file + "<br>Created : " + f.CreationTime.ToString() + "<br>File Size: " + f.Length;
            }
            else
            {
                // No file

            }
        }
        // Writes file to current folder

        private void WriteToFile(string strPath, ref byte[] Buffer)
        {
            // Create a file

            FileStream newFile = new FileStream(strPath, FileMode.Create);

            // Write data to the file

            newFile.Write(Buffer, 0, Buffer.Length);

            // Close file

            newFile.Close();
        }

    }
}