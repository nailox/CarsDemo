<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarsDemo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <br />
    <br />

    <asp:Label id="labelManufacturer" AssociatedControlId="Manufacturer" Text="Manufacturer:" runat="server" />
    <asp:DropDownList ID="Manufacturer" runat="server"></asp:DropDownList>
    <br />
    <br />

    <asp:Label id="labelModel" AssociatedControlId="Model" Text="Model" runat="server" />
    <asp:TextBox ID="Model" MaxLength="200" runat="server"></asp:TextBox>

    <br />
    <br />


    <asp:RadioButton ID="GasolineFuel" Text="Gasoline" GroupName="Fuel" runat="server" />

    <asp:RadioButton ID="DieselFuel" Text="Diesel" GroupName="Fuel" runat="server" />

    <asp:RadioButton ID="GasFuel" Text="Gas" GroupName="Fuel" runat="server" />
    <br />
    <br />

       <asp:Label id="labelDate" AssociatedControlId="Date" Text="Date" runat="server" />
    <asp:TextBox ID="Date" MaxLength="10" runat="server"></asp:TextBox>

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



    <asp:GridView ID="GridViewCars" runat="server" AutoGenerateColumns="false" DataKeyNames="CarID"
 OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
<Columns>
    <asp:TemplateField HeaderText="Manufacturer" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblManufacturer" runat="server" Text='<%# Eval("Manufacturer") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Manufacturer" runat="server" Text='<%# Eval("Manufacturer") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Model" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblModel" runat="server" Text='<%# Eval("Model") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Model" runat="server" MaxLength="200" Text='<%# Eval("Model") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <asp:TemplateField HeaderText="Fuel" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblFuel" runat="server" Text='<%# Eval("Fuel") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Fuel" runat="server" Text='<%# Eval("Fuel") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

         <asp:TemplateField HeaderText="Date" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Date" runat="server" MaxLength="10" Text='<%# Eval("Date") %>'></asp:TextBox>
             <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="Date" ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
        </EditItemTemplate>
    </asp:TemplateField>

         <asp:TemplateField HeaderText="New" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblIsNew" runat="server" Text='<%# Eval("IsNew") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:CheckBox ID="IsNew" runat="server" Text='<%# Eval("IsNew") %>'></asp:CheckBox>
        </EditItemTemplate>
    </asp:TemplateField>

         <asp:TemplateField HeaderText="Mileage" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblMileage" runat="server" Text='<%# Eval("Mileage") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Mileage" runat="server" Text='<%# Eval("Mileage") %>'></asp:TextBox>
              <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="Mileage" ErrorMessage="Value must be a whole number" />
        </EditItemTemplate>

    </asp:TemplateField>

    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>
</Columns>
</asp:GridView>


</asp:Content>
