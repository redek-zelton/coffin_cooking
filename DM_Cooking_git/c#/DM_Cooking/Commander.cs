using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DM_Cooking
{
    class Commander
    {
        private string nom_r;
        private string nom_p;
        private int quantite;
        public Commander()
        { }
        public Commander(string nom_r,string nom_p,int quantite)
        {
            this.Nom_r = nom_r;
            this.Nom_p = nom_p;
            this.Quantite = quantite;
        }

        public string Nom_r { get => nom_r; set => nom_r = value; }
        public string Nom_p { get => nom_p; set => nom_p = value; }
        public int Quantite { get => quantite; set => quantite = value; }

        //METHODES
        public string ToString()
        { return this.nom_p + ": " + this.quantite; }
    }
}
