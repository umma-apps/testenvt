table 40003 "PT Claims Header"
{
    Caption = 'PT Claims Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Semster"; code[20])
        {
            TableRelation = "ACA-Semesters";
        }
        field(2; "Academic Year"; code[20])
        {
            TableRelation = "ACA-Academic Year";
        }
        field(3; "Batch No"; code[20])
        {

        }
        field(4; "Created By"; Code[20])
        {

        }
        field(5; "Date Generated"; Date)
        {
        }
        field(6; "Gross Amount"; Decimal)
        {
            CalcFormula = sum(PTClaimLines.Amount where("Batch No" = field("Batch No"), Semester = field(Semster)));
            FieldClass = FlowField;
        }
        field(7; "Net Amount"; Decimal)
        {
            CalcFormula = sum(PTClaimLines."Net Pay" where("Batch No" = field("Batch No"), Semester = field(Semster)));
            FieldClass = FlowField;
        }
        field(8; "Total payee"; Decimal)
        {
            CalcFormula = sum(PTClaimLines."Paye Amount" where("Batch No" = field("Batch No"), Semester = field(Semster)));
            FieldClass = FlowField;
        }
        field(9; "Other Deductions"; Decimal)
        {
            CalcFormula = sum(PTClaimLines."Other Deductions" where("Batch No" = field("Batch No"), Semester = field(Semster)));
            FieldClass = FlowField;
        }
        field(11; "Total Housing Levy"; Decimal)
        {
            CalcFormula = sum(PTClaimLines."Housing Levy" where("Batch No" = field("Batch No"), Semester = field(Semster)));
            FieldClass = FlowField;
        }

        field(10; "Voucher Generated"; Boolean)
        {
            //ApplicationArea = All;
        }



    }
    keys
    {
        key(PK; Semster, "Batch No")
        {
            Clustered = true;
        }
    }
    var
        gensetup: record "ACA-General Set-Up";
        Noseries: Codeunit NoSeriesManagement;
    //trigger OnInsert()

    //begin
    //   gensetup.Get;
    // if Rec."Batch No" = '' then
    //     begin
    //         Rec."Batch No" := Noseries.InitSeries(gensetup."partime Nos.", xRec."No. Series", 0D, rec."No.", rec."No. Series");
    //     end;
    // end;
}
