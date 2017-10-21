﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarsDemo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <br />
    <br />

    <asp:Label id="labelManufactorer" AssociatedControlId="Manufactorer" Text="Manufacturer:" runat="server" />
    <asp:DropDownList ID="Manufactorer" runat="server"></asp:DropDownList>
    <br />
    <br />

    <asp:Label id="labelModel" AssociatedControlId="Model" Text="Model" runat="server" />
    <asp:TextBox ID="Model" runat="server"></asp:TextBox>

    <br />
    <br />




    <asp:RadioButton ID="GasolineFuel" Text="Gasoline" GroupName="Fuel" runat="server" />



   
    <asp:RadioButton ID="DieselFuel" Text="Diesel" GroupName="Fuel" runat="server" />

    <asp:RadioButton ID="GasFuel" Text="Gas" GroupName="Fuel" runat="server" />
    <br />
    <br />

       <asp:Label id="labelDate" AssociatedControlId="Date" Text="Date" runat="server" />
    <asp:TextBox ID="Date" runat="server"></asp:TextBox>

    <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="Date" ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
    <br />
    <br />




    <asp:CheckBox ID="IsNew" Text="New" runat="server" />
    <br />
    <br />

     <asp:Label id="labelMileage" AssociatedControlId="Mileage" Text="Mileage" runat="server" />
    <asp:TextBox ID="Mileage" runat="server"></asp:TextBox>

    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="Mileage" ErrorMessage="Value must be a whole number" />


    <br />
    <br />

    <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" />

    <br />  
    <br />  

    <asp:gridview id="GridViewCars" runat="server" backcolor="White" bordercolor="#E7E7FF"
    borderstyle="None" borderwidth="1px" cellpadding="3" font-names="Calibri" font-size="Larger"
    gridlines="Horizontal">
<AlternatingRowStyle BackColor="#F7F7F7" />
<FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
<SortedAscendingCellStyle BackColor="#F4F4FD" />
<SortedAscendingHeaderStyle BackColor="#5A4C9D" />
<SortedDescendingCellStyle BackColor="#D8D8F0" />
<SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:gridview>

</asp:Content>
