<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="so2.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
</asp:Content>    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-1">

        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="TextBox1">Codigo</label>
                <asp:TextBox ID="txtcodigo" Class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBox1">Nombre</label>
                <asp:TextBox ID="txtnombre" Class="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Guardar" class="btn btn-primary" OnClick="Button1_Click" />
        </div>
        <div class="col-md-5">
            <h4>Listado de Clientes</h4>
            <asp:GridView ID="GridView1" runat="server" Class="table table-striped table-bordered table-condensed" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
            </asp:GridView>
        </div>
        

    </div>



</asp:Content>