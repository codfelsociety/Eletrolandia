<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Pages_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/test.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div id="carouselExampleIndicators" style="width: 100%; height: 200px;" data-interval="3000" class="carousel slide mt-2 mb-2" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" style="height: 200px; width: 100%;" src="http://wwwimages.adobe.com/content/dam/acom/en/products/illustrator/images/ai-stock-marquee-1440x660.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Deuses são reais se você acredita ne</h3>
                            <p>Está acordado ? Ah que bom, nós vamos roubar um banco.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" style="height: 200px; width: 100%;" src="https://amazingslider.com/wp-content/uploads/2012/12/dandelion.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Deuses são reais se você acredita neles</h3>
                            <p>Está acordado ? Ah que bom, nós vamos roubar um banco.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" style="height: 200px; width: 100%;" src="http://www.esa.int/var/esa/storage/images/esa_multimedia/images/2017/03/brindisi_italy/16854131-3-eng-GB/Brindisi_Italy.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        <div style="height: 800px; background-color: rgb(117, 117, 117);" class="col-sm-4">
        </div>
        <div style="background-color: rgb(240, 240, 240);" class="col-sm-8 pt-3">

            <div class="card-deck">
                <asp:ListView ID="listaProdutos" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="card" style="margin: 5px -10px">
                                <img id="imgFoto" class="card-img-top" style="width: 100%; display: block;" alt="Card image cap" onerror="this.src='http://xpenology.org/wp-content/themes/qaengine/img/default-thumbnail.jpg'" src='data:image/png;base64,<%# System.Convert.ToBase64String(ProcessImage(Eval("image")))%>' />
                                <div class="card-block" style="padding: 10px;">
                                    <h6 class="card-title">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("nome") %>'></asp:Label></h6>

                                    <h5>
                                        <asp:Label ID="lblpreco" runat="server"><span class="badge badge-default"> <%#string.Format("{0:R$#,###.##}", Eval("PRECO"))%></span></asp:Label></h5>

                                </div>
                                <div class="card-footer" style="padding: 10px;">
                                    <button type="button" class="btn btn-success">Comprar</button>
                                    &nbsp;

                                        <button type="button" class="btn btn-secondary">i</button>

                                </div>
                            </div>



                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

