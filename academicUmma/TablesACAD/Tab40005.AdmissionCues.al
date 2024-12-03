table 40005 "Admission Cues"
{
    Caption = 'Admission Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[5])
        {
            Caption = 'Primary Key';

        }
        field(2; "Alll Applications"; Integer)
        {
            Caption = 'Alll Applications';

            CalcFormula = count("ACA-Applic. Form Header");
            FieldClass = FlowField;
        }
        field(3; "Awaiting Admission"; Integer)
        {
            Caption = 'Awaiting Admission';
            CalcFormula = count("ACA-Applic. Form Header" where(status = filter("Provisional Admission")));
            FieldClass = FlowField;
        }
        field(4; "Admitted Students"; integer)
        {
            Caption = 'Admitted Students';
            CalcFormula = count("ACA-Applic. Form Header" where(status = filter("Admitted")));
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
