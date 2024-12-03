table 52178773 "Fin-Ledgers Validatiobn"
{
    Caption = 'Fin-Ledgers Validatiobn';
    DataClassification = ToBeClassified;
    LookupPageId = "Fin Ledgers Validations";

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(2; "G_L Account"; Code[20])
        {
            Caption = 'G_L Account';
        }
        field(3; "External Doc No"; Code[20])
        {
            Caption = 'External Doc No';
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; Exist; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("G/L Entry" WHERE("G/L Account No." = field("G_L Account"), Amount = field(Amount), "External Document No." = field("External Doc No")));

        }
        field(8; TotalGLAmount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where(Amount = field(Amount), "Posting Date" = field("Posting Date"), "Document No." = field("Document No."), "G/L Account No." = field("G_L Account")));
        }
        field(9; "ShortCut 1 Dimension"; code[20])
        {

        }
        field(10; "ShortCut 2 Dimension"; code[20])
        {

        }
        field(11; "ShortCut 3 Dimension"; code[20])
        {
        }

        field(12; "ShortCut 4 Dimension"; code[20])
        {

        }
        field(13; "Document No."; code[20])
        {

        }
    }
    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }
}
