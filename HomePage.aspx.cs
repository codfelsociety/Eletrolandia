using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;

using System.Web.UI.WebControls;

public partial class Pages_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    public DataRow r;
    protected void BindData()
    {
        ConnectionClass.Conexao();
        string SQL = @"SELECT img.imagem as image, prod.nome, prod.cod_produto AS COD, prod.cod_barras, logprod.preco_venda as PRECO
                                FROM produto prod
                                JOIN
                                (SELECT inn.* FROM(SELECT log2.*, (ROW_NUMBER() OVER(PARTITION BY cod_produto ORDER BY cod_log_prod DESC)) As Rank
                                  FROM log_produto log2) inn WHERE inn.Rank = 1) logprod
                                  ON  prod.cod_produto = logprod.cod_produto
                                LEFT JOIN
                                (SELECT inn.*FROM(SELECT img2.*, (ROW_NUMBER() OVER(PARTITION BY cod_produto ORDER BY cod_produto DESC)) As Rank
                                FROM imagem_produto img2) inn WHERE inn.Rank = 1) img
                                  ON prod.cod_produto = img.cod_produto";
        DataTable dt = ConnectionClass.RetornarDataTable(SQL);
        r = dt.Rows[0];

        listaProdutos.DataSource = dt;
        listaProdutos.DataBind();
    }
    public byte[] ProcessImage(object myValue)
    {
        if (myValue.ToString() == "")
        {
            byte[] b = { 85,58,85,1,4,5,5,7,48,85,85};
            return b;
        }
        else
        {
            return (byte[])myValue;
        }

    }
}