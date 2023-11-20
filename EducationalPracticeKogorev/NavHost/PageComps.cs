using EducationalPracticeKogorev.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace EducationalPracticeKogorev.NavHost
{
    internal class PageComps
    {
        public string Title { get; set; }
        public Page Page { get; set; }

        public PageComps(string title, Page page)
        {
            Title = title;
            Page = page;
        }
    }
}
