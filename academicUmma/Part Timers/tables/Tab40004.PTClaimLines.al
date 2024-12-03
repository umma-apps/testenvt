table 40004 PTClaimLines
{
    Caption = 'PTClaimLines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Batch No"; Code[20])
        {
            Caption = '';
        }
        field(2; "Semester"; code[20])
        {
            TableRelation = "ACA-Semesters";
        }
        field(3; "PF No"; code[20])
        {
            TableRelation = "HRM-Employee (D)";
        }
        field(4; "Names"; Text[200])
        {

        }
        field(5; Amount; Decimal)
        {

        }
        field(6; Units; Decimal)
        {

        }
        field(7; Faculty; text[100])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('SCHOOL-SUB DIVISION'));
        }
        field(8; Programz; code[20])
        {
            TableRelation = "ACA-Programme";
        }
        field(9; Rate; Decimal)
        {
            trigger OnValidate()
            begin
                Amount := (Rate * Units);
            end;
        }
        field(10; SchoolName; text[100])
        {

        }
        field(11; LineNo; Integer)
        {
            AutoIncrement = true;
        }
        field(12; "Housing Levy"; Decimal)
        {

        }
        field(13; "Other Deductions"; Decimal)
        {

        }
        field(14; "Net Pay"; Decimal)
        {


        }
        field(15; "Net amount"; Decimal)
        {

        }
        field(16; "Paye Amount"; Decimal)
        {

        }
        field(17; "Gross amount"; Decimal)
        {

        }
        field(18; "Department Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("ACA-Programme"."Shortcut Dimension 3 Code" where(Code = field(Programz)));
        }
        field(20; "P.W.D"; Boolean)
        {
            //FieldClass = FlowField;
            //CalcFormula = lookup("ACA-Programme"."Shortcut Dimension 3 Code" where(Code = field(Programz)));
        }

    }
    keys
    {
        key(PK; "Batch No", Semester, "PF No", LineNo)
        {
            Clustered = true;
        }
    }
}
