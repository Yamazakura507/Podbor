using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Podbor.View
{
    public class Revenues
    {
        public int Id
        {
            get;
            set;
        }
        public decimal Sum
        {
            get;
            set;
        }
        public decimal SumStability
        {
            get;
            set;
        }
        public decimal SumNotStability
        {
            get;
            set;
        }
        public decimal SumActive
        {
            get;
            set;
        }
        public decimal SumPasive
        {
            get;
            set;
        }
        public decimal SumActiveStability
        {
            get;
            set;
        }
        public decimal SumPasiveStability
        {
            get;
            set;
        }
        public decimal SumNotActiveStability
        {
            get;
            set;
        }
        public decimal SumNotPasiveStability
        {
            get;
            set;
        }
        public bool IsRevenues
        {
            get;
            set;
        }
    }
}
