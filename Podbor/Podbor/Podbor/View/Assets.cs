using MySqlConnector;
using Podbor.Classes;
using Podbor.Models;
using System.Xml.Serialization;

namespace Podbor.View
{
    public class Assets : DBModel
    {
        private int idFlowType;
        public int Id
        {
            get;
            set;
        }
        public bool IsStability
        {
            get;
            set;
        }
        public int IdFlowType
        {
            get => idFlowType;
            set
            {
                FlowType = GetModel<FlowType>(value);
                idFlowType = value;
            }
        }
        public decimal Sum
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Use
        {
            get;
            set;
        }
        public bool IsAsset
        {
            get;
            set;
        }

        public FlowType FlowType { get; set; }
    }
}
