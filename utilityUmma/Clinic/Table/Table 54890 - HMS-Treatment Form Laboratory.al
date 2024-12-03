table 54890 "HMS-Treatment Form Laboratory"
{

    fields
    {
        field(1; "Treatment No."; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Laboratory Test Package Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HMS-Setup Lab Test".Code; //where(Code = Field("Laboratory Test Package Code"));
            trigger OnValidate()

            begin
                LabSetupTest.Reset;
                LabSetupTest.SetRange(LabSetupTest.Code, "Laboratory Test Package Code");
                IF LabSetupTest.FindFirst then
                    "Laboratory Test Package Name" := LabSetupTest.Description;

            end;
        }
        field(3; "Laboratory Test Package Name"; Text[50])
        {
            //CalcFormula = Lookup("HMS-Setup Lab Test".Description WHERE(Code = FIELD("Laboratory Test Package Code")));
            //FieldClass = FlowField;
        }
        field(4; "Date Due"; Date)
        {
        }
        field(5; Results; Text[250])
        {
        }
        field(6; Status; Option)
        {
            CalcFormula = Lookup("HMS-Laboratory Form Header".Status WHERE("Link No." = FIELD("Treatment No."),
                                                                            "Link Type" = CONST('TREATMENT')));
            FieldClass = FlowField;
            OptionMembers = New,Forwarded,Cancelled,Completed;
        }
        field(7; Diagnosis; Code[20])
        {
            TableRelation = "HMS-Setup Diagnosis".Code;
        }
        field(8; Specimen; Code[20])
        {
            TableRelation = "HMS-Setup Specimen".Code;
        }
        field(9; Test; Text[100])
        {
        }
        field(11; Comments; text[250])
        {

        }

        field(10; "Send to lab"; Boolean)
        {

        }
        field(12; "Patient No."; code[30])
        {

        }
    }

    keys
    {
        key(Key1; "Treatment No.", "Laboratory Test Package Code", "Patient No.")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }
    var
        LabSetupTest: Record "HMS-Setup Lab Test";
}

