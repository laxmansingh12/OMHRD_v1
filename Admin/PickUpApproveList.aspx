﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PickUpApproveList.aspx.cs" Inherits="OMHRD.Admin.PickUpApproveList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="col-lg-2"></div>
                <div class="col-lg-4">
                    <asp:TextBox ID="txtUserName" placeholder="Search By Name" runat="server" OnTextChanged="txtUserName_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="col-lg-4">
                    <asp:TextBox ID="txtPhone" runat="server" placeholder="Search By Contact No." OnTextChanged="txtPhone_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <hr />
            <asp:GridView ID="gdvNotice" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" OnPageIndexChanging="gdvNotice_PageIndexChanging" ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" Height="20px" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                <SelectedRowStyle ForeColor="#333333" BackColor="#D1DDF1" Font-Bold="True" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="SrNo">
                        <ItemTemplate>
                            <asp:Label ID="labelSrNo" runat="server"
                                Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                            <asp:Label ID="labelNOTICE_ID" runat="server" Text='<%# Bind("PickupID") %>'
                                Visible="False"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="File" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="File" />
                    <asp:BoundField DataField="CenterName" HeaderText="Center Name" SortExpression="File" />
                    <asp:BoundField DataField="CenterCode" HeaderText="Code" SortExpression="File" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact Number" SortExpression="File" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="File" />
                    <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="File" />
                    <asp:BoundField DataField="RegDate" HeaderText="Reg Date" SortExpression="File" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlactive">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>De-Active</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkbtnActive" runat="server" OnClick="linkbtnActive_Click">Action</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                </Columns>
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
