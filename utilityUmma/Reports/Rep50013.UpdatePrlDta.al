report 54357 UpdatePrlDta
{
    Caption = 'UpdatePrlDta';
    ProcessingOnly = true;
    dataset
    {
        dataitem("PRL-Payroll Periods"; "PRL-Payroll Periods")
        {
            RequestFilterFields = "Date Opened";
            column(Date_Opened; "Date Opened")
            {
            }
            trigger OnAfterGetRecord()
            begin
                prltransactions.Reset();
                prltransactions.SetRange("Payroll Period", "PRL-Payroll Periods"."Date Opened");
                if prltransactions.Find('-') then begin
                    repeat
                        buffTable.Init();
                        buffTable."Payroll Period" := Format(prltransactions."Payroll Period");
                        buffTable."Period Month" := prltransactions."Period Month";
                        buffTable."Period Year" := prltransactions."Period Year";
                        buffTable."Transaction Code" := prltransactions."Transaction Code";
                        buffTable."Transaction Name" := prltransactions."Transaction Name";
                        buffTable."Employeee No" := prltransactions."Employee Code";
                        buffTable.Amount := prltransactions.Amount;
                        buffTable."Employee Type" := buffTable."Employee Type"::"Primary Employer";
                        buffTable.Insert();
                    until prltransactions.Next() = 0;
                end;
                ptLines.Reset();
                ptLines.SetRange(Semester, 'MAY-AUG24');
                ptlines.SetRange("Batch No", 'BATCH-002');
                if ptLines.Find('-') then begin
                    repeat
                        buffTable.Init();
                        buffTable."Payroll Period" := Format("PRL-Payroll Periods"."Date Opened");
                        buffTable."Period Month" := "PRL-Payroll Periods"."Period Month";
                        buffTable."Period Year" := "PRL-Payroll Periods"."Period Year";
                        buffTable.Programme := ptLines.Programz;
                        buffTable."Transaction Code" := 'PT-MAY-AUG24';
                        buffTable."Transaction Name" := 'Part Time Claims';
                        buffTable."Employeee No" := ptLines."PF No";
                        buffTable.Amount := ptLines.Amount;
                        buffTable."Line No" := buffTable."Line No" + 1;
                        buffTable."Employee Type" := buffTable."Employee Type"::"Secondary Employee";
                        buffTable.Insert();
                    until ptLines.Next() = 0;
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
        ptLines: Record PTClaimLines;
        buffTable: Record BufferTableCSV;
        prltransactions: Record "PRL-Period Transactions";
}
