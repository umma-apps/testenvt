table 50942 "update"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; payrollNo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; name; text[200])
        {

        }
        field(3; "nssfNo"; code[20])
        {

        }
        field(4; "IdNo"; code[20])
        {

        }
         field(5; "kraPIN"; code[20])
        {

        }

    }

    keys
    {
        key(Key1; payrollNo)
        {
            Clustered = true;
        }
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