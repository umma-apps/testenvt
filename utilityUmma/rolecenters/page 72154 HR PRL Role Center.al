page 86003 "HRM PRL Role C"
{
    Caption = 'HR PRL Role Center';
    PageType = RoleCenter;
    UsageCategory = Administration;
    ApplicationArea = All, Basic, Suite, Advance;

    layout
    {
        area(rolecenter)
        {
            part("Dashboard Greetings"; "Dashboard Greetings")

            {
                ApplicationArea = all;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            // part(EmployeeStats; "PRL-Emp. Cue (Payroll)")
            // {
            //     ApplicationArea = all;
            // }
            group(Control29)
            {
                ShowCaption = false;
                part("Employees Cue"; "PRL-Emp. Cue (Payroll)")
                {
                    Caption = 'Employees Stats';
                }

                systempart(Control27; Outlook)
                {
                    ApplicationArea = All;
                }
            }
            group(Control26)
            {
                ShowCaption = false;
                systempart(Control24; Links)
                {
                    ApplicationArea = All;
                }
                systempart(Control23; MyNotes)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


    actions
    {
        area(Embedding)
        {

            // action(timesheet)
            // {
            //     RunObject = page "HRM-Time Register";
            //     Caption = 'Time Register';
            //     ApplicationArea = all;
            // }

            action(payrol_ldata)
            {
                ApplicationArea = all;
                Caption = 'Import Transaction Codes';
                Ellipsis = true;
                RunObject = Page "PRL-Payroll Raw Data";
            }


        }

        area(reporting)
        {


            group(Reports)
            {

                Caption = ' Monthly Payroll Reports';
                Image = Payables;
                action(Payslips)
                {
                    ApplicationArea = area;
                    Caption = 'Payslips';
                    Image = "Report";

                    RunObject = Report "Individual Payslips V.1.1.3";
                    ToolTip = 'Executes the Payslips action.';
                }
                action("Payroll Summary1")
                {
                    ApplicationArea = all;
                    Caption = 'Departmental Payroll Summary';
                    Image = "Report";

                    RunObject = Report "Payroll Summary 3";
                    ToolTip = 'Executes the Departmental Payroll Summary action.';
                }
                action(Action10000000293)
                {
                    ApplicationArea = All;
                    Caption = 'bank Schedule';
                    Image = "Report";

                    RunObject = Report "pr Bank Schedule";
                    ToolTip = 'Executes the bank Schedule action.';
                }
                action("Paye Scheule1")
                {
                    ApplicationArea = All;
                    Caption = 'Paye Scheule';
                    Image = "Report";

                    RunObject = Report "prPaye Schedule mst";
                    ToolTip = 'Executes the Paye Scheule action.';
                }
               
                action("NHIF Schedult1")
                {
                    ApplicationArea = All;
                    Caption = 'NHIF Schedult';
                    Image = "Report";

                    //RunObject = Report "prNHIF mst";
                    ToolTip = 'Executes the NHIF Schedult action.';
                }
                action("NSSF Schedule1")
                {
                    ApplicationArea = All;
                    Caption = 'NSSF Schedule';
                    Image = "Report";

                    RunObject = Report "prNSSF mst";
                    ToolTip = 'Executes the NSSF Schedule action.';
                }
                action("Gross Netpay")
                {
                    ApplicationArea = all;
                    Caption = 'Gross Netpay';
                    Image = "Report";
                    RunObject = Report prGrossNetPay;
                    ToolTip = 'Executes the Gross Netpay action.';
                }
                action(Action10000003017)
                {
                    ApplicationArea = All;
                    Caption = 'Third Rule';
                    Image = AddWatch;
                    RunObject = Report "A third Rule Report";
                    ToolTip = 'Executes the Third Rule action.';
                }
                action(Transactions)
                {
                    ApplicationArea = all;
                    Caption = 'Transactions';
                    Image = "Report";
                    RunObject = Report "pr Transactions";
                    ToolTip = 'Executes the Transactions action.';
                }
                action("bank Schedule")
                {
                    ApplicationArea = all;
                    Caption = 'bank Schedule';
                    Image = "Report";
                    RunObject = Report "pr Bank Schedule";
                    ToolTip = 'Executes the bank Schedule action.';
                }
                // action("Master Payroll Summary")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Company Payroll Summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Company Payroll Summary 3";
                //     ToolTip = 'Executes the Company Payroll Summary action.';
                // }

                // action("Deductions Summary 2")
                // {

                //     ApplicationArea = all;
                //     Caption = 'Deductions Summary 2';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Deductions Summary";
                //     ToolTip = 'Executes the Deductions Summary 2 action.';
                // }
                // action("Earnings Summary 2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Earnings Summary 2';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Payments Summary";
                //     ToolTip = 'Executes the Earnings Summary 2 action.';
                // }
                // action("vew payslip")
                // {
                //     ApplicationArea = all;
                //     Caption = 'vew payslip';
                //     Image = "Report";
                //     
                //     RunObject = Report "Individual Payslips V.1.1.3";
                //     ToolTip = 'Executes the vew payslip action.';
                // }
                // action("Payroll summary")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "Payroll Summary 2";
                //     ToolTip = 'Executes the Payroll summary action.';
                // }
                // action("Deductions Summary")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Deductions Summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Deductions Summary";
                //     ToolTip = 'Executes the Deductions Summary action.';
                // }
                // action("Earnings Summary")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Earnings Summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Earnings Summary";
                //     ToolTip = 'Executes the Earnings Summary action.';
                // }


                // action("Third Rule")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Third Rule';
                //     Image = "Report";
                //     RunObject = Report "A third Rule Report";
                //     ToolTip = 'Executes the Third Rule action.';
                // }
                // action("P9 Report")
                // {
                //     ApplicationArea = all;

                //     Caption = 'P9 Report';
                //     Image = PrintForm;
                //     
                //     
                //     RunObject = Report "P9 Report (Final)";
                //     ToolTip = 'Executes the P9 Report action.';
                // }
                // action("Co_op Remittance")
                // {
                //     Caption = 'Co_op Remittance';
                //     Image = "Report";
                //     ToolTip = 'Executes the Co_op Remittance action.';
                //     ApplicationArea = All;
                //     //todo  RunObject = Report "prCoop remmitance";
                // }

            }
            group(Reports3)
            {
                Caption = 'HR Reports';
                Image = Payables;
                action("Employee List")
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    Image = "Report";


                    RunObject = Report "HR Employee List";
                    ToolTip = 'Executes the Employee List action.';
                }
                action("Employee Beneficiaries")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    Image = "Report";


                    RunObject = Report "HR Employee Beneficiaries";
                    ToolTip = 'Executes the Employee Beneficiaries action.';
                }
                action("Commission Report")
                {
                    ApplicationArea = all;
                    Caption = 'Commission Report';
                    Image = Report2;


                    ToolTip = 'Executes the Commission Report action.';
                    //todo  RunObject = Report "HRM-Commission For Univ. Rep.";
                }
                action("Leave Balances")
                {
                    ApplicationArea = all;
                    Image = Balance;


                    RunObject = Report "Employee Leaves";
                    ToolTip = 'Executes the Leave Balances action.';
                }
                action("Leave Application")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Application';
                    Image = SuggestGrid;


                    // RunObject = Report "HR Leave Application";
                    ToolTip = 'Executes the HR Leave Application action.';
                }
                action("Leave Transactions")
                {
                    ApplicationArea = all;
                    Image = Translation;


                    RunObject = Report "Standard Leave Balance Report";
                    ToolTip = 'Executes the Leave Transactions action.';
                }
                action("Leave Statement")
                {
                    ApplicationArea = all;
                    Image = LedgerEntries;


                    RunObject = Report "HR Leave Statement";
                    ToolTip = 'Executes the Leave Statement action.';
                }

                action("Employee CV Sunmmary")
                {
                    ApplicationArea = all;
                    Caption = 'Employee CV Sunmmary';
                    Image = SuggestGrid;


                    RunObject = Report "Employee Details Summary";
                    ToolTip = 'Executes the Employee CV Sunmmary action.';
                }
            }
            group("Employee General Reports")
            {
                Caption = 'Employee General Reports';
                ToolTip = 'Get Reports Related to Employee Manager';

                action(AcademicQualification)
                {
                    ApplicationArea = all;
                    Caption = 'Academic Qualification';
                    Image = SuggestGrid;


                    RunObject = Report "HRMAcademic Qualification";
                }
                action(EmployeeDependants)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Dependents';
                    Image = SuggestGrid;


                    RunObject = Report "HRMEmployee Dependents";
                }
                action(DiscplinaryCases)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Disciplinary';
                    Image = SuggestGrid;


                    RunObject = Report "HRMDisciplinary Cases";
                }

                action(EmployeeMedicalInsuarance)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Medical Insuarance';
                    Image = SuggestGrid;


                    RunObject = Report "HRMEmployee Medical Insuarance";
                }
                action(employeeSeparation)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Separation';
                    Image = SuggestGrid;


                    RunObject = Report "HRMEmployee Separation";
                }
                action(employeeHistory)
                {
                    ApplicationArea = all;
                    Caption = 'Employee History';
                    Image = SuggestGrid;


                    RunObject = Report "HRMEmployment History";
                }
                action(jobGroup)
                {
                    ApplicationArea = all;
                    Caption = 'Job Group';
                    Image = SuggestGrid;


                    RunObject = Report "HRMJob Group";
                }
                action(LeaveSummary)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Summary';
                    Image = SuggestGrid;


                    RunObject = Report "HRMLeave Summary";
                }

                action(ProffesionalQualification)
                {
                    ApplicationArea = all;
                    Caption = 'Proffesional Qualification';
                    Image = SuggestGrid;


                    RunObject = Report "HRMProffesional Qualification";
                }
                action(ResponsibilityContract)
                {
                    ApplicationArea = all;
                    Caption = 'Responsibility Contract';
                    Image = SuggestCustomerPayments;


                    RunObject = Report "HRMResponsibility Contract";
                }
                action(trainingSummary)
                {
                    ApplicationArea = all;
                    Caption = 'Training Summary';
                    Image = SuggestGrid;


                    RunObject = Report "HRMTraining Summary";
                }



            }
        }

        area(sections)
        {
            group(EmployeeMan)
            {
                Caption = 'Employee Manager';
                Image = HumanResources;
                action(Action22)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    RunObject = Page "HRM-Employee List";
                    ToolTip = 'Executes the Employee List action.';
                }
                action("Leave Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Requisitions';
                    RunObject = Page "HRM-View Leave List";
                    ToolTip = 'Executes the Leave Requisitions action.';

                }
            }
            group("Payroll Mngt")
            {
                Caption = 'Payroll Management';


                group(PayRollData)
                {


                    Caption = 'Payroll';

                    action("Salary Card")
                    {
                        ApplicationArea = All;
                        Caption = 'Salary Card';
                        Image = Employee;

                        RunObject = Page "HRM-Employee-List";
                        ToolTip = 'Executes the Salary Card action.';


                    }
                    action("Transcation Codes")
                    {
                        ApplicationArea = All;
                        Caption = 'Transcation Codes';
                        Image = Setup;

                        RunObject = Page "PRL-Transaction Codes List";
                        ToolTip = 'Executes the Transcation Codes action.';
                    }
                    action("NHIF Setup")
                    {
                        ApplicationArea = All;
                        Caption = 'NHIF Setup';
                        Image = SetupLines;

                        RunObject = Page "PRL-NHIF SetUp";
                        ToolTip = 'Executes the NHIF Setup action.';
                    }
                    action("Payroll Mass Changes")
                    {
                        ApplicationArea = All;
                        Caption = 'Payroll Mass Changes';
                        Image = AddAction;

                        RunObject = Page "HRM-Import Emp. Trans Buff";
                        ToolTip = 'Executes the Payroll Mass Changes action.';
                    }
                    action(" payment Vouchers")
                    {
                        ApplicationArea = All;
                        Caption = ' payment Vouchers';
                        //  RunObject = Page "FIN-Payment Vouchers";
                        ToolTip = 'Executes the  payment Vouchers action.';
                    }
                }
                // group(Casuals)
                // {

                //     Caption = 'Casual Payroll';

                //     action("HRM-Casual Pay List")
                //     {
                //         ApplicationArea = All;
                //         Caption = 'Casual Salary Card';
                //         Image = Employee;
                //         
                //         RunObject = Page "HRM-Casual Pay List";
                //     }
                //     action("PRL-Casual Worked Days ")
                //     {
                //         ApplicationArea = All;
                //         Caption = 'Casuals Worked days';
                //         Image = Setup;
                //         
                //         RunObject = Page "PRL-Casual Worked Days";
                //     }
                //     action("PRL-Casual Payroll Periods")
                //     {
                //         ApplicationArea = All;
                //         Caption = 'Casuals Payroll Period';
                //         Image = SetupLines;
                //         
                //         RunObject = Page "PRL-Casual Payroll Periods";
                //     }

                // }
                group(SalInc)
                {
                    Caption = 'Salary Increaments';

                    action("Salary Increament Process")
                    {
                        ApplicationArea = All;
                        Caption = 'Employee Categories';
                        Image = AddAction;

                        RunObject = Page "HRM-Emp. Categories";
                        ToolTip = 'Executes the Employee Categories action.';
                    }
                    action("Salary Increament Register")
                    {
                        ApplicationArea = All;
                        Caption = 'Salary Increament Register';
                        Image = Register;

                        RunObject = Page "HRM-Salary Increament Register";
                        ToolTip = 'Executes the Salary Increament Register action.';
                    }
                    action("Un-Afected Salary Increaments")
                    {
                        ApplicationArea = All;
                        Caption = 'Un-Afected Salary Increaments';
                        Image = UndoCategory;

                        RunObject = Page "HRM-Unaffected Sal. Increament";
                        ToolTip = 'Executes the Un-Afected Salary Increaments action.';
                    }
                    action("Leave Allowance Buffer")
                    {
                        ApplicationArea = All;
                        Caption = 'Leave Allowance Buffer';
                        Image = Bins;

                        RunObject = Page "HRM-Leave Allowance Buffer";
                        ToolTip = 'Executes the Leave Allowance Buffer action.';
                    }
                }
                group(Payroll_Setups)
                {

                    Caption = 'Payroll Setups';
                    // Image = HRSetup;
                    action("Payroll Period")
                    {
                        ApplicationArea = All;
                        Caption = 'Payroll Period';
                        Image = Period;
                        RunObject = Page "PRL-Payroll Periods";
                        ToolTip = 'Executes the Payroll Period action.';
                    }
                    action("Pr Rates")
                    {
                        ApplicationArea = All;
                        Caption = 'Payroll  Rates';
                        Image = SetupColumns;

                        RunObject = Page "PRL-Rates & Ceilings";
                        ToolTip = 'Executes the Payroll  Rates action.';
                    }
                    action("paye Setup")
                    {
                        ApplicationArea = All;
                        Caption = 'PAYE Setup';
                        Image = SetupPayment;

                        RunObject = Page "PRL-P.A.Y.E Setup";
                        ToolTip = 'Executes the PAYE Setup action.';
                    }
                    action(Action1000000046)
                    {
                        ApplicationArea = All;
                        Caption = 'NHIF Setup';
                        Image = SetupLines;

                        RunObject = Page "PRL-NHIF SetUp";
                        ToolTip = 'Executes the NHIF Setup action.';
                    }
                    action(nssf)
                    {
                        ApplicationArea = All;
                        Caption = 'NSSF Setup';
                        Image = Allocations;

                        RunObject = Page "prNSSF Tiers List";
                        ToolTip = 'Executes the NSSF Setup action.';
                    }
                    action(Action1000000047)
                    {
                        ApplicationArea = All;
                        Caption = 'Transcation Codes';
                        Image = Setup;

                        RunObject = Page "PRL-Transaction Codes List";
                        ToolTip = 'Executes the Transcation Codes action.';
                    }

                    action("Hr Employee Card")
                    {
                        ApplicationArea = All;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        // 
                        Image = Info;
                        RunObject = Page "HRM-Employee (C)";
                        ToolTip = 'Executes the Hr Employee Card action.';
                    }
                    action("Bank Structure")
                    {
                        ApplicationArea = All;
                        Caption = 'Bank Structure';
                        Image = Bank;

                        RunObject = Page "PRL-Bank Structure (B)";
                        ToolTip = 'Executes the Bank Structure action.';
                    }
                    action("control information")
                    {
                        ApplicationArea = All;
                        Caption = 'control information';
                        Image = CompanyInformation;

                        RunObject = Page "GEN-Control-Information";
                        ToolTip = 'Executes the control information action.';
                    }
                    action("Salary Grades")
                    {
                        ApplicationArea = All;
                        Caption = 'Salary Grades';
                        Image = EmployeeAgreement;

                        RunObject = Page "PRL-Salary Grades";
                        ToolTip = 'Executes the Salary Grades action.';
                    }
                    action("posting group")
                    {
                        ApplicationArea = All;
                        Caption = 'posting group';
                        Image = PostingEntries;

                        RunObject = Page "PRL-Employee Posting Group";
                        ToolTip = 'Executes the posting group action.';
                    }
                    action(Action1000000040)
                    {
                        ApplicationArea = All;
                        Caption = 'Employee Categories';
                        Image = AddAction;

                        RunObject = Page "HRM-Emp. Categories";
                        ToolTip = 'Executes the Employee Categories action.';
                    }
                    action(Action1000000039)
                    {
                        ApplicationArea = All;
                        Caption = 'Salary Increament Register';
                        Image = Register;

                        RunObject = Page "HRM-Salary Increament Register";
                        ToolTip = 'Executes the Salary Increament Register action.';
                    }
                    action(Action1000000038)
                    {
                        ApplicationArea = All;
                        Caption = 'Un-Afected Salary Increaments';
                        Image = UndoCategory;

                        RunObject = Page "HRM-Unaffected Sal. Increament";
                        ToolTip = 'Executes the Un-Afected Salary Increaments action.';
                    }
                    action(Action1000000037)
                    {
                        ApplicationArea = All;
                        Caption = ' payment Vouchers';
                        // RunObject = Page "FIN-Payment Vouchers";
                        ToolTip = 'Executes the  payment Vouchers action.';
                    }
                }
                group("Payroll Reports")
                {

                    Caption = 'Payroll Reports';
                    //Image = Report;
                    action(Action1000000035)
                    {
                        ApplicationArea = All;
                        Caption = 'vew payslip';
                        Image = "Report";

                        RunObject = Report "Individual Payslips V.1.1.3";
                        ToolTip = 'Executes the vew payslip action.';
                    }
                    action(Action1000000033)
                    {
                        ApplicationArea = All;
                        Caption = 'Detailed Payroll Summary';
                        Image = Report;
                        RunObject = Report "Payroll Summary 3";
                        ToolTip = 'Executes the Detailed Payroll Summary action.';
                    }
                    action(Action1000000034)
                    {
                        ApplicationArea = All;
                        Caption = 'Master Payroll Summary';
                        Image = "Report";

                        RunObject = Report "PRL-Company Payroll Summary 3";
                        ToolTip = 'Executes the Master Payroll Summary action.';
                    }

                    action(Action1000000032)
                    {
                        ApplicationArea = All;
                        Caption = 'Deductions Summary';
                        Image = Report;
                        // RunObject = Report "PRL-Deductions Summary";
                        ToolTip = 'Executes the Deductions Summary action.';
                    }
                    action(Action1000000031)
                    {
                        ApplicationArea = All;
                        Caption = 'Earnings Summary';
                        Image = DepositSlip;
                        //  RunObject = Report "PRL-Earnings Summary";
                        ToolTip = 'Executes the Earnings Summary action.';
                    }
                    action(Action1000000030)
                    {
                        ApplicationArea = All;
                        Caption = 'Deductions Summary 2';
                        Image = "Report";

                        // RunObject = Report "PRL-Deductions Summary";
                        ToolTip = 'Executes the Deductions Summary 2 action.';
                    }
                    action(Action1000000029)
                    {
                        ApplicationArea = All;
                        Caption = 'Earnings Summary 2';
                        Image = "Report";

                        // RunObject = Report "PRL-Payments Summary";
                        ToolTip = 'Executes the Earnings Summary 2 action.';
                    }
                    action(Action1000000028)
                    {
                        ApplicationArea = All;
                        Caption = 'Staff pension';
                        Image = Aging;
                        //  RunObject = Report "prStaff Pension Contrib";
                        ToolTip = 'Executes the Staff pension action.';
                    }
                    action(Action1000000027)
                    {
                        ApplicationArea = All;
                        Caption = 'Gross Netpay';
                        Image = Giro;
                        RunObject = Report prGrossNetPay;
                        ToolTip = 'Executes the Gross Netpay action.';
                    }
                }
                group(PayrollPeoro)
                {

                    Caption = 'Periodic Reports';
                    //   Image = Report;
                    action(Action1000000025)
                    {
                        ApplicationArea = All;
                        Caption = 'P9 Report';
                        Image = PrintForm;


                        RunObject = Report "P9 Report (Final)";
                        ToolTip = 'Executes the P9 Report action.';
                    }
                    action(Action1000000024)
                    {
                        ApplicationArea = All;
                        Caption = 'Transactions';
                        Image = "Report";

                        RunObject = Report "pr Transactions";
                        ToolTip = 'Executes the Transactions action.';
                    }
                    action(Action1000000023)
                    {
                        ApplicationArea = All;
                        Caption = 'bank Schedule';
                        Image = "Report";

                        RunObject = Report "pr Bank Schedule";
                        ToolTip = 'Executes the bank Schedule action.';
                    }
                    action("Employer Certificate")
                    {
                        ApplicationArea = All;
                        Caption = 'Employer Certificate';
                        Image = "Report";


                        ToolTip = 'Executes the Employer Certificate action.';
                        //    RunObject = Report "Employer Certificate P.10 mst";
                    }
                    action("P.10")
                    {
                        ApplicationArea = All;
                        Caption = 'P.10';
                        Image = "Report";

                        //  RunObject = Report "P.10 A mst";
                        ToolTip = 'Executes the P.10 action.';
                    }
                    action("Paye Scheule")
                    {
                        ApplicationArea = All;
                        Caption = 'Paye Scheule';
                        Image = "Report";

                        RunObject = Report "prPaye Schedule mst";
                        ToolTip = 'Executes the Paye Scheule action.';
                    }
                    action("NHIF Schedult")
                    {
                        ApplicationArea = All;
                        Caption = 'NHIF Schedult';
                        Image = "Report";

                        // RunObject = Report "prNHIF mst";
                        ToolTip = 'Executes the NHIF Schedult action.';
                    }
                    action("NSSF Schedule")
                    {
                        ApplicationArea = All;
                        Caption = 'NSSF Schedule';
                        Image = "Report";

                        RunObject = Report "prNSSF mst";
                        ToolTip = 'Executes the NSSF Schedule action.';
                    }
                    action(Action1000000017)
                    {
                        ApplicationArea = All;
                        Caption = 'Third Rule';
                        Image = AddWatch;
                        RunObject = Report "A third Rule Report";
                        ToolTip = 'Executes the Third Rule action.';
                    }
                    action(Action1000000016)
                    {
                        ApplicationArea = All;
                        Caption = 'Co_op Remittance';
                        Image = CreateForm;
                        RunObject = Report "prCoop remmitance";
                        ToolTip = 'Executes the Co_op Remittance action.';
                    }

                }
                group(prlComparision)
                {
                    Caption = 'Payroll Vairance Report';
                    action(CumAll)
                    {
                        ApplicationArea = all;
                        Caption = 'Cummulative Allowances';
                        Image = Aging;
                        RunObject = Report "PRL-Cummulative Allowances";
                        ToolTip = 'Executes the Cummulative Allowances action.';
                    }
                    action(cumDed)
                    {
                        ApplicationArea = all;
                        Caption = 'Cummulative Allowances';
                        Image = Aging;
                        RunObject = Report "PRL-Cummulative Deductions";
                        ToolTip = 'Executes the Cummulative Allowances action.';
                    }
                    action(payrollvar)
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll Summary variance';
                        Image = Aging;
                        RunObject = Report "PR Payroll Summary - Variance";
                        ToolTip = 'Executes the Payroll Summary variance action.';
                    }
                    action(payrollvariace)
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll variance';
                        Image = Aging;
                        RunObject = Report "PRL-Payroll Variance Report2";
                        ToolTip = 'Executes the Payroll variance action.';
                    }
                    action(payrollvar2)
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll Variance 2';
                        Image = Aging;
                        RunObject = Report "Payroll Variance Report";
                        ToolTip = 'Executes the Payroll Variance 2 action.';
                    }
                    action(DetPayVar)
                    {
                        ApplicationArea = all;
                        Caption = 'Details Payroll Variance';
                        Image = Aging;
                        RunObject = Report "PRL-Detailed Payroll Variance";
                        ToolTip = 'Executes the Details Payroll Variance action.';
                    }
                    action(DetailedSimplifiedReport)
                    {
                        ApplicationArea = all;
                        Caption = 'Detailed Simplified Payroll Report';
                        Image = Aging;
                        RunObject = Report "PRL Detailed simplified Report";
                        ToolTip = 'Executes the Detailed Simplified Payroll Report action.';
                    }
                }

            }

            group(LeaveMan)
            {
                Caption = 'Leave Management';
                Image = Capacities;
                action(Action14)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Applications';
                    Image = Register;

                    RunObject = Page "HRM-Leave Requisition List";
                    ToolTip = 'Executes the Leave Applications action.';
                }
                action("Posted Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Leaves';
                    RunObject = Page "HRM-Leave Requisition Posted";
                    ToolTip = 'Executes the Posted Leaves action.';
                }
                action("Leave Journals")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Journals';
                    Image = Journals;

                    RunObject = Page "HRM-Emp. Leave Journal Lines";
                    ToolTip = 'Executes the Leave Journals action.';
                }
                action("Posted Leave")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Leave Journal';
                    RunObject = Page "HRM-Posted Leave Journal";
                    ToolTip = 'Executes the Posted Leave Journal action.';
                }
                action("Staff Movement Form")
                {
                    ApplicationArea = all;
                    //  RunObject = Page "HRM-Leave Return to Office";
                    ToolTip = 'Executes return to office for employees';
                } //HRM-Leave Types 
                action("Leave Types")
                {
                    ApplicationArea = all;
                    RunObject = Page "HRM-Leave Types";
                    ToolTip = 'Executes return to office for employees';
                    RunPageMode = Edit;
                }
            }

            group(JobMan)
            {
                Caption = 'Jobs Management';
                Image = ResourcePlanning;
                action("Jobs List")
                {
                    ApplicationArea = all;
                    Caption = 'Jobs List';
                    Image = Job;

                    RunObject = Page "HRM-Jobs List";
                    ToolTip = 'Executes the Jobs List action.';
                }
            }
            group(Recruit)
            {
                Caption = 'Recruitment Management';
                action("Employee Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Requisitions';
                    Image = ApplicationWorksheet;


                    RunObject = Page "HRM-Employee Requisitions List";
                    ToolTip = 'Executes the Employee Requisitions action.';
                }
                action("Job Applications List")
                {
                    ApplicationArea = all;
                    Caption = 'Job Applications List';
                    RunObject = Page "HRM-Job Applications List";
                    ToolTip = 'Executes the Job Applications List action.';
                }
                action("Short Listing")
                {
                    ApplicationArea = all;
                    Caption = 'Short Listing';
                    RunObject = Page "HRM-Shortlisting List";
                    ToolTip = 'Executes the Short Listing action.';
                }
                action("Qualified Job Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Qualified Job Applicants';
                    RunObject = Page "HRM-Job Applicants Qualified";
                    ToolTip = 'Executes the Qualified Job Applicants action.';
                }
                action("Unqualified Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Unqualified Applicants';
                    RunObject = Page "HRM-Job Applicants Unqualified";
                    ToolTip = 'Executes the Unqualified Applicants action.';
                }
                action("Advertised Jobs")
                {
                    ApplicationArea = all;
                    Caption = 'Advertised Jobs';
                    RunObject = Page "HRM-Advertised Job List";
                    ToolTip = 'Executes the Advertised Jobs action.';
                }
            }
            group(Performance)
            {
                Caption = 'Performance Appraisal';
                Image = Capacities;

                action("Appraisal Years")
                {
                    ApplicationArea = all;
                    Caption = 'Appraisal Years';
                    RunObject = Page "HRM-Appraisal Years List";
                    ToolTip = 'Executes  Appraisal Years.';
                }
                action("Appraisal HR Emp. List")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Appraisal List';
                    RunObject = Page "HRM-Appraisal HR Emp. List";
                    ToolTip = 'Executes  Appraisal HR Emp. List.';
                }
                action("Employee Self Targets")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Self Targets';
                    RunObject = Page "HRM-Appraisee Self Targets";
                    ToolTip = 'Executes  Employee Self Targets.';
                }
                action("Supervisor Appraisal List")
                {
                    ApplicationArea = all;
                    Caption = 'Supervisor Appraisal List';
                    RunObject = Page "HRM-Appraisal Supervisor Com.";

                }

            }
            group(train)
            {
                Caption = 'Training Management';
                action("Training Applications")
                {
                    ApplicationArea = All;
                    Caption = 'Training Applications';
                    RunObject = Page "HRM-Training Application List";
                    ToolTip = 'Executes the Training Applications action.';
                }
                action("Training Courses")
                {
                    ApplicationArea = All;
                    Caption = 'Training Courses';
                    RunObject = Page "HRM-Course List";
                    ToolTip = 'Executes the Training Courses action.';
                }
                action("Training Providers")
                {
                    ApplicationArea = All;
                    Caption = 'Training Providers';
                    RunObject = Page "HRM-Training Providers List";
                    ToolTip = 'Executes the Training Providers action.';
                }
                action("Training Needs")
                {
                    ApplicationArea = All;
                    Caption = 'Training Needs';
                    RunObject = Page "HRM-Train Need Analysis List";
                    ToolTip = 'Executes the Training Needs action.';
                }
                action("Back To Office")
                {
                    ApplicationArea = All;
                    Caption = 'Back To Office';
                    RunObject = Page "HRM-Back To Office List";
                    ToolTip = 'Executes the Back To Office action.';
                }
            }
            group(Welfare)
            {
                Caption = 'Welfare Management';
                Image = Capacities;
                action("Company Activity")
                {
                    ApplicationArea = All;
                    Caption = 'Company Activity';
                    RunObject = Page "HRM-Company Activities List";
                    ToolTip = 'Executes the Company Activity action.';
                }
            }
            group("Req To Approve")
            {
                ToolTip = 'Find Documents waiting for your approval';
                Caption = 'Approval Request';
                action("Requests To Approve")
                {
                    ApplicationArea = All;
                    RunObject = page "Requests to Approve";
                    Image = ApplyEntries;
                    Caption = 'Requests To Approve';
                    ToolTip = 'Executes the Requests To Approve action.';
                }

                action("My Approval requests")
                {

                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                    ToolTip = 'Executes the My Approval requests action.';
                    ApplicationArea = All;
                }

            }
            group("Common Requisitions")
            {
                ToolTip = 'Common Requisitions';
                Caption = 'Common Requisitions';
                action("Imprest Req")
                {

                    image = ItemRegisters;
                    ApplicationArea = Basic, Suite;
                    Ellipsis = true;
                    Caption = 'Imprest Requisition';
                    //     RunObject = Page "FIN-Imprests List";
                    ToolTip = 'Make New Imprest Requision';
                }
                action("Store Requisiton")
                {
                    ApplicationArea = Basic, Suite;
                    Ellipsis = true;
                    Caption = 'Store Requisition';
                    //    RunObject = Page "PROC-Store Requisition";
                    ToolTip = 'Request Items from the Store';
                }
                action("Purchase Requisiton")
                {
                    ApplicationArea = Basic, Suite;
                    Ellipsis = true;
                    Caption = 'Purchase Requisition';
                    //   RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Initiate purchase of Item';
                }

            }

            group(setus)
            {
                Caption = 'Setups';
                Image = HRSetup;
                action("Institutions List")
                {
                    ApplicationArea = all;
                    Caption = 'Institutions List';
                    Image = Line;

                    RunObject = Page "HRM-Institutions List";
                    ToolTip = 'Executes the Institutions List action.';
                }
                action(Denominations)
                {
                    ApplicationArea = all;
                    Caption = 'Denominations';
                    Image = Line;

                    RunObject = Page "HRM-Denominations";
                    ToolTip = 'Executes the Denomination action.';
                }
                action(ProfBodies)
                {
                    ApplicationArea = all;
                    Caption = 'Professional Bodies';
                    Image = Line;

                    RunObject = Page "HRM-Professional Bodies";
                    ToolTip = 'Executes the Professional Bodies action.';
                }
                action(Ethnicity)
                {
                    ApplicationArea = all;
                    Caption = 'Ethnicity';
                    Image = Line;

                    RunObject = Page "HRM-Ethnic Groups";
                    ToolTip = 'Executes the Ethnicity action.';
                }

                action("Base Calendar")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Base Calendar';
                    RunObject = Page "Base Calendar List";
                    ToolTip = 'Executes the Base Calendar action.';
                }
                action("Leave Type")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';
                    RunObject = Page "HRM-Leave Types";
                    ToolTip = 'Executes the Leave Types action.';
                }
                action("Hr Setups")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Setups';
                    RunObject = Page "HRM-SetUp List";
                    ToolTip = 'Executes the Hr Setups action.';
                }
                action("Hr Number Series")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Number Series';
                    RunObject = Page "Human Resource Setup";
                    ToolTip = 'Executes the Hr Number Series action.';
                }
                action(Committees)
                {
                    ApplicationArea = all;
                    Caption = 'Committees';
                    RunObject = Page "HRM-Committees";
                    ToolTip = 'Executes the Committees action.';
                }
                action("HR Values")
                {
                    ApplicationArea = all;
                    Caption = 'HR Values Setup';
                    RunObject = Page "HRM-Terms Setup";
                    ToolTip = 'Executes the Look Up Values action.';
                }
                // action(Statuory)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Statutory and Licensing';
                //     RunObject = Page "HRM-Licensing List";
                //     ToolTip = 'View institution and Licensing Details';
                // }
                action("Look Up Values")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Look Up Values';
                    RunObject = Page "HRM-Lookup Values List";
                    ToolTip = 'Executes the Look Up Values action.';
                }
                action("Hr Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Calendar';
                    RunObject = Page "Base Calendar List";
                    ToolTip = 'Executes the Hr Calendar action.';
                }
                action(" Email Parameters List")
                {
                    ApplicationArea = all;
                    Caption = ' Email Parameters List';
                    RunObject = Page "HRM-Email Parameters List";
                    ToolTip = 'Executes the  Email Parameters List action.';
                }
                action("No.Series")
                {
                    ApplicationArea = all;
                    Caption = 'No.Series';
                    RunObject = Page "No. Series";
                    ToolTip = 'Executes the No.Series action.';
                }
                action("Salary Steps")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Steps';
                    RunObject = Page "HRM-Job_Salary Grade/Steps";
                    ToolTip = 'Executes the Salary Steps action.';
                }
                action("Counties/Town setup")
                {
                    Image = CountryRegion;
                    ApplicationArea = all;
                    Caption = 'Counties/Towns SetUp';
                    //  RunObject = Page "Counties/Towns";
                    ToolTip = 'Counties/Towns SetUp';
                }
                action("Imprest Rates")
                {
                    Image = CountryRegion;
                    ApplicationArea = all;
                    Caption = 'Imprest Rates';
                    //  RunObject = Page "Imprest Rates";
                    ToolTip = 'Imprest Rates';
                }
            }
            group(pension)
            {
                Caption = 'Provident Management';
                Image = History;
                action(Action40)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Beneficiaries';
                    RunObject = Page "HRM-Emp. Beneficiaries List";
                    ToolTip = 'Executes the Employee Beneficiaries action.';
                }
                action("Pension Payments List")
                {
                    ApplicationArea = All;
                    Caption = 'Provident Payments List';
                    RunObject = Page "HRM-Pension Payments List";
                    ToolTip = 'Executes the Pension Payments List action.';
                }
            }
            group(exitInterview)
            {
                Caption = 'Separation';
                Image = Alerts;
                action("HRM CLearing Staff List")
                {
                    ApplicationArea = all;
                    Caption = 'Clearing Staff List';
                    RunObject = Page "HRM CLearing Staff List";
                    ToolTip = 'Executes the  Clearance action.';
                }
                action("Staff Clearance")
                {
                    ApplicationArea = all;
                    Caption = 'Staff Clearance';
                    RunObject = Page "HRM Clearance Form";
                    ToolTip = 'Executes the  Clearance action.';
                }
                action("Separation")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Separation';
                    RunObject = Page "HRM-Exit Interview List";
                    ToolTip = 'Executes the  Exit Interview action.';
                }
            }


        }
        area(creation)
        {
            action("Change Password")
            {
                Visible = false;
                ApplicationArea = All;
                Caption = 'Change Password';
                Image = ChangeStatus;



                ToolTip = 'Executes the Change Password action.';
                //RunObject = Page "Change Password";
            }


            action("mass update Transactions")
            {
                Visible = FALSE;
                ApplicationArea = All;
                Caption = 'mass update Transactions';
                Image = PostBatch;

                // RunObject = Report "Mass Update Transactions";
                ToolTip = 'Executes the mass update Transactions action.';
            }
            group("Payroll Journal")
            {
                action("payroll Journal Transfer")
                {
                    ApplicationArea = All;
                    Caption = 'payroll Journal Transfer';
                    Image = Journals;

                    RunObject = Report prPayrollJournalTransfer;
                    ToolTip = 'Executes the payroll Journal Transfer action.';
                }
            }
        }
    }
}

