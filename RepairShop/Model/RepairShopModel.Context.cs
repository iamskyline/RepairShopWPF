﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RepairShop.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RepairShopEntities : DbContext
    {
        private static RepairShopEntities _data;
        public RepairShopEntities()
            : base("name=RepairShopEntities")
        {
        }

        public static RepairShopEntities GetContext()
        {
            if (_data == null)
            {
                _data = new RepairShopEntities();
            }
            return _data;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Application> Application { get; set; }
        public virtual DbSet<Application_statuses> Application_statuses { get; set; }
        public virtual DbSet<Assistance> Assistance { get; set; }
        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<Equipment_type> Equipment_type { get; set; }
        public virtual DbSet<Issue> Issue { get; set; }
        public virtual DbSet<Malfunction_type> Malfunction_type { get; set; }
        public virtual DbSet<Performer> Performer { get; set; }
        public virtual DbSet<Priority_type> Priority_type { get; set; }
        public virtual DbSet<Report> Report { get; set; }
        public virtual DbSet<Report_Spare_parts> Report_Spare_parts { get; set; }
        public virtual DbSet<Spare_part_order> Spare_part_order { get; set; }
    }
}
