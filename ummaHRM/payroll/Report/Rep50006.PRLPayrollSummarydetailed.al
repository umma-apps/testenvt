report 50006 "PRL-Payroll Summary detailed"
{
    ApplicationArea = All;
    DefaultLayout = rdlc;
    RDLCLayout = './payroll/Report/SSR/PRL-Summary Detailed.rdl';
    Caption = 'PRL-Payroll Summary detailed';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("HRM-Employee (D)"; "HRM-Employee (D)")
        {
            column(No_; "No.") { }
            column(First_Name; "First Name") { }
            column(Middle_Name; "Middle Name") { }
            column(Last_Name; "Last Name") { }




            dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
            {
                DataItemLink = "Employee Code" = field("No.");
                column(Employee_Code; "Employee Code") { }
                column(TransCode; "PRL-Period Transactions"."Transaction Code")
                {
                }
                column(EmpCode; "PRL-Period Transactions"."Employee Code")
                {
                }
                column(TransName; "PRL-Period Transactions"."Transaction Name")
                {
                }

                column(InfoName; Info.Name) { }
                column(Logo; Info.Picture) { }
                column(Adress; Info.Address) { }
                column(Tell; Info."Phone No.") { }
                column(Website; Info."Home Page") { }
                column(InfoEmail; Info."E-Mail") { }
                column(basicAmount; basicAmount) { }
                column(HouseAllowance; HouseAllowance) { }
                column(OtherAllowances; OtherAllowances) { }
                column(GrossAmount; GrossAmount) { }

                column(PayeAmount; PayeAmount) { }
                column(NssFAmount; NssFAmount) { }
                column(NhifAmount; NhifAmount) { }
                column(RentAmount; RentAmount) { }
                column(SaccoAmount; SaccoAmount) { }

                column(OtherDeductions; OtherDeductions) { }
                column(NetPay; NetPay) { }
                column(HelbAmount; HelbAmount) { }
                trigger OnPreDataItem()
                begin
                    "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '%1', periods);
                    "HRM-Employee (D)".SetFilter("Payroll Posting Group", '%1', 'PAYROLL');
                    "HRM-Employee (D)".SetFilter("HRM-Employee (D)".Status, '%1', "HRM-Employee (D)".Status::Active);
                    "HRM-Employee (D)".SetFilter("HRM-Employee (D)"."Employee Category", '%1', 'FT');
                end;

                /*  trigger OnAfterGetRecord()
                  begin
                      info.get();
                      info.CalcFields(Picture);
                      OtherAllowances := 0;
                      HouseAllowance := 0;
                      GrossAmount := 0;
                      PayeAmount := 0;
                      NhifAmount := 0;
                      NssFAmount := 0;
                      providentAmount := 0;
                      RentAmount := 0;
                      SaccoAmount := 0;
                      AdvancesAmount := 0;
                      OtherDeductions := 0;
                      TotalDeduction := 0;
                      NetPay := 0;
                      HelbAmount := 0;
                      basicAmount := 0;
                      prPayrollPeriods.reset;


                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Net Pay');
                      IF "PRL-Period Transactions".Find('-') then begin
                          NetPay := "PRL-Period Transactions".Amount;
                          //NetPayTotal:=(NetPayTotal+("PRL-Period Transactions".Amount));

                      end;
                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      //"PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Gross Pay');
                      if "PRL-Period Transactions".Find('-') then begin
                          GrossAmount := "PRL-Period Transactions".Amount;
                          //NetPayTotal:=(NetPayTotal+("PRL-Period Transactions".Amount));

                      end;
                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Basic Pay');
                      if "PRL-Period Transactions".Find('-') then begin
                          basicAmount := "PRL-Period Transactions".Amount;
                          //NetPayTotal:=(NetPayTotal+("PRL-Period Transactions".Amount));

                      end;
                      PrlTransactionCodes.RESET;
                      PrlTransactionCodes.SetFilter(PrlTransactionCodes."Combination Type", '%1', PrlTransactionCodes."Combination Type"::"Umma Sacco");
                      IF PrlTransactionCodes.Find('-') THEN begin
                          "PRL-Period Transactions".Reset;
                          "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                          // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                          //  "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Gross Pay');
                          if "PRL-Period Transactions".Find('-') then begin
                              SaccoAmount := "PRL-Period Transactions".Amount;

                          end;
                      END;
                      PrlTransactionCodes.RESET;
                      PrlTransactionCodes.SetRange(PrlTransactionCodes."Transaction Type", PrlTransactionCodes."Transaction Type"::Income);
                      PrlTransactionCodes.SetFilter(PrlTransactionCodes."Transaction Code", '<>%1', 'TR-001');
                      IF PrlTransactionCodes.Find('-') THEN begin
                          "PRL-Period Transactions".Reset;
                          "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                          //"PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                          //  "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Gross Pay');
                          if "PRL-Period Transactions".Find('-') then begin
                              OtherAllowances := "PRL-Period Transactions".Amount;

                          end;
                      END;
                      PrlTransactionCodes.RESET;
                      PrlTransactionCodes.SetFilter(PrlTransactionCodes."Combination Type", '%1', PrlTransactionCodes."Combination Type"::"Staff Welfare");
                      IF PrlTransactionCodes.Find('-') THEN begin
                          "PRL-Period Transactions".Reset;
                          "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                          //"PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                          //  "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'Gross Pay');
                          if "PRL-Period Transactions".Find('-') then begin
                              OtherDeductions := "PRL-Period Transactions".Amount;

                          end;
                      END;


                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Code", 'TR-001');
                      if "PRL-Period Transactions".Find('-') then begin
                          HouseAllowance := "PRL-Period Transactions".Amount;

                      end;
                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'N.S.S.F(I)');
                      if "PRL-Period Transactions".Find('-') then begin
                          NssFAmount := "PRL-Period Transactions".Amount;
                          //NetPayTotal:=(NetPayTotal+("PRL-Period Transactions".Amount));

                      end;
                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      //"PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Name", 'N.H.I.F');
                      if "PRL-Period Transactions".Find('-') then begin
                          NhifAmount := "PRL-Period Transactions".Amount;
                          //NetPayTotal:=(NetPayTotal+("PRL-Period Transactions".Amount));

                      end;
                      "PRL-Period Transactions".Reset;
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                      // "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                      "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Transaction Code", 'TR-049');
                      if "PRL-Period Transactions".Find('-') then begin
                          HelbAmount := "PRL-Period Transactions".Amount;


                      end;

                      if PrlTransactionCodes."Transaction Code" in ['TR-056', 'TR-059'] then begin
                          "PRL-Period Transactions".Reset;
                          "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Payroll Period", periods);
                          //  "PRL-Period Transactions".SetRange("PRL-Period Transactions"."Employee Code", HRMEmployeeD."No.");
                          if "PRL-Period Transactions".Find('-') then begin
                              RentAmount := "PRL-Period Transactions".Amount;

                          end;

                      END;
                  end;*/






            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Period; periods)
                    {
                        ApplicationArea = all;
                        Caption = 'Period:';
                        TableRelation = "PRL-Payroll Periods"."Date Opened";
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        //  "PRL-Period Transactions": Record "PRL-Period Transactions";
        prPayrollPeriods: Record "PRL-Payroll Periods";
        periods: Date;
        OtherAllowances: Decimal;
        HouseAllowance: Decimal;
        GrossAmount: Decimal;
        PayeAmount: Decimal;
        NhifAmount: Decimal;
        NssFAmount: Decimal;
        providentAmount: Decimal;
        RentAmount: Decimal;
        SaccoAmount: Decimal;
        AdvancesAmount: Decimal;
        OtherDeductions: Decimal;
        TotalDeduction: Decimal;
        NetPay: Decimal;
        HelbAmount: decimal;
        basicAmount: decimal;
        PrlTransactionCodes: Record "PRL-Transaction Codes";
        Info: Record 79;



}
