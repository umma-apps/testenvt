report 52178703 "Payment Voucher summary "
{
    Caption = 'Payment Vouchers summary ';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/PaymentVoucherSummary.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("FIN-Payments Header"; "FIN-Payments Header")
        {
            RequestFilterFields = Status;
            column(No_; "No.")
            {
            }
            column(Payee; Payee)
            {

            }
            column(Date; Format(Date))
            {

            }
            column(Payment_Narration; "Payment Narration")
            {

            }
            column(Total_Net_Amount; "Total Net Amount")
            {

            }

            // column(Total_Net_Amount; Format("Total Net Amount"))
            // {

            // }
            column(Cheque_No_; "Cheque No.")
            {

            }

            column(Sn; Sn)
            {

            }

            trigger OnPreDataItem()
            begin
                "FIN-Payments Header".SetFilter(Date, '%1..%2', Sdate, Endate);
                "FIN-Payments Header".SetFilter(Status, '%1', Status::Posted);
                "FIN-Payments Header".SetFilter("Document Type", '%1', "Document Type"::"Payment Voucher");

            end;

            trigger OnAfterGetRecord()
            begin
                Sn := Sn + 1;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field("start Date"; Sdate)
                    {

                    }
                    field("End Date"; Endate)
                    {

                    }

                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        Sdate: date;
        Endate: date;
        Sn: Integer;
}
