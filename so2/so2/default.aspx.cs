using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using so2.modelo;

namespace so2
{
    public partial class Index : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                Clinica_integralEntities2  bd = new Clinica_integralEntities2 ();

                
                           
                cb_dr.DataSource = bd.Medico.ToList();
                cb_dr.DataTextField = "nombre_medico";
                cb_dr.DataValueField = "id_medico";
                cb_dr.DataBind();

               // lb_grid.Visible = false;

            }           
            Calendar1.SelectedDate = DateTime.Now;
            
        }


        protected void cb_dr_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Calendar1.Visible = true;
            }
            catch (Exception)
            {


            }
        }

       protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                lb_grid.Visible = true;
                lb_grid.Text = Calendar1.SelectedDate.ToShortDateString() + " " + cb_dr.SelectedValue + " " + cb_dr.SelectedItem ;
                DateTime fecha = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString());
                int idmedico = Convert.ToInt32( cb_dr.SelectedValue.ToString());
                lbFecha.Text = fecha.ToShortDateString();
                Clinica_integralEntities2  bd = new Clinica_integralEntities2 ();
                var result = from r in bd.Reserva
                             join p in bd.Paciente on r.id_paciente equals p.id_paciente
                             into gj  from aux in gj.DefaultIfEmpty()      
                             where r.id_medico == idmedico && r.fecha.Value == fecha
                             select new {r.id_reserva, r.hora, nombre_paciente=aux.nombre_paciente, aux.telefono_paciente,aux.tipo, aux.medio_pago };

                GridView1.DataSource = result.ToList();
                GridView1.DataBind();

                GridView1.Visible = true;


                
                
            }
            catch (Exception)
            {
                
                
            }
        }

        //LLAMAR VENTANA EMERGENTE PARA AGREGAR PACIENTE
       //protected void LinkButton1_Click(object sender, EventArgs e)
       //{
           
       //    try
       //    {
       //        Clinica_integralEntities2 bd = new Clinica_integralEntities2();

       //        ModalPopupExtender2.Show();
                              
       //    }
       //    catch (Exception)
       //    {
       //    }
       //}

                    

       //protected void LinkButton2_Click(object sender, EventArgs e)
       //{
       //    try
       //    {
       //         Clinica_integralEntities2 bd = new Clinica_integralEntities2();
               

       //        ModalPopupExtender1.Show();
       //    }
       //    catch (Exception)
       //    {
               
               
       //    }
       //}

        //AGREGAR UN PACIENTE A LA BASE DE DATOS
        protected void LinkButton4_agregar_Click1(object sender, EventArgs e)
        {
            try
            {
                Clinica_integralEntities2 bd = new Clinica_integralEntities2();

           string nombre = txt_nombre_paciente.Text;
           string telefono = txt_telefono_paciente.Text;
           string medio_pago = txt_medio_pago.Text;
           string tipo = txt_tipo_paciente.Text;
           

           Paciente pa = new Paciente();

           pa.nombre_paciente = nombre;
           pa.telefono_paciente = telefono;
           pa.medio_pago = medio_pago;
           pa.tipo = tipo;
           

           bd.Paciente.Add(pa);
           int auux = bd.SaveChanges();

           int id_reserva = Convert.ToInt32(lbId_reserva.Text);
           Reserva re = new Reserva();
           re = bd.Reserva.Find(id_reserva);
           re.id_paciente = pa.id_paciente;
           bd.SaveChanges();
               
           



           //lb_grid.Text = Calendar1.SelectedDate.ToShortDateString() + " " + cb_dr.SelectedValue + " " + cb_dr.SelectedItem;
           //DateTime fecha = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString());

         //  lb_grid.Text = Calendar1.SelectedDate.ToShortDateString() + " " + cb_dr.SelectedValue + " " + cb_dr.SelectedItem;
           DateTime fecha = Convert.ToDateTime(lbFecha.Text);
           int idmedico = Convert.ToInt32(cb_dr.SelectedValue.ToString());
           var result = from r in bd.Reserva
                        join p in bd.Paciente on r.id_paciente equals p.id_paciente
                        into gj
                        from aux in gj.DefaultIfEmpty()
                        where r.id_medico == idmedico && r.fecha.Value == fecha
                        select new { r.id_reserva, r.hora, nombre_paciente = aux.nombre_paciente, aux.telefono_paciente, aux.tipo, aux.medio_pago };

           GridView1.DataSource = result.ToList();
           GridView1.DataBind();
           GridView1.Visible = true;

           
            }
            catch (Exception)
            {

                
            }
        
        }


        //EDITAR UN PACIENTE DE LA BASE DE DATOS
        protected void agregar_editar_Click(object sender, EventArgs e)
        {
            try
            {
                Clinica_integralEntities2 bd = new Clinica_integralEntities2();

           string nombre = txt_nombre_paciente.Text;
           string telefono = txt_telefono_paciente.Text;
           string medio_pago = txt_medio_pago.Text;
           string tipo = txt_tipo_paciente.Text;
           

           Paciente pa = new Paciente();

           pa.nombre_paciente = nombre;
           pa.telefono_paciente = telefono;
           pa.medio_pago = medio_pago;
           pa.tipo = tipo;
           

           bd.Paciente.Add(pa);
           int auux = bd.SaveChanges();

           int id_reserva = Convert.ToInt32(lbID_editar.Text);
           Reserva re = new Reserva();
           re = bd.Reserva.Find(id_reserva);
           re.id_paciente = pa.id_paciente;
           bd.SaveChanges();
               
           



           //lb_grid.Text = Calendar1.SelectedDate.ToShortDateString() + " " + cb_dr.SelectedValue + " " + cb_dr.SelectedItem;
           //DateTime fecha = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString());

         //  lb_grid.Text = Calendar1.SelectedDate.ToShortDateString() + " " + cb_dr.SelectedValue + " " + cb_dr.SelectedItem;
           DateTime fecha = Convert.ToDateTime(lb_fecha_editar.Text);
           int idmedico = Convert.ToInt32(cb_dr.SelectedValue.ToString());
           var result = from r in bd.Reserva
                        join p in bd.Paciente on r.id_paciente equals p.id_paciente
                        into gj
                        from aux in gj.DefaultIfEmpty()
                        where r.id_medico == idmedico && r.fecha.Value == fecha
                        select new { r.id_reserva, r.hora, nombre_paciente = aux.nombre_paciente, aux.telefono_paciente, aux.tipo, aux.medio_pago };

           GridView1.DataSource = result.ToList();
           GridView1.DataBind();
           GridView1.Visible = true;
            }
            catch (Exception)
            {
                
                
            }
        }

        

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                Label lb = new Label();
                lb = (Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label6");
                lbId_reserva.Text = lb.Text;
                ModalPopupExtender2.Show();
            }
            catch (Exception)
            {
                
                
            }
      }

        
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                Label lb = new Label();
                lb = (Label)GridView1.Rows[e.NewEditIndex].FindControl("Label6");
                lbID_editar.Text = lb.Text;
                ModalPopupExtender1.Show();
            }
            catch (Exception)
            {


            }
        }

        

     
       

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Clinica_integralEntities bd = new Clinica_integralEntities();

        //    paciente pa = new paciente {
        //    //Nombre = txtcodigo.Text,
            
        //    };

        //   bd.paciente.Add(pa);
        //   int aux = bd.SaveChanges();

        //   GridView1.DataSource= bd.paciente.ToList();
        //   GridView1.DataBind();

        //}
    }
}




