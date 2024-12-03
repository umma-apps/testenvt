table 52178772 bufferTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; glAcc; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; fiscalyr; code[20])
        {

        }
        field(3; description; Text[200])
        {

        }
        field(4; jnldesc; text[200])
        {

        }
        field(5; jnlRef; text[100])
        {

        }
        field(6; transAmount; Decimal)
        {

        }
        field(7; docno; code[20])
        {

        }
        field(8; date; Date)
        {

        }
        field(9; "exist"; Boolean)
        {
            CalcFormula = exist("G/L Entry" where("Document No." = field(docno), "Posting Date" = field(date), Amount = field(transAmount), "G/L Account No." = field(fiscalyr)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; glAcc, docno, description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}