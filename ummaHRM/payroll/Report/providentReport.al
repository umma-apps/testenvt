report 50942 "Provident Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/providentReport.rdl';

    dataset
    {
        dataitem(prlTransactions; "PRL-Period Transactions")
        {
            //DataItemTableView = sorting("Employee Code") order(ascending);
            //DataItemTableView = SORTING("Group Order") ORDER(Ascending) WHERE("Transaction Code" = FILTER('TR-065'));
            DataItemTableView = SORTING("Group Order") ORDER(Ascending) WHERE("Transaction Code" = FILTER('TR-065'), "Period Filter" = FILTER(''));
            RequestFilterFields = "Payroll Period";


            column(TransCode; prlTransactions."Transaction Code")
            {
            }
            column(EmpCode; prlTransactions."Employee Code")
            {
            }
            column(TransName; prlTransactions."Transaction Name")
            {
            }
            column(amt; (prlTransactions.Amount))
            {
            }

            // column(empContr; format(empContr))
            // {

            // }
            column(bossContr; bossContr)
            {

            }
            column(totalContr; totalContr)
            {

            }
            column(name; CompanyInformation.Name)
            {

            }
            column(pic; CompanyInformation.Picture)
            {

            }
            column(DetDate; DetDate)
            {

            }

            column(basicsal; basicsal)
            {

            }
            column(empContr; empContr)
            {

            }
            column(empName; empName)
            {

            }
            column(idno; idno)
            {

            }
            column(seq; seq)
            {

            }

            trigger OnAfterGetRecord()
            begin
                prlEmpTrans.Reset();
                prlEmpTrans.SetRange("Transaction Code", prlTransactions."Transaction Code");
                prlEmpTrans.SetRange("Employee Code", prlTransactions."Employee Code");
                prlEmpTrans.SetRange("Payroll Period", SelectedPeriod);
                if prlEmpTrans.Find('-') then begin
                    Clear(basicsal);
                    Clear(empContr);
                    Clear(totalContr);
                    basicsal := (100 / 7.5) * prlEmpTrans.Amount;
                    empContr := (7.5 / 100) * basicsal;
                    totalContr := empContr + prlEmpTrans.Amount;
                    HRMEmployeeD.Reset();
                    HRMEmployeeD.SetRange("No.", prlEmpTrans."Employee Code");
                    if HRMEmployeeD.Find('-') then begin
                        empName := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                        idno := HRMEmployeeD."ID Number";
                    end;
                    gheto := totalContr;//+PRLEmployerDeductions.Amount;
                    if gheto = 0 then CurrReport.Skip else seq := seq + 1;

                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field(periodfilter; PeriodFilter)
                {
                    Caption = 'Period Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
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

    trigger OnInitReport()
    begin
        CompanyInformation.Reset;
        if CompanyInformation.Find('-') then begin

        end;
        if CompanyInformation.Get() then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
        IF objPeriod.FIND('-') THEN;
        PeriodFilter := objPeriod."Date Opened";

    end;

    trigger OnPreReport()
    begin
        SelectedPeriod := PeriodFilter;
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod."Date Opened", SelectedPeriod);
        IF objPeriod.FIND('-') THEN BEGIN
            PeriodName := objPeriod."Period Name";
            CLEAR(DetDate);
            DetDate := FORMAT(objPeriod."Period Name");
        END;
    end;

    var

    var

        PayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        HRMEmployeeD: Record "HRM-Employee (D)";
        SelectedPeriod: Date;
        PeriodFilter: Date;
        objPeriod: Record "PRL-Payroll Periods";
        PeriodName: Text[30];
        DetDate: Text[100];
        empContr: Decimal;
        bossContr: Decimal;
        totalContr: Decimal;
        empName: text[200];
        prlTrans: Record "PRL-Employee Transactions";
        Transcode: array[1, 200] of Code[100];
        counts: Integer;
        TransCount: Integer;
        TranscAmount: array[1, 200] of Decimal;
        TranscAmountTotal: array[1, 200] of Decimal;
        employee: Decimal;
        empTotal: Decimal;
        employer: Decimal;
        emplyrTotal: Decimal;
        prlEmpTrans: Record "PRL-Period Transactions";
        basicsal: Decimal;
        emplContrib: Decimal;
        idno: code[20];
        seq: Integer;
        gheto: Decimal;

}