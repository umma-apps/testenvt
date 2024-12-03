page 50062 "Confimed Mpesa Trans"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KCB Bank Intergration - Final";
    //SourceTableView = where(confirmed = filter(true));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(bankreference; Rec.bankreference)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the customerRefNumber field.';
                }
                field(transactionDate; Rec.transactionDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
                field(customerRefNumber; Rec.customerRefNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the paymentMode field.';
                }
                field(debitcustname; Rec.debitcustname)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the paymentAmount field.';
                }

                field(paymentAmount; Rec.paymentAmount)
                {

                }
                field(phonenumber; Rec.phonenumber)
                {

                }
               

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Payment")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    bankIntergration.PostCoopReceipt(Rec.bankreference, Rec.customerRefNumber, Rec.paymentAmount, '18770', Rec.debitcustname);
                end;
            }
             action("Test Payment")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    bankIntergration.PostKCBTransaction('SC96H2AGHJ6FV', '11/03/2023', 1.00, 'BSCN/2020/45717', 'Neima','PAYBILL','25471234556','7098491',1.00);
                end;
            }
            
        }
    }
    var
        bankIntergration: Codeunit "KCB Bank Intergration - Final";
}