using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using examen_2025_CLINICAUH.capa_de_datos;

namespace examen_2025_CLINICAUH.Forms
{
    public partial class Pacientes : System.Web.UI.Page
    {
        private ConexionBD conexion = new ConexionBD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPacientes();
            }
        }

        private void CargarPacientes()
        {
            using (SqlConnection conn = conexion.ObtenerConexion())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Pacientes", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPacientes.DataSource = dt;
                gvPacientes.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = conexion.ObtenerConexion())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Pacientes (Nombre, Apellidos, FechaNacimiento, Telefono, Email, Edad) VALUES (@Nombre, @Apellidos, @FechaNacimiento, @Telefono, @Email, @Edad)", conn);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellidos", txtApellidos.Text);
                cmd.Parameters.AddWithValue("@FechaNacimiento", txtFechaNacimiento.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Edad", txtEdad.Text);
                cmd.ExecuteNonQuery();
            }

            CargarPacientes();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = conexion.ObtenerConexion())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Pacientes SET Nombre=@Nombre, Apellidos=@Apellidos, FechaNacimiento=@FechaNacimiento, Telefono=@Telefono, Email=@Email, Edad=@Edad WHERE ID=@ID", conn);
                cmd.Parameters.AddWithValue("@ID", gvPacientes.SelectedRow.Cells[0].Text);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellidos", txtApellidos.Text);
                cmd.Parameters.AddWithValue("@FechaNacimiento", txtFechaNacimiento.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Edad", txtEdad.Text);
                cmd.ExecuteNonQuery();
            }

            CargarPacientes();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = conexion.ObtenerConexion())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Pacientes WHERE ID=@ID", conn);
                cmd.Parameters.AddWithValue("@ID", gvPacientes.SelectedRow.Cells[0].Text);
                cmd.ExecuteNonQuery();
            }

            CargarPacientes();
        }
    }
}
