table 54879 "HMS-Setup Test Specimen"
{
    LookupPageID = "HMS Setup Test Specimen List";

    fields
    {
        field(1; Test; Code[20])
        {
            FieldClass = Normal;
            NotBlank = true;
            TableRelation = "HMS-Setup Lab Test".Code;
        }
        field(2; "Test Name"; Text[30])
        {
            CalcFormula = Lookup("HMS-Setup Lab Test".Description WHERE(Code = FIELD(Test)));
            FieldClass = FlowField;
        }
        field(3; Specimen; Code[20])
        {
            NotBlank = true;
            TableRelation = "HMS-Setup Specimen".Code;
        }
        field(4; "Specimen Name"; Text[30])
        {
            CalcFormula = Lookup("HMS-Setup Specimen".Description WHERE(Code = FIELD(Specimen)));
            FieldClass = FlowField;
        }
        field(5; "Measuring Unit"; Code[20])
        {
            TableRelation = "HMS-Setup Measuring Unit".Code;
        }
        field(6; "Minimum Value"; Decimal)
        {
        }
        field(7; "Maximum Value"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Test, Specimen)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

