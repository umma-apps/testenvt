pageextension 52178557 coaLIST extends "Chart of Accounts"
{

    layout
    {
        // modify("No.")
        // {
        //     Caption = 'ERP Code';
        // }
        // modify("Income/Balance")
        // {
        //     Caption = 'Category';
        // }
        // modify("Account Type")
        // {
        //     Caption = 'Category Type';
        // }
        // addafter("No.")
        // {
        //     field("Sage Account"; Rec."Sage Account")
        //     {
        //         Caption = 'Sage Code';
        //     }
        //     field("New Code"; Rec."New Code")
        //     {

        //     }

        // }
    }
    
    trigger OnOpenPage()
    begin
        Rec.SetFilter(hide, '%1', false);
    end;



}