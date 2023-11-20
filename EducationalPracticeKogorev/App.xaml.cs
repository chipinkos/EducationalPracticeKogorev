using EducationalPracticeKogorev.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace EducationalPracticeKogorev
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static BD_3NFEntities db = new BD_3NFEntities();
        public static bool isAdmin = false;
        public static bool isLecturer = false;
        public static bool isStudent = false;
        public static int userId;
        public static MainWindow mainWindow;

    }
}
