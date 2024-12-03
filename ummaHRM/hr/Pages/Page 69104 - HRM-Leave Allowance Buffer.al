page 69104 "HRM-Leave Allowance Buffer"
{
    PageType = List;
    SourceTable = "HRM-Leave Allowance Reg.";

    layout
    {
        area(content)
        {
            group(Filters)
            {
                Caption = 'Filters';
                field(Datefils; dateFilter)
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Period';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";

                    trigger OnValidate()
                    begin
                        if dateFilter <> 0D then
                            Rec.SetFilter("Payroll Period", '=%1', dateFilter);
                    end;
                }
            }
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Leave Allowance Amount"; Rec."Leave Allowance Amount")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Reject Reason"; Rec."Reject Reason")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(getLeave)
            {
                ApplicationArea = all;
                Caption = 'Get Leave Allowances';
                Image = GetLines;
                Promoted = true;

                trigger OnAction()
                begin
                    if Confirm('Get Leave Allowance Data?', true) = false then exit;
                    leaveAll.Reset;
                    leaveAll.SetFilter(leaveAll."Payroll Period", '=%1', dateFilter);
                    if leaveAll.Find('-') then begin
                        repeat
                        begin
                            if emps.Get(leaveAll."Employee No") then begin // Get salary Grades and Category
                                if ((emps."Salary Category" = '') or (emps."Salary Grade" = '')) then begin
                                    leaveAll."Reject Reason" := 'Category and Grade for ' + emps."No." + ' Missing.';
                                    leaveAll.Modify;
                                end else begin
                                    leaveAll."Reject Reason" := '';
                                    leaveAll.Modify;
                                    salarygrades.Reset;
                                    salarygrades.SetRange(salarygrades."Employee Category", emps."Salary Category");
                                    salarygrades.SetRange(salarygrades."Salary Grade code", emps."Salary Grade");
                                    if salarygrades.Find('-') then begin
                                        leaveAll."Leave Allowance Amount" := salarygrades."Leave Allowance";
                                        leaveAll.Modify;
                                    end else begin
                                        leaveAll."Leave Allowance Amount" := 0;
                                        leaveAll."Reject Reason" := 'Leave Allowance for salary Category ' + emps."Salary Category" + ' and Grade ' + emps."Salary Grade" + ' Missing!';
                                        leaveAll.Modify;
                                    end;// Salary Grades does not exists
                                end;// Category and Grade Exists
                            end;
                        end;
                        until leaveAll.Next = 0;
                        Message('Leave Allowances Amounts obtained!');
                    end else
                        Error('There are no records in the filter...');
                end;
            }
            action(PostLeave)
            {
                ApplicationArea = all;
                Caption = 'Post Leave Allowances';
                Image = PostBatch;
                Promoted = true;

                trigger OnAction()
                begin
                    Message('This Action will delete all leave allowances for ' + Format(dateFilter) + ', \Be sure before continuing!!!');
                    if Confirm('Delete all Leave Allowances and Post new?', false) = false then exit;
                    payrolPeriod.Reset;
                    payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
                    payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
                    if payrolPeriod.Find('-') then begin
                        emptrans.Reset;
                        emptrans.SetFilter(emptrans."Payroll Period", '=%1', payrolPeriod."Date Opened");
                        emptrans.SetRange(emptrans."Transaction Code", '1027');
                        if emptrans.Find('-') then begin
                            emptrans.DeleteAll;
                        end;

                        leaveAll.Reset;
                        leaveAll.SetFilter(leaveAll."Payroll Period", '=%1', dateFilter);
                        if leaveAll.Find('-') then begin
                            repeat
                            begin
                                emptrans.Init;
                                emptrans."Employee Code" := leaveAll."Employee No";
                                emptrans."Transaction Code" := '1027';
                                emptrans."Period Month" := payrolPeriod."Period Month";
                                emptrans."Period Year" := payrolPeriod."Period Year";
                                emptrans."Payroll Period" := payrolPeriod."Date Opened";
                                emptrans."Transaction Name" := 'Leave Allowance';
                                emptrans.Amount := leaveAll."Leave Allowance Amount";
                                emptrans.Insert();
                            end;
                            until leaveAll.Next = 0;
                            Message('Leave Balances Updated Successfully.');
                        end else
                            Error('No data to post!');
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        payrolPeriod.Reset;
        payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
        payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
        if payrolPeriod.Find('-') then begin
            dateFilter := payrolPeriod."Date Opened";
        end;
        if dateFilter <> 0D then
            Rec.SetFilter("Payroll Period", '=%1', dateFilter);
    end;

    var
        dateFilter: Date;
        payrolPeriod: Record "PRL-Payroll Periods";
        leaveAll: Record "HRM-Leave Allowance Reg.";
        emps: Record "HRM-Employee (D)";
        salarygrades: Record "HRM-Job_Salary grade/steps";
        emptrans: Record "PRL-Employee Transactions";
}

