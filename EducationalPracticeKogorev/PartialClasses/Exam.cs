using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EducationalPracticeKogorev.Data
{
    public partial class Exam
    {
        public string ShowDiscipline
        {
            get
            {
                return Discipline.DName;
            }
        }
    }
}
