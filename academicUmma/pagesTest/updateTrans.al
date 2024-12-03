report 52809 updateAcc
{
    ProcessingOnly = true;
    dataset
    {
        dataitem(TestBuffer; TestBuffer)
        {
            RequestFilterFields = newAcc, oldAcc;

            trigger OnAfterGetRecord()
            var
                cust: Record Customer;
                glEntry: Record "G/L Entry";
                custLedgerEntry: Record "Cust. Ledger Entry";
                detaliedEntry: Record "Detailed Cust. Ledg. Entry";
                reg: Record "ACA-Course Registration";
                studUnits: Record "ACA-Student Units";
            begin
                reg.Reset();
                reg.SetRange("Student No.", TestBuffer.oldAcc);
                if reg.Find('-') then begin
                    repeat
                        reg.Rename(reg."Reg. Transacton ID", TestBuffer.newAcc, TestBuffer.newProg, reg.Semester, reg."Register for", reg.Stage, reg."Student Type", reg."Entry No.");
                        reg.Modify();
                    until reg.Next() = 0
                end;
                studUnits.Reset();
                studUnits.SetRange("Student No.", TestBuffer.oldAcc);
                if studUnits.Find('-') then begin
                    repeat
                        studUnits.Rename(studUnits.Programme, studUnits.Stage, studUnits.Unit, studUnits.Semester, studUnits."Reg. Transacton ID", TestBuffer.newAcc, studUnits.ENo, studUnits."Academic Year");
                        studUnits.Modify();
                    until studUnits.Next() = 0;
                end;
                glEntry.Reset();
                glEntry.SetRange("Bal. Account No.", TestBuffer.oldAcc);
                if glEntry.Find('-') then begin
                    repeat
                        glEntry."Bal. Account No." := TestBuffer.newAcc;
                        glEntry.Modify();
                    until glEntry.Next() = 0;
                end;
                custLedgerEntry.Reset();
                custLedgerEntry.SetRange("Customer No.", TestBuffer.oldAcc);
                if custLedgerEntry.Find('-') then begin
                    repeat
                        custLedgerEntry."Customer No." := TestBuffer.newAcc;
                        custLedgerEntry.Modify();
                    until custLedgerEntry.Next() = 0;
                end;
                detaliedEntry.Reset();
                detaliedEntry.SetRange("Customer No.", TestBuffer.oldAcc);
                if detaliedEntry.Find('-') then begin
                    repeat
                        detaliedEntry."Customer No." := TestBuffer.newAcc;
                        detaliedEntry.Modify();
                    until detaliedEntry.Next() = 0;
                end;
                cust.Reset();
                cust.SetRange("No.", TestBuffer.oldAcc);
                if cust.Find('-') then begin
                    cust.Delete();
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
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    var
        myInt: Integer;
}