using Microsoft.AspNetCore.Mvc;
using examen_2025_CLINICAUH.capa_de_datos;
using examen_2025_CLINICAUH.capa_de_negocio;
using System.Web.ModelBinding;

namespace examen_2025_CLINICAUH.capa_de_presentacion.Controllers
{
    public class PacientesController : Controller
    {
        private readonly PacienteNegocio _pacienteNegocio;

        public PacientesController(ApplicationDbContext context)
        {
            _pacienteNegocio = new PacienteNegocio(context);
        }

        public IActionResult Index()
        {
            var pacientes = _pacienteNegocio.ObtenerPacientes();
            return View(pacientes);
        }

        public IActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Crear(Paciente paciente)
        {
            if (ModelState.IsValid)
            {
                _pacienteNegocio.AgregarPaciente(paciente);
                return RedirectToAction("Index");
            }
            return View(paciente);
        }
    }
}
