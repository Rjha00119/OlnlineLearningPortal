<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs"
    Inherits="AboutUs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        p
        {
            color: Black;
            font-size: 15px;
            font-family: Verdana;
            padding: 5px;
            text-align: justify;
        }
    </style>
    <div style="width: 80%; text-align: center; margin-left: 150px;">
        <table>
            <tr>
                <td>
                    <h1 align="left" style="color: Black">
                        About Us
                    </h1>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <img src="images/aboutLearn.jpg" alt="" style="height: 300px; width: 1000px" />
                </td>
            </tr>
            <tr>
                <td align="justify">
                    <p>
                        ONLINE LEARNING is a programme initiated by us and designed to achieve the three
                        cardinal principles of Education Policy viz., access, equity and quality. The objective
                        of this effort is to take the best teaching learning resources to all, including
                        the most disadvantaged. ONLINE LEARNING seeks to bridge the digital divide for students
                        who have hitherto remained untouched by the digital revolution and have not been
                        able to join the mainstream of the knowledge economy.
                    </p>
                    <p>
                        This is done through an indigenous developed IT platform that facilitates hosting
                        of all the courses, taught in classrooms from 12th class till post-graduation to
                        be accessed by anyone, anywhere at any time. All the courses are interactive, prepared
                        by the best teachers in the country and are available, free of cost to the residents
                        in India. More than 1,000 specially chosen faculty and teachers from across the
                        Country have participated in preparing these courses.
                    </p>
                   
                  
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
