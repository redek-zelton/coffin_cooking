 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DM_Cooking
{
    class client
    {
        private string nom;
        private int tel;
        public client()
        { }
        public client(string nom,int tel)
        {
            this.Nom = nom;
            this.Tel = tel;
        }
        public string Nom { get => nom; set => nom = value; }
        public int Tel { get => tel; set => tel = value; }

        //METHODES
        public override string ToString()
        {
            return this.nom + " " + this.tel;
        }
        public void Modif()
        {
            Console.WriteLine("Donnez le nom");
            this.nom = Console.ReadLine();
            Console.WriteLine("Donnez le num tel");
            this.tel = int.Parse(Console.ReadLine());
        }
    }
}
