using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VerteilerPlanungAPI
{
    internal class Room
    {
        public string Descr { set; get; }
        public int RoomNr { set; get; }
        public int House { set; get; }

        public Room(int house, int num, string descr)
        {
            Descr = descr;
            RoomNr = num;
            House = house;
        }
    }
}
