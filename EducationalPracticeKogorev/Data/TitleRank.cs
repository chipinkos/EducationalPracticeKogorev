//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EducationalPracticeKogorev.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class TitleRank
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TitleRank()
        {
            this.Title = new HashSet<Title>();
        }
    
        public int Id_tr { get; set; }
        public string TRRank { get; set; }
        public Nullable<bool> IsRemoved { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Title> Title { get; set; }
    }
}