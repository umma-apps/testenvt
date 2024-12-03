page 54972 "HMS-Treatment Form Drug"
{
    PageType = ListPart;
    SourceTable = "HMS-Treatment Form Drug";

    layout
    {
        area(content)
        {
            repeater(rep)
            {

                field("Drug No."; Rec."Drug No.")
                {
                    ApplicationArea = All;
                }
                field("Drug Name"; Rec."Drug Name")
                {
                    ApplicationArea = All;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure II")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Quantity In Store"; Rec."Quantity In Store")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity In Store field.';
                }

                field(Dosage; Rec.Dosage)
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field(Issued; Rec.Issued)
                {
                    Editable = false;
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Prescribe Drugs")
            {
                Caption = '&Prescribe Drugs';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF CONFIRM('Alert Pharmacy About Prescription?') = FALSE THEN BEGIN EXIT END;
                    HMSSetup.RESET;
                    HMSSetup.GET();
                    NewNo := NoSeriesMgt.GetNextNo(HMSSetup."Pharmacy Nos", 0D, TRUE);

                    /*Get the treatment from the database*/
                    TreatmentHeader.RESET;
                    IF TreatmentHeader.GET(Rec."Treatment No.") THEN BEGIN
                        PharmHeader.RESET;
                        PharmHeader.INIT;
                        PharmHeader."Pharmacy No." := NewNo;
                        PharmHeader."Pharmacy Date" := TODAY;
                        PharmHeader."Pharmacy Time" := TIME;
                        PharmHeader."Request Area" := PharmHeader."Request Area"::Doctor;
                        PharmHeader."Patient No." := TreatmentHeader."Patient No.";
                        PharmHeader."Student No." := TreatmentHeader."Student No.";
                        PharmHeader."Employee No." := TreatmentHeader."Employee No.";
                        PharmHeader."Relative No." := TreatmentHeader."Relative No.";
                        PharmHeader."Link Type" := 'Doctor';
                        PharmHeader."Link No." := Rec."Treatment No.";
                        PharmHeader.INSERT();

                        TreatmentLine.RESET;
                        TreatmentLine.SETRANGE(TreatmentLine."Treatment No.", Rec."Treatment No.");
                        IF TreatmentLine.FIND('-') THEN BEGIN
                            REPEAT
                                PharmLine.INIT;
                                PharmLine."Pharmacy No." := NewNo;
                                PharmLine."Drug No." := TreatmentLine."Drug No.";
                                PharmLine.Quantity := TreatmentLine.Quantity;
                                PharmLine.VALIDATE(PharmLine.Quantity);
                                PharmLine."Measuring Unit" := TreatmentLine."Unit Of Measure";
                                PharmLine.VALIDATE(PharmLine.Quantity);
                                PharmLine.Dosage := TreatmentLine.Dosage;
                                PharmLine.Pharmacy := TreatmentLine."Pharmacy Code";
                                PharmLine."No Stock Drugs" := TreatmentLine."No stock Drugs";
                                PharmLine.INSERT();
                            UNTIL TreatmentLine.NEXT = 0;
                        END;
                        MESSAGE('The Prescription has been sent to the Pharmacy for Issuance');
                    END;

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DrugNoOnFormat;
        DrugNameOnFormat;
        QuantityOnFormat;
        UnitOfMeasureOnFormat;
        DosageOnFormat;
    end;

    var
        HMSSetup: Record "HMS-Setup";
        NoSeriesMgt: Codeunit 396;
        NewNo: Code[20];
        TreatmentHeader: Record "HMS-Treatment Form Header";
        TreatmentLine: Record "HMS-Treatment Form Drug";
        PharmHeader: Record "HMS-Pharmacy Header";
        PharmLine: Record "HMS-Pharmacy Line";

    local procedure DrugNoOnFormat()
    begin
        IF Rec."Marked as Incompatible" = TRUE THEN;
    end;

    local procedure DrugNameOnFormat()
    begin
        IF Rec."Marked as Incompatible" = TRUE THEN;
    end;

    local procedure QuantityOnFormat()
    begin
        IF Rec."Marked as Incompatible" = TRUE THEN;
    end;

    local procedure UnitOfMeasureOnFormat()
    begin
        IF Rec."Marked as Incompatible" = TRUE THEN;
    end;

    local procedure DosageOnFormat()
    begin
        IF Rec."Marked as Incompatible" = TRUE THEN;
    end;
}

