﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace so2.modelo
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Clinica_integralEntities2 : DbContext
    {
        public Clinica_integralEntities2()
            : base("name=Clinica_integralEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Medico> Medico { get; set; }
        public DbSet<Paciente> Paciente { get; set; }
        public DbSet<Reserva> Reserva { get; set; }
    }
}
