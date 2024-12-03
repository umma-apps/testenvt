pageextension 52178558 budgetLines2 extends "Budget Matrix"
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
        Rec.SetFilter(Amount,'%1',0);
        // Rec.SetFilter(hide, '%1', false);
    end;



}