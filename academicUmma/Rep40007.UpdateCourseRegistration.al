report 40009 "Update Course Registration"
{
    ApplicationArea = All;
    Caption = 'Update Course Registration';
    // ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/UpdateCouresReg.rdl';
    dataset
    {
        dataitem(ACACourseRegistration; "ACA-Course Registration")
        {
            column(StudentNo; "Student No.")
            {
            }
            column(Semester; Semester)
            {
            }
            column(SettlementType; "Settlement Type")
            {
            }
            trigger OnAfterGetRecord()
            begin
                //Stdcharges.SetRange("Student No.", "Semester", "Settlement Type");
                Stdcharges.SetRange(Semester, Semester);
                Stdcharges.SetRange("Student No.", "Student No.");
                Stdcharges.SetRange(Stage, Stage);
                IF Stdcharges.FINDSET THEN begin
                    REPEAT
                        custledgerentry.SETRANGE("Customer No.", Stdcharges."Student No.");
                        // custledgerentry.SETRANGE("Semester", Semester);
                        custledgerentry.SETRANGE("Document No.", Stdcharges."Reg. Transacton ID");
                        //custledgerentry.SETRANGE("Settlement Type", SettlementType);
                        IF custledgerentry.FINDSET THEN begin
                            ACACourseRegistration.SetRange("Student No.", custledgerentry."Customer No.");
                            ACACourseRegistration.SetRange("Reg. Transacton ID", custledgerentry."Document No.");
                            if ACACourseRegistration.FINDSET then begin
                                ACACourseRegistration.Posted := true;
                                ACACourseRegistration.MODIFY;
                            end;


                        end;

                    UNTIL Stdcharges.NEXT = 0;
                end;



            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        Stdcharges: record "ACA-Std Charges";
        custledgerentry: record "Cust. Ledger Entry";
}
