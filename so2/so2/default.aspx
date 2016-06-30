<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="so2.Index" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
    <style>
        .transparente {
            background: #d9cdcd;
            opacity: 0.5;
            filter: alpha(opacity=50);
            margin: auto;
        }
    </style>
</asp:Content>    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>

                    
                
    <div class="row">
        <div class="col-md-3">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:DropDownList ID="cb_dr" runat="server" CssClass="form-control" AppendDataBoundItems="true" Width="171px" OnSelectedIndexChanged="cb_dr_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="0">Seleccione un Dr.</asp:ListItem>
                </asp:DropDownList>
            <br />
            
            <br />
            
            
            <asp:Button ID="Button1" runat="server" Text="Button" class="hidden"/>
                        <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button1"
                         BackgroundCssClass="transparente" PopupControlID="Panel2" OkControlID="Link_x" CancelControlID="LinkButton5">
                        </asp:ModalPopupExtender>
            <asp:Panel ID="Panel2" runat="server">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:LinkButton ID="Link_x" runat="server"><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lbId_reserva" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbFecha" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="txt_nombre_paciente" runat="server" CssClass="form-control" placeholder="Ingrese Nombre" Width="185px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_telefono_paciente" runat="server" CssClass="form-control" placeholder="Ingrese telefono" Width="184px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_tipo_paciente" runat="server" CssClass="form-control" placeholder="Ingrese tipo paciente" Width="184px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_medio_pago" runat="server" CssClass="form-control" placeholder="Ingrese medio de pago" Width="183px"></asp:TextBox><br />
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="LinkButton4_agregar" runat="server" OnClick="LinkButton4_agregar_Click1" CssClass="btn btn-primary"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-danger"><i class="fa fa-ban"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <asp:Button ID="Button2" runat="server" Text="Button" class="hidden"/>
            <asp:ModalPopupExtender ID="ModalPopupExtender1" PopupControlID="Panel1" OkControlID="salir_editar" runat="server"
                TargetControlID="Button2" CancelControlID="cancelar_editar" BackgroundCssClass="transparente"></asp:ModalPopupExtender>

            <asp:Panel ID="Panel1" runat="server">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:LinkButton ID="salir_editar" runat="server"><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lbID_editar" runat="server" Visible="false" Text="Label"></asp:Label>
                            <asp:Label ID="lb_fecha_editar" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="txt_nombre_editar" runat="server" CssClass="form-control" placeholder="Ingrese Nombre" Width="185px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_telefono_editar" runat="server" CssClass="form-control" placeholder="Ingrese telefono" Width="184px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_tipo_editar" runat="server" CssClass="form-control" placeholder="Ingrese tipo paciente" Width="184px"></asp:TextBox><br />
                            <asp:TextBox ID="txt_medioPago_editar" runat="server" CssClass="form-control" placeholder="Ingrese medio de pago" Width="183px"></asp:TextBox><br />
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="agregar_editar" runat="server" OnClick="agregar_editar_Click" CssClass="btn btn-primary"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                            <asp:LinkButton ID="cancelar_editar" runat="server" CssClass="btn btn-danger"><i class="fa fa-ban"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </asp:Panel>


            <asp:Button ID="Button3" runat="server" Text="Button" class="hidden" />
            <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel3" OkControlID="Link_salir_eliminar" 
                TargetControlID="Button3" CancelControlID="Link_cancelar_eliminar" BackgroundCssClass="transparente"></asp:ModalPopupExtender>
            <asp:Panel ID="Panel3" runat="server">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:LinkButton ID="Link_salir_eliminar" runat="server">X</asp:LinkButton>
                        </div>
                        <div class="modal-body">
                            <h4>¿Está seguro que desea eliminar?</h4>
                                        <asp:Label ID="Label7" runat="server" Visible="false" Text="Label">
                                        </asp:Label>
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="Link_agregar_eliminar" runat="server" >Agregar</asp:LinkButton>
                            <asp:LinkButton ID="Link_cancelar_eliminar" runat="server">Cancelar</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <br />
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged" ClientIDMode="Static">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </div>
   
           <div class="col-md-0">

           </div>
        <div class="col-md-9">
            <asp:Label ID="lb_grid" runat="server" Text=" " CssClass="label label-default"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" Class="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" Height="177px" Width="890px" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Visible="False" OnRowEditing="GridView1_RowEditing"  >
                <Columns>
                    <asp:TemplateField HeaderText="#" SortExpression="id_reserva">
                        <EditItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("id_reserva") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("id_reserva") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hora" SortExpression="Hora">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hora") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hora") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="nombre_paciente">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("nombre_paciente") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre_paciente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono" SortExpression="telefono_paciente">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("telefono_paciente") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("telefono_paciente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo Paciente" SortExpression="tipo">
                        <EditItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("tipo") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("tipo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Medio de pago" SortExpression="medio_pago">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("medio_pago") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("medio_pago") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agregar" ShowHeader="False" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Select" CssClass="btn btn-primary" Text="Agregar"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ShowHeader="false" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" CommandName="Edit" Text="Editar" CssClass="btn btn-success"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                        </ItemTemplate>

                        <ItemStyle CssClass="text-center" />

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar" ItemStyle-CssClass="text-center" ShowHeader="False">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete" Text="Eliminar" CssClass="btn btn-danger"><i class="fa fa-ban"></i></asp:LinkButton>
                        </ItemTemplate>

                        <ItemStyle CssClass="text-center" />

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>


    </div>

                    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
