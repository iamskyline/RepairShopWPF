//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Application
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Application()
        {
            this.Report = new HashSet<Report>();
        }
    
        public int ID { get; set; }
        public int Equipment_type_ID { get; set; }
        public int Application_status_ID { get; set; }
        public int Performer_ID { get; set; }
        public int Issue_ID { get; set; }
        public int Client_ID { get; set; }
        public int Priority_type_ID { get; set; }
        public string Equipment_serial_number { get; set; }

        public virtual Application_statuses Application_statuses { get; set; }
        public virtual Client Client { get; set; }
        public virtual Equipment_type Equipment_type { get; set; }
        public virtual Issue Issue { get; set; }
        public virtual Performer Performer { get; set; }
        public virtual Priority_type Priority_type { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Report> Report { get; set; }
    }
}
