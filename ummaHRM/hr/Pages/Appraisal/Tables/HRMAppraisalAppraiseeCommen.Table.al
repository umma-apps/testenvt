table 75011 "HRM-Appraisal Appraisee Commen"
{
    DrillDownPageID = "HRM-Appraisee Self Targets";
    LookupPageID = "HRM-Appraisee Self Targets";

    fields
    {
        field(2; "PF. No."; Code[20])
        {
            Editable = true;
            NotBlank = true;
        }
        field(3; "Appraisal Period Code"; Code[20])
        {
            Editable = true;
            NotBlank = false;
        }
        field(4; "Appraisal Job Code"; Code[20])
        {
            Editable = true;
            NotBlank = false;

            trigger OnValidate()
            begin

                CReg.RESET;
                CReg.SETRANGE(CReg."PF No.", "PF. No.");
                IF CReg.FIND('+') THEN BEGIN
                END;
                coreg.RESET;
            end;
        }
        field(7; "Comment Count"; Integer)
        {
            AutoIncrement = true;
            Editable = true;
            NotBlank = true;
        }
        field(72; "Entry No."; Integer)
        {
        }
        field(50015; "Appraisal year Code"; Code[20])
        {
        }
        field(50103; "Appraisee Comments"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Mitigating Factor"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Appraisal Job Code", "Comment Count", "Appraisal Period Code", "PF. No.", "Appraisal year Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF NOT UserSetup.GET(USERID) THEN ERROR('Invalid User Account!');
        UserSetup.TESTFIELD("Employee No.");
        "PF. No." := UserSetup."Employee No.";
        IF HRMEmployeeC.GET(UserSetup."Employee No.") THEN "Appraisal Job Code" := HRMEmployeeC."Job Title";
        HRMAppraisalYears.RESET;
        HRMAppraisalYears.SETRANGE(Closed, FALSE);
        IF NOT HRMAppraisalYears.FIND('-') THEN ERROR('There is no open appraisal year.');
        "Appraisal year Code" := HRMAppraisalYears.Code;

        HRMAppraisalPeriods.RESET;
        HRMAppraisalPeriods.SETRANGE("Appraisal Year Code", HRMAppraisalYears.Code);
        HRMAppraisalPeriods.SETRANGE(Closed, FALSE);
        IF NOT HRMAppraisalPeriods.FIND('-') THEN ERROR('There is no open period in the filters');
        "Appraisal Period Code" := HRMAppraisalPeriods.Code;
    end;

    var
        coreg: Record "HRM-Appraisal Registration";
        NoSeriesMgt: Codeunit 396;
        GenSetup: Record "HRM-Appraisal Gen. Setup";
        TotalCost: Decimal;
        RecFound: Boolean;
        CReg: Record "HRM-Appraisal Registration";
        UnitsS: Record "HRM-Appraisal Targets";
        StudUnits: Record "HRM-Appraisal Gen. Setup";
        StudUnits2: Record "HRM-Appraisal Gen. Setup";
        UTaken: Integer;
        UFound: Boolean;
        CourseReg: Record "HRM-Appraisal Registration";
        Prog: Record "HRM-Appraisal Jobs";
        //ExamR: Record "HRM-Appraisal Results";
        Studnits: Record "HRM-Appraisal Gen. Setup";
        ExamSetup: Record "HRM-Appraisal Res. Setup";
        HRMEmployeeC: Record "HRM-Employee (D)";
        UserSetup: Record 91;
        HRMAppraisalYears: Record "HRM-Appraisal Years";
        HRMAppraisalPeriods: Record "HRM-Appraisal Periods";
}

