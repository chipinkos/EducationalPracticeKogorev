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
    
    public partial class Exam
    {
        public int Id_exam { get; set; }
        public Nullable<System.DateTime> EDate { get; set; }
        public Nullable<int> Id_disc { get; set; }
        public Nullable<int> Id_stud { get; set; }
        public Nullable<int> Id_emp { get; set; }
        public string Auditory { get; set; }
        public Nullable<int> Points { get; set; }
        public Nullable<bool> IsRemoved { get; set; }
    
        public virtual Discipline Discipline { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual ExamAuditory ExamAuditory { get; set; }
        public virtual Student Student { get; set; }
    }
}