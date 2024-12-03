table 85544 "PRL-Historical"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StaffNo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Names; text[200])
        {

        }
        field(3; "TransactionCode"; code[20])
        {

        }
        field(4; "TransactionName"; text[200])
        {

        }
        field(5; Amount; Decimal)
        {

        }
        field(6; periodMonth; code[10])
        {

        }
        field(7; periodYear; code[10])
        {

        }
        field(8; lineNo; Integer)
        {

        }
    }

    keys
    {
        key(Key1; lineNo, StaffNo, periodMonth, periodYear)
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