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
    
    public partial class Report_Spare_parts
    {
        public int ID { get; set; }
        public int Report_ID { get; set; }
        public int Spare_part_ID { get; set; }
    
        public virtual Report Report { get; set; }
        public virtual Spare_part_order Spare_part_order { get; set; }
    }
}