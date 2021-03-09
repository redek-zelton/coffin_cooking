using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DM_Cooking
{
    class cdr:client
    {
        private float point;
        
        public cdr(string nom, int tel):base(nom,tel)
        { }
        public cdr(string nom, int tel,float point) : base(nom, tel)
        {
            this.Point = 0;
        }
        public float Point { get => point; set => point = value; }

        //METHODES
        public string ToString()
        {
            return base.ToString() + " " + this.point;
        }
    }
}
