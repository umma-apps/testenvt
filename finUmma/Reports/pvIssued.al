report 52178801 issuedPaymentVoucher
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/PaymentVoucherList.rdl';

    dataset
    {
        dataitem(DataItemName; "FIN-Payments Header")
        {
            column(No_DataItemName; "No.")
            {
            }
            column(Date_DataItemName; "Date")
            {
            }
            column(DatePosted_DataItemName; "Date Posted")
            {
            }
            column(OnBehalfOf_DataItemName; "On Behalf Of")
            {
            }
            column(PaymentNarration_DataItemName; "Payment Narration")
            {
            }
            column(PayingBankAccount_DataItemName; "Paying Bank Account")
            {
            }
            column(AdvanceAmount_DataItemName; "Advance Amount")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

   

    var
        myInt: Integer;
}