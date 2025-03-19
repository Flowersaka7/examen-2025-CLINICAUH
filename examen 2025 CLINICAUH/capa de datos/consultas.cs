using System;

namespace examen_2025_CLINICAUH.capa_de_datos
{
    public class Consulta
    {
        public int ID { get; set; }
        public int PacienteID { get; set; }
        public int MedicoID { get; set; }
        public string NumeroConsulta { get; set; }
        public string Diagnostico { get; set; }
        public DateTime FechaCita { get; set; }
        public TimeSpan HoraConsulta { get; set; }
        public string Estado { get; set; }
    }
}

