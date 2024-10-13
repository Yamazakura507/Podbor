using Podbor.Classes;
using Podbor.Models;

namespace Podbor.View
{
    public class MoneyTransfers : DBModel
    {
        private int idStatusTransfer;

        public int Id
        {
            get;
            set;
        }

        public int IdStatusTransfer
        {
            get => idStatusTransfer;
            set
            {

                TransferStatus = GetModel<TransferStatus>(value);
                idStatusTransfer  = value;
            }
        }

        public DateTime TimeTransfer
        {
            get;
            set;
        }

        public decimal Sum
        {
            get;
            set;
        }

        public TransferStatus TransferStatus { get; set; }
    }
}
