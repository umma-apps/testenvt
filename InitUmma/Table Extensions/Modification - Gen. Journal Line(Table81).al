/// <summary>
/// TableExtension Gen. Journal Line (ID 70003) extends Record Gen. Journal Line.
/// </summary>
tableextension 52178558 "Gen. Journal Line" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Recovery Priority"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Amount Payable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Pay Mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Cash,"Money Order","Banker's Cheque","Bank Slip",Cheque,EFT,"Real time","DIRECT BANKING";
        }
        field(50003; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50050; "Batch Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50101; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Income,Expense';
            OptionMembers = " ",Income,Expense;
        }
        field(50102; "Transaction Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; Particulars; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Expense code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Asset No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(50106; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Canceled;
        }
        field(50108; "Cust Exist"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(61010; "61010"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(69033; "Transaction Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Surrender, Payment,Cafeteria';
            OptionMembers = " ",Surrender," Payment",Cafeteria;
        }
        field(69036; Payee; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(69037; "Shortcut Dimension 3 code"; code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(69038; "Shortcut Dimension 4 code"; code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
    }
}