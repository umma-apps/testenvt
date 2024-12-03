table 52178700 "FIN-Budgetary Control Setup"
{
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Current Budget Code"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(3; "Current Budget Start Date"; Date)
        {
        }
        field(4; "Current Budget End Date"; Date)
        {
        }
        field(5; "Budget Dimension 1 Code"; Code[20])
        {
            Caption = 'Budget Dimension 1 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 1 Code" <> xRec."Budget Dimension 1 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 1 Code",9,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 1 Code",0);
                END;
                */

            end;
        }
        field(6; "Budget Dimension 2 Code"; Code[20])
        {
            Caption = 'Budget Dimension 2 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 2 Code" <> xRec."Budget Dimension 2 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 2 Code",10,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 2 Code",1);
                END;
                */

            end;
        }
        field(7; "Budget Dimension 3 Code"; Code[20])
        {
            Caption = 'Budget Dimension 3 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 3 Code" <> xRec."Budget Dimension 3 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 3 Code",11,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 3 Code",2);
                END;
                */

            end;
        }
        field(8; "Budget Dimension 4 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 4 Code" <> xRec."Budget Dimension 4 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 4 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 4 Code",3);
                END;
                */

            end;
        }
        field(9; "Budget Dimension 5 Code"; Code[20])
        {
            Caption = 'Budget Dimension 5 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 4 Code" <> xRec."Budget Dimension 4 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 4 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 4 Code",3);
                END;
                */

            end;
        }
        field(10; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 6 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 4 Code" <> xRec."Budget Dimension 4 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 4 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 4 Code",3);
                END;
                */

            end;
        }
        field(11; "Analysis View Code"; Code[20])
        {
            TableRelation = "Analysis View".Code;
        }
        field(12; "Dimension 1 Code"; Code[20])
        {
            Caption = 'Dimension 1 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Blocked,FALSE);
                IF Dim.CheckIfDimUsed("Dimension 1 Code",13,'',Code,0) THEN
                  ERROR(Text000,Dim.GetCheckDimErr);
                ModifyDim(FIELDCAPTION("Dimension 1 Code"),"Dimension 1 Code",xRec."Dimension 1 Code");
                MODIFY;
                */

            end;
        }
        field(13; "Dimension 2 Code"; Code[20])
        {
            Caption = 'Dimension 2 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Blocked,FALSE);
                IF Dim.CheckIfDimUsed("Dimension 2 Code",14,'',Code,0) THEN
                  ERROR(Text000,Dim.GetCheckDimErr);
                ModifyDim(FIELDCAPTION("Dimension 2 Code"),"Dimension 2 Code",xRec."Dimension 2 Code");
                MODIFY;
                */

            end;
        }
        field(14; "Dimension 3 Code"; Code[20])
        {
            Caption = 'Dimension 3 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Blocked,FALSE);
                IF Dim.CheckIfDimUsed("Dimension 3 Code",15,'',Code,0) THEN
                  ERROR(Text000,Dim.GetCheckDimErr);
                ModifyDim(FIELDCAPTION("Dimension 3 Code"),"Dimension 3 Code",xRec."Dimension 3 Code");
                MODIFY;
                */

            end;
        }
        field(15; "Dimension 4 Code"; Code[20])
        {
            Caption = 'Dimension 4 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Blocked,FALSE);
                IF Dim.CheckIfDimUsed("Dimension 4 Code",16,'',Code,0) THEN
                  ERROR(Text000,Dim.GetCheckDimErr);
                ModifyDim(FIELDCAPTION("Dimension 4 Code"),"Dimension 4 Code",xRec."Dimension 4 Code");
                MODIFY;
                */

            end;
        }
        field(16; Mandatory; Boolean)
        {
        }
        field(17; "WorkPlan Name"; Code[20])
        {
            //TableRelation = "ACA-Programme Entry Subjects";
        }
        field(18; "Current Item Budget"; Code[20])
        {
            TableRelation = "Item Budget Name".Name;
        }
        field(19; "Check Workplan Entries"; Boolean)
        {
        }
        field(20; "Allow OverExpenditure"; Boolean)
        {
        }
        field(21; "Budget Check Criteria"; Option)
        {
            OptionMembers = "Current Month","Whole Year";
        }
        field(22; "Actual Source"; Option)
        {
            OptionMembers = "G/L Entry","Analysis View Entry";

            trigger OnValidate()
            begin
                IF "Actual Source" = "Actual Source"::"G/L Entry" THEN BEGIN
                    IF NOT CONFIRM('Changing to Actual Source type G/L Entry will result in deletion of all Actuals Continue?', TRUE, FALSE) THEN
                        ERROR('Change to G/L Entry source cancelled');
                    "Analysis View Code" := '';
                    "Dimension 1 Code" := '';
                    "Dimension 2 Code" := '';
                    "Dimension 3 Code" := '';
                    "Dimension 4 Code" := '';
                    MODIFY;
                END;
            end;
        }
        field(23; "Raise PV"; Boolean)
        {
        }
        field(24; "Raise Claim"; Boolean)
        {
        }
        field(25; "Raise Document"; Option)
        {
            OptionCaption = ' ,Raise PV,Raise Claim';
            OptionMembers = " ","Raise PV","Raise Claim";
        }
        field(26; "Imprest Budget mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Claims Budget mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Transport Budget mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Travel Adv. Budget Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "PV Budget Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "LPO Budget Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Advance Budget Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Store Req. Budget Mamndatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Payroll Budget Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Normal Payments No"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(36; "Petty Cash Payments No"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(38; "Memo Check Budget Mandatory"; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}