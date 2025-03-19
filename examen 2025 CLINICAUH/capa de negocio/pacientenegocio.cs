using examen_2025_CLINICAUH.capa_de_datos;
using System.Collections.Generic;
using System.Linq;

namespace examen_2025_CLINICAUH.capa_de_negocio
{
    public class PacienteNegocio
    {
        private readonly ApplicationDbContext _context;

        public PacienteNegocio(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<Paciente> ObtenerPacientes()
        {
            return _context.Pacientes.ToList();
        }

        public void AgregarPaciente(Paciente paciente)
        {
            _context.Pacientes.Add(paciente);
            _context.SaveChanges();
        }
    }
}
