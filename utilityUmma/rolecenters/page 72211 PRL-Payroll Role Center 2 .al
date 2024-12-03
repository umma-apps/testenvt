page 86004 "PRL-Payroll Role C"
{
    Caption = 'Payroll Role Center ';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("Dashboard Greetings"; "Dashboard Greetings")

            {
                ApplicationArea = all;
            }
            // group(Control1900724808)
            // {
            //     ShowCaption = false;
            //     part(Control1902899408; "PRL-Emp. Cue (Payroll)")
            //     {
            //         Caption = 'Payroll Insights';
            //         ApplicationArea = All;
            //     }
            // }
            // group(Control1900724708)
            // {
            //     ShowCaption = false;
            //     part(Control1907692008; "My Customers")
            //     {
            //         ApplicationArea = All;
            //     }
            //     part(Control1905989608; "My Items")
            //     {
            //         ApplicationArea = All;
            //     }
            //     part(Control1; "My Job Queue")
            //     {
            //         Visible = false;
            //         ApplicationArea = All;
            //     }
            //     systempart(Control1901377608; MyNotes)
            //     {
            //         ApplicationArea = All;
            //     }
            // }
        }
    }

    actions
    {

        area(reporting)
        {

            group(Reports2)
            {
                Caption = 'Payroll Reports';
                Image = Payables;
                action(Payslips)
                {
                    ApplicationArea = all;
                    Caption = 'Payslips';
                    Image = Report;

                    RunObject = Report "PRL-Payslips V 1.1.1";
                    ToolTip = 'Executes the Payslips action.';
                }

                action("Master Payroll Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Master Payroll Summary';
                    Image = Report;

                    RunObject = Report "PRL-Company Payroll Summary 3";
                    ToolTip = 'Executes the Master Payroll Summary action.';
                }
                action("Payroll  Analysis")
                {
                    ApplicationArea = All;
                    Caption = 'Payroll Analysis';
                    Image = AnalysisView;
                    RunObject = Report "Payroll Analysis Report";
                    ToolTip = 'Executes Payroll Analysis Report';
                }
                // action("Payroll Summary2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll Summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "PRL-Company Payroll Summary 3";
                //     ToolTip = 'Executes the Payroll Summary action.';
                // }
                action("Deductions Summary 2")
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    Image = "Report";

                    //  RunObject = Report "PRL-Deductions Summary";
                    ToolTip = 'Executes the Deductions Summary action.';
                }
                action("Earnings Summary 2")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    Image = "Report";

                    //  RunObject = Report "PRL-Payments Summary";
                    ToolTip = 'Executes the Earnings Summary action.';
                }
                action("vew payslip")
                {
                    ApplicationArea = all;
                    Caption = 'vew payslip';
                    Image = "Report";

                    RunObject = Report "Individual Payslips V.1.1.3";
                    ToolTip = 'Executes the vew payslip action.';
                }
                // action("Payroll summary")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll summary';
                //     Image = "Report";
                //     
                //     RunObject = Report "Payroll Summary 2";
                //     ToolTip = 'Executes the Payroll summary action.';
                // }
                action("Deductions Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    Image = "Report";

                    //  RunObject = Report "PRL-Deductions Summary";
                    ToolTip = 'Executes the Deductions Summary action.';
                }
                action("Earnings Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    Image = "Report";

                    //   RunObject = Report "PRL-Earnings Summary";
                    ToolTip = 'Executes the Earnings Summary action.';
                }
                action("Staff pension")
                {
                    ApplicationArea = all;
                    Caption = 'Staff pension';
                    Image = "Report";

                    //   RunObject = Report "prStaff Pension Contrib";
                    ToolTip = 'Executes the Staff pension action.';
                }

                action("Gross Netpay")
                {
                    ApplicationArea = all;
                    Caption = 'Gross Netpay';
                    Image = "Report";
                    RunObject = Report prGrossNetPay;
                    ToolTip = 'Executes the Gross Netpay action.';
                }
                action("Third Rule")
                {
                    Caption = 'Third Rule';
                    Image = "Report";
                    RunObject = Report "A third Rule Report";
                    ToolTip = 'Executes the Third Rule action.';
                    ApplicationArea = All;
                }
                action("P9 Report")
                {
                    ApplicationArea = all;
                    Caption = 'P9 Report';
                    Image = PrintForm;


                    RunObject = Report "P9 Report (Final)";
                    ToolTip = 'Executes the P9 Report action.';
                }
                action("Co_op Remittance")
                {
                    ApplicationArea = all;
                    Caption = 'Co_op Remittance';
                    Image = "Report";
                    RunObject = Report "prCoop remmitance";
                    ToolTip = 'Executes the Co_op Remittance action.';
                }
                action(Transactions)
                {
                    ApplicationArea = all;
                    Caption = 'Transactions';
                    Image = "Report";
                    RunObject = Report "pr Transactions";
                    ToolTip = 'Executes the Transactions action.';
                }
                action("bank Schedule2")
                {
                    ApplicationArea = all;
                    Caption = 'Bank Schedule';
                    Image = "Report";
                    RunObject = Report "PRL-Bank Schedule";
                    ToolTip = 'Executes the bank Schedule action.';
                }
                action(bankTotals)
                {
                    ApplicationArea = All;
                    Caption = 'Bank Total Monthly Payable';
                    Image = "Report";
                    RunObject = Report "Bank Total Monthly Payable";
                    ToolTip = 'Excecutes Bank Totals Report';
                }
            }

        }
        area(Embedding)
        {
            action("Transaction Codes")
            {
                ApplicationArea = all;
                Caption = 'Transcation Codes';

                RunObject = Page "PRL-Transaction Codes List";
                ToolTip = 'Executes the Transcation Codes action.';
            }
            action(payrolldata)
            {
                ApplicationArea = all;
                Caption = 'Payroll data';
                RunObject = Page "PRL-Payroll Raw Data";
            }
            action(updatedata)
            {
                ApplicationArea = All;
                RunObject = page "CSV Combiner";
            }
            action(PRLTrans)
            {
                Caption = 'Payroll Journal Batches';
                ApplicationArea = All;
                RunObject = page "Journal Batches";
            }
        }
        area(sections)
        {
            group(Payroll)
            {
                Caption = 'Payroll';
                Image = SNInfo;
                action("Salary Card")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Card';
                    Image = Employee;

                    RunObject = Page 68056;
                    //RunPageView = WHERE(Status = FILTER(Normal));
                    ToolTip = 'Executes the Salary Card action.';
                }
                action("Inactive Employees")
                {
                    ApplicationArea = all;
                    Caption = 'Inactive Employees';
                    Image = Employee;

                    RunObject = Page "HRM-Employee-List";
                    //RunPageView = WHERE(Status = FILTER(<> Normal));
                    ToolTip = 'Executes the Inactive Employees action.';
                }
                action("Transcation Codes")
                {
                    ApplicationArea = all;
                    Caption = 'Transcation Codes';
                    Image = Setup;

                    RunObject = Page "PRL-Transaction Codes List";
                    ToolTip = 'Executes the Transcation Codes action.';
                }

                action("Payroll Mass Changes")
                {
                    Caption = 'Payroll Mass Changes';
                    Image = AddAction;

                    RunObject = Page "HRM-Import Emp. Trans Buff";
                    ToolTip = 'Executes the Payroll Mass Changes action.';
                    ApplicationArea = All;
                }
                action("payment Vouchers")
                {
                    ApplicationArea = all;
                    Caption = ' payment Vouchers';
                    //  RunObject = Page "FIN-Payment Vouchers";
                    ToolTip = 'Executes the  payment Vouchers action.';
                }
                action("Claims")
                {
                    Image = CopyGLtoCostBudget;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Claims';
                    RunObject = Page "FIN-Staff Claim List";
                    RunPageMode = Create;
                    ToolTip = 'Raise staff claim';
                }
                action("PT-Claims Pending Approval")
                {
                    RunObject = page "PTClaims Header";
                    ApplicationArea = All;
                }
            }
            group("Payroll Approvals")
            {
                action("PRL Approval Active List")
                {
                    ApplicationArea = All;

                    RunObject = page "PRL Approval Active List";
                    ToolTip = 'Payroll Approval';

                }
                action("PRL Approval List")
                {
                    ApplicationArea = all;

                    RunObject = Page "Prl-Approval List";
                    ToolTip = 'Payroll Approval List';
                }
            }
            group("Casuals")
            {
                action(casualsPrl)
                {
                    ApplicationArea = All;
                    Caption = 'Casuals Payroll Periods';
                    RunObject = Page "PRL-Casual Payroll Periods";
                    ToolTip = 'Setup for Casuals Payroll';

                }
                action("Casuals List")
                {
                    ApplicationArea = All;
                    Image = HumanResources;
                    RunObject = Page "HRM-Casuals Lists";
                    ToolTip = 'Shows a list of all the Casual Staff';
                }
                action("Casuals Salary Card")
                {
                    ApplicationArea = All;
                    Image = CustomerSalutation;
                    RunObject = Page "HRM-Casual Pay List";
                    ToolTip = 'Displays Casuals Salary Card';
                }
                action("Casuals Worked Days")
                {
                    ApplicationArea = All;
                    Image = Customer;
                    RunObject = Page "PRL-Casual Worked Days";
                    ToolTip = 'Casuals Worked Days';
                }
                action("Casuals Transactions")
                {
                    ApplicationArea = All;
                    Image = Customer;
                    RunObject = Page "PRL-Casual Emp. Transactions";
                }


            }
            group("Work Study")
            {
                action("WorkStudy List")
                {
                    ApplicationArea = All;
                    Image = HumanResources;
                    RunObject = Page "HRM-WorkStudy List";
                    ToolTip = 'Shows a list of all the Workstudy Students';
                }
                action("WorkStudy Salary Card")
                {
                    ApplicationArea = All;
                    Image = CustomerSalutation;
                    RunObject = Page "HRM-WorkStudy Pay List";
                    ToolTip = 'WorkStudy Salary Card';
                }
                action("Casuals Worked Hours")
                {
                    ApplicationArea = All;
                    Image = Customer;
                    RunObject = Page "PRL-WorkStudy Worked Hours";
                    ToolTip = 'Workstudy Worked Days';
                }
            }
            group("Salary Increaments")
            {
                Caption = 'Salary Increments';
                Image = Intrastat;
                action("Salary Increament Process")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                    ToolTip = 'Executes the Salary Increament Process action.';
                }
                action("Salary Increament Register")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                    ToolTip = 'Executes the Salary Increament Register action.';
                }
                action("Un-Afected Salary Increaments")
                {
                    ApplicationArea = all;
                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                    ToolTip = 'Executes the Un-Afected Salary Increaments action.';
                }
                action("Leave Allowance Buffer")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Allowance Buffer';
                    Image = Bins;

                    RunObject = Page "HRM-Leave Allowance Buffer";
                    ToolTip = 'Executes the Leave Allowance Buffer action.';
                }
            }
            group("Payroll Journals")
            {
                ToolTip = 'Transfer Payroll Transactions to payroll';
                action("payroll Journal")
                {
                    ApplicationArea = All;
                    Caption = 'payroll Journal';
                    Image = Journals;

                    RunObject = Report prPayrollJournalTransfer;
                    ToolTip = 'Executes the payroll Journal action.';
                }
                action("payroll Journal Transfer")
                {
                    ApplicationArea = All;
                    Caption = 'payroll Journal Transfer';
                    Image = Journals;

                    RunObject = Report prPayrollJournalTransfer;
                    ToolTip = 'Executes the payroll Journal Transfer action.';
                }
            }
            group(ATT)
            {
                Caption = 'Attendance';
                action("Staff Register")
                {
                    ApplicationArea = all;

                    Caption = 'Staff Register';
                    RunObject = Page "Staff Reg.Ledger List";
                    ToolTip = 'Executes the Staff Register action.';
                }
                action("Staff Register History")
                {
                    ApplicationArea = all;

                    Caption = 'Staff Register History';
                    RunObject = Page "Staff Ledger History";
                    ToolTip = 'Executes the Staff Register History action.';
                }
                action("Casuals Register")
                {
                    ApplicationArea = all;

                    Caption = 'Casuals Register';
                    RunObject = Page "Casuals  Reg.Ledger List";
                    ToolTip = 'Executes the Casuals Register action.';
                }
                action("Casuals History")
                {
                    ApplicationArea = all;

                    Caption = 'Casuals History';
                    RunObject = Page "Casuals Ledger History";
                    ToolTip = 'Executes the Casuals History action.';
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;
                action("Pending My Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Pending My Approval';
                    RunObject = Page "Approval Entries";
                    ToolTip = 'Executes the Pending My Approval action.';
                }
                action("My Approval requests")
                {
                    ApplicationArea = all;
                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                    ToolTip = 'Executes the My Approval requests action.';
                }
                // action("Clearance Requests")
                // {
                //     Caption = 'Clearance Requests';
                //      RunObject = Page "ACA-Clearance Approval Entries";
                // }
            }
            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Stores Requisitions")
                {
                    ApplicationArea = all;

                    Caption = 'Stores Requisitions';
                    // RunObject = Page "PROC-Store Requisition";
                    ToolTip = 'Executes the Stores Requisitions action.';
                }
                action("Imprest Requisitions")
                {
                    ApplicationArea = all;

                    Caption = 'Imprest Requisitions';
                    //RunObject = Page "FIN-Imprest List UP";
                    ToolTip = 'Executes the Imprest Requisitions action.';
                }
                action("Leave Applications")
                {
                    ApplicationArea = all;

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ToolTip = 'Executes the Leave Applications action.';
                }
                action("My Approved Leaves")
                {
                    ApplicationArea = all;

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ToolTip = 'Executes the My Approved Leaves action.';
                }
                // action("Meal Booking")
                // {

                //     Caption = 'Meal Booking';
                //     RunObject = Page "CAT-Meal Booking List";
                // }
            }
        }


        area(creation)
        {
            group(Payroll_Setups)
            {
                Caption = 'Payroll Setups';
                Image = HRSetup;
                action("Payroll Period")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Period';
                    Image = Period;
                    RunObject = Page "PRL-Payroll Periods";
                    ToolTip = 'Executes the Payroll Period action.';
                }
                action("Pr Rates")
                {
                    ApplicationArea = all;
                    Caption = 'Pr Rates';
                    Image = SetupColumns;

                    RunObject = Page "PRL-Rates & Ceilings";
                    ToolTip = 'Executes the Pr Rates action.';
                }
                action("paye Setup")
                {
                    ApplicationArea = all;
                    Caption = 'paye Setup';
                    Image = SetupPayment;

                    RunObject = Page "PRL-P.A.Y.E Setup";
                    ToolTip = 'Executes the paye Setup action.';
                }//"prNSSF Tiers List"
                action(Action106)
                {
                    ApplicationArea = all;
                    Caption = 'Employee NSSF';
                    Image = ListPage;

                    RunObject = Page "PRL-NSSF";
                    ToolTip = 'Executes the Employee NSSF action.';
                }
                action(Action107)
                {
                    ApplicationArea = all;
                    Caption = 'Employee NSSF';
                    Image = ListPage;

                    RunObject = Page "prNSSF Tiers List";
                    ToolTip = 'Executes the Employee NSSF action.';
                }
                action(Action7)
                {
                    ApplicationArea = all;
                    Caption = 'Transcation Codes';
                    Image = Setup;

                    RunObject = Page "PRL-Transaction Codes List";
                    ToolTip = 'Executes the Transcation Codes action.';
                }
                action(Action6)
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Setup';
                    Image = SetupLines;

                    RunObject = Page "PRL-NHIF SetUp";
                    ToolTip = 'Executes the NHIF Setup action.';
                }
                action("Hr Employee Card")
                {
                    ApplicationArea = all;


                    Image = Employee;
                    RunObject = Page "HRM-Employee (C)";
                    ToolTip = 'Executes the Hr Employee Card action.';
                }
                action("Bank Structure")
                {
                    ApplicationArea = all;
                    Caption = 'Bank Structure';
                    Image = Bank;

                    RunObject = Page "PRL-Bank Structure (B)";
                    ToolTip = 'Executes the Bank Structure action.';
                }
                action("control information")
                {
                    ApplicationArea = all;
                    Caption = 'control information';
                    Image = CompanyInformation;

                    RunObject = Page "GEN-Control-Information";
                    ToolTip = 'Executes the control information action.';
                }
                action("Salary Grades")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Grades';
                    Image = EmployeeAgreement;

                    RunObject = Page "PRL-Salary Grades";
                    ToolTip = 'Executes the Salary Grades action.';
                }
                action("posting group")
                {
                    ApplicationArea = all;
                    Caption = 'posting group';
                    Image = PostingEntries;

                    RunObject = Page "PRL-Employee Posting Group";
                    ToolTip = 'Executes the posting group action.';
                }
                action(Action69)
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                    ToolTip = 'Executes the Salary Increament Process action.';
                }
                action(Action68)
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                    ToolTip = 'Executes the Salary Increament Register action.';
                }
                action(Action66)
                {
                    ApplicationArea = all;
                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                    ToolTip = 'Executes the Un-Afected Salary Increaments action.';
                }
                action(Action9)
                {
                    ApplicationArea = all;
                    Caption = ' payment Vouchers';
                    // RunObject = Page "FIN-Payment Vouchers";
                    Image = Payment;
                    ToolTip = 'Executes the  payment Vouchers action.';
                }
                action("Staff Welfare Loan Tires")
                {
                    Image = WarrantyLedger;
                    ApplicationArea = all;
                    Caption = 'Staff Welfare Loan Tires';
                    RunObject = Page "HRM Welfare Loan Tiers";
                    ToolTip = 'Executes the Staff Welfare Loan Tires action.';
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
                    //RunObject = Page "Imprest Rates";
                    ToolTip = 'Imprest Rates';
                }
            }
            group(PayRepts2)
            {
                Caption = 'Monthly Payroll Reports';
                Image = ResourcePlanning;
                action("Individual Payslip")
                {
                    ApplicationArea = all;
                    Caption = 'Individual Payslip';
                    Image = Report2;


                    RunObject = Report "PRL-Payslips V 1.1.1";
                    ToolTip = 'Executes the Individual Payslip action.';
                }
                // action("Individual Payslip 2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Individual Payslip 2';
                //     Image = Report2;
                //     
                //     
                //     RunObject = Report "PRL-Payslips V 1.1.1";
                // }Detailed Payroll Summary 1

                action("Detailed master Payroll Summary")
                {
                    ApplicationArea = all;
                    Caption = 'master Payroll Summary';
                    Image = Report2;
                    //RunObject = Report "Detailed Payroll Summary";
                    ToolTip = 'Executes the Detailed Payroll Summary action.';
                    //Detailed Payroll Summary 1  //"Umma Deduction  Report"

                }
                action("Detailed Payroll Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Detailed master Payroll Summary';
                    Image = Report2;
                    RunObject = Report "Payroll Summary 3";
                    ToolTip = 'Executes the Detailed Payroll Summary action.';
                }
                action("Umma Deduction  Report")
                {
                    ApplicationArea = all;
                    Caption = 'Umma Deduction  Report';
                    Image = Report2;
                    RunObject = Report "Umma Deduction  Report";
                    ToolTip = 'Executes the Umma Deduction  Report action.';
                }
                action("Payroll Variance")
                {
                    ApplicationArea = All;
                    Image = TestReport;


                    RunObject = Report "PR Trans  Variance Analysis";
                    ToolTip = 'Executes the payroll variance';
                }
                action("Departmental Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Departmental Summary';
                    Image = "Report";


                    //  RunObject = Report "Payroll Summary (Depts)";
                    ToolTip = 'Executes the Departmental Summary action.';
                }
                action(payslipCasual2)
                {
                    ApplicationArea = all;
                    Caption = 'Company Payslip';
                    Image = Calculate;
                    RunObject = Report "PRL-Company Payroll Summary 4";
                    //ToolTip = 'Casuals Individual Payslip';
                }

                action(Action1000000047)
                {
                    ApplicationArea = all;
                    Caption = 'Company Payslip';
                    Image = "Report";

                    RunObject = Report "PRL-Company Payroll Summary 3";
                    ToolTip = 'Executes the Company Payslip action.';
                }
                // action("Company Payslip")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Company Payslip 2';
                //     Image = "Report";

                //     RunObject = Report "PRL-Company Payslip";
                //     ToolTip = 'Executes the Company Payslip 2 action.';
                // }

                action(Action1000000044)
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    Image = DepositSlip;
                    // RunObject = Report "PRL-Earnings Summary";
                    ToolTip = 'Executes the Earnings Summary action.';
                }
                action(Action1000000042)
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary 2';
                    Image = "Report";

                    // RunObject = Report "PRL-Payments Summary";
                    ToolTip = 'Executes the Earnings Summary 2 action.';
                }
                action(Action1000000043)
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary 2';
                    Image = "Report";

                    //     RunObject = Report "PRL-Deductions Summary 2";
                    ToolTip = 'Executes the Deductions Summary 2 action.';
                }
                action(Action1000000045)
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    Image = Report;
                    // RunObject = Report "PRL-Deductions Summary";
                    ToolTip = 'Executes the Deductions Summary action.';
                }
                action(Action1000000041)
                {
                    ApplicationArea = all;
                    Caption = 'Staff pension';
                    Image = Aging;
                    // RunObject = Report "prStaff Pension Contrib";
                    ToolTip = 'Executes the Staff pension action.';
                }

            }
            group(PayrollPeoro)
            {
                Caption = 'UMMA Payroll Reports';
                Image = RegisteredDocs;
                action(Action1000000036)

                {
                    ApplicationArea = all;
                    Caption = 'UMMA PAYROLL STAFF';
                    Image = PrintForm;


                    RunObject = Report "PRL-Staff Master Report";
                    ToolTip = 'UMMA Payroll Staff Report';
                }
                action(LeaveStatement)
                {
                    Caption = 'Employee Leave Statement';
                    ApplicationArea = all;
                    Image = LedgerEntries;
                    RunObject = Report "HR Leave Statement";
                    ToolTip = 'Executes the Employee Leave Statement action.';
                }
                action(Csv)
                {
                    ApplicationArea = all;
                    Caption = 'KRA CSV FULLTIME';
                    Image = Report;
                    RunObject = Report "PR iTax Report";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv2)
                {
                    ApplicationArea = all;
                    Caption = 'KRA Exempted CSV';
                    Image = Report;
                    RunObject = Report "Exempted Csv";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv7)
                {
                    ApplicationArea = all;
                    Caption = 'KRA COMBINED CSV';
                    Image = Report;
                    RunObject = Report "PR iTax Report2";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv8)
                {
                    ApplicationArea = all;
                    Caption = 'Update KRA data';
                    Image = Report;
                    RunObject = Report UpdatePrlDta;
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv3)
                {
                    ApplicationArea = all;
                    Caption = 'Housing Levy CSV';
                    Image = Report;
                    RunObject = Report "Housing Levi Csv";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv9)
                {
                    ApplicationArea = all;
                    Caption = 'Housing Levy CSV Combined';
                    Image = Report;
                    RunObject = Report "Housing Levy Csv(Combined)";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv6)
                {
                    ApplicationArea = all;
                    Caption = 'Housing Levy Report';
                    Image = Report;
                    RunObject = Report "Housing Levy Report";
                    ToolTip = 'Executes the Payslips action.';
                }
                action(Csv4)
                {
                    ApplicationArea = all;
                    Caption = 'Helb CSV';
                    Image = Report;
                    RunObject = Report "Helb Csv";
                    ToolTip = 'Executes the Payslips action.';
                }

                action(Paye)
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = Report PAYE;
                }
                action(Action1000000038)
                {
                    ApplicationArea = all;
                    Caption = 'P9 Report';
                    Image = PrintForm;


                    RunObject = Report "P9 Report (Final)";
                    ToolTip = 'Executes the P9 Report action.';
                }

                action(Action1000000037)
                {
                    ApplicationArea = all;
                    Caption = 'Transactions';
                    Image = "Report";

                    RunObject = Report "pr Transactions";
                    ToolTip = 'Executes the Transactions action.';
                }
                action(Action1000000040)
                {
                    ApplicationArea = all;
                    Caption = 'Gross Netpay';
                    Image = Giro;
                    RunObject = Report prGrossNetPay;
                    ToolTip = 'Executes the Gross Netpay action.';
                }
                action(Action1000000035)
                {
                    ApplicationArea = all;
                    Caption = 'bank Schedule';
                    Image = "Report";

                    RunObject = Report "pr Bank Schedule";
                    ToolTip = 'Executes the bank Schedule action.';
                    Visible = false;
                }
                action("Employer Certificate")
                {

                    Caption = 'Employer Certificate';
                    Image = "Report";


                    ToolTip = 'Executes the Employer Certificate action.';
                    ApplicationArea = All;
                    // todo RunObject = Report "Employer Certificate P.10 mst";
                }
                action("P.10")
                {
                    ApplicationArea = all;
                    Caption = 'P.10';
                    Image = "Report";

                    //   RunObject = Report "P.10 A mst";
                    ToolTip = 'Executes the P.10 action.';
                }
                action("Paye Scheule")
                {
                    ApplicationArea = all;
                    Caption = 'Paye Schedule';
                    Image = "Report";

                    RunObject = Report "prPaye Schedule mst";
                    ToolTip = 'Executes the Paye Schedule action.';
                }
                action("NHIF Schedule")
                {
                    ApplicationArea = all;
                    Caption = 'SHIF SchedulE';
                    Image = "Report";
                    RunObject = Report "PRL SHIF Report";
                    ToolTip = 'Executes the NHIF Schedult action.';
                }
                // action("NSSF Schedule")
                // {
                //     ApplicationArea = all;
                //     Caption = 'NSSF Schedule';
                //     Image = "Report";

                //     RunObject = Report "prNSSF mst";
                //     ToolTip = 'Executes the NSSF Schedule action.';
                // }
                action(Action1000000029)
                {
                    ApplicationArea = all;
                    Caption = 'Third Rule';
                    Image = AddWatch;
                    RunObject = Report "A third Rule Report";
                    ToolTip = 'Executes the Third Rule action.';
                }
                action(Action1000000028)
                {

                    Caption = 'Co_op Remittance';
                    Image = CreateForm;
                    RunObject = Report "prCoop remmitance";
                    ToolTip = 'Executes the Co_op Remittance action.';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("mass update Transactions")
                {
                    ApplicationArea = all;
                    Caption = 'mass update Transactions';
                    Image = PostBatch;

                    //  RunObject = Report "Mass Update Transactions";
                    ToolTip = 'Executes the mass update Transactions action.';
                }
                action("Pension Report")
                {
                    ApplicationArea = all;
                    Caption = 'Pension Report';
                    Image = PrintForm;


                    //  RunObject = Report "PRL-Pension Report";
                    ToolTip = 'Executes the Pension Report action.';
                }
                action("Bank Schedule")
                {
                    ApplicationArea = all;
                    Caption = 'Bank Schedule';
                    Image = "Report";

                    RunObject = Report "PRL-Bank Schedule";
                    ToolTip = 'Executes the Bank Schedule action.';
                }
                action("NHIF Report")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NHIF Report";
                    ToolTip = 'Executes the NHIF Report action.';
                }
                action("SACCO Report")
                {
                    ApplicationArea = all;
                    Caption = 'SACCO Report';
                    Image = "Report";

                    RunObject = Report "PRL-Welfare Report";
                    ToolTip = 'Executes the SACCO Report action.';
                    Visible = false;
                }
                action("HELB Report")
                {
                    ApplicationArea = all;
                    Caption = 'HELB Report';
                    Image = "Report";


                    RunObject = Report "PRL-HELB Report";
                    ToolTip = 'Executes the HELB Report action.';
                }
                action("NSSF Report (A)")
                {
                    ApplicationArea = all;
                    Caption = 'NSSF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NSSF Report (A)";
                    ToolTip = 'Executes the NSSF Report action.';
                }
                action("NSSF Report (B)")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Report Test';
                    Image = "Report";

                    RunObject = Report "Payroll SummaryFix";
                    //ToolTip = 'Executes the NSSF Report (B) action.';
                }
                action("NSSF Report (Combined)")
                {
                    ApplicationArea = all;
                    Caption = 'NSSF Report (Combined)';
                    Image = "Report";

                    RunObject = Report "PRL-NSSF Report Combined";
                    ToolTip = 'Executes the NSSF Report (Combined) action.';
                }
                action(provident)
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = Report "Provident Report";
                }
                action(departStat)
                {
                    ApplicationArea = All;
                    Image = Process;
                    RunObject = Report "Payroll Summary Dept";
                }
                action("External Deductions")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "PRl-External Deductions";

                }


                // action(provident2)
                // {
                //     ApplicationArea = All;
                //     Image = Report;
                //     RunObject = Report "Provident Contribution";
                // }


            }
            group("Bank Flat Files")
            {
                action("NCBA FLAT FILE")
                {
                    ApplicationArea = all;
                    Caption = 'NCBA FLAT FILE';
                    Image = "Report";

                    RunObject = Report "PRL-Bank Schedule";
                    ToolTip = 'Executes the NCBA flat file';
                }
            }
            group(prlComparision)
            {
                Caption = 'Payroll Vairance Report';

                action(variance1)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Variance';
                    Image = ItemVariant;
                    RunObject = Report "Payroll Variance Reports";

                }
                action(variance2)
                {
                    ApplicationArea = All;
                    Caption = 'Detailed Variance Summary';
                    Image = Timeline;
                    RunObject = Report "PRL Detailed simplified Report";


                }
                action(variance3)
                {
                    ApplicationArea = All;
                    Caption = 'Payroll Summary Variance';
                    Image = Aging;
                    RunObject = Report "PR Summary - Variance";
                    ToolTip = 'Executes Variance Report';

                }
                action(variance4)
                {
                    ApplicationArea = All;
                    Caption = 'PRL Variance Reports';
                    Image = Aging;
                    RunObject = Report "PRL Variance Report";
                    ToolTip = 'Executes Variance Report';

                }
                // action(CumAll)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Cummulative Allowances';
                //     Image = Aging;
                //     RunObject = Report "PRL-Cummulative Allowances";
                //     ToolTip = 'Executes the Cummulative Allowances action.';
                // }
                // action(cumDed)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Cummulative Allowances';
                //     Image = Aging;
                //     RunObject = Report "PRL-Cummulative Deductions";
                //     ToolTip = 'Executes the Cummulative Allowances action.';
                // }
                // action(payrollvar)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll Summary variance';
                //     Image = Aging;
                //     RunObject = Report "PR Payroll Summary - Variance";
                //     ToolTip = 'Executes the Payroll Summary variance action.';
                // }
                // action(payrollvariace)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll variance';
                //     Image = Aging;
                //     RunObject = Report "PRL-Payroll Variance Report2";
                //     ToolTip = 'Executes the Payroll variance action.';
                // }
                // action(payrollvar2)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Payroll Variance 2';
                //     Image = Aging;
                //     RunObject = Report "Payroll Variance Report";
                //     ToolTip = 'Executes the Payroll Variance 2 action.';
                // }
                // action(DetPayVar)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Details Payroll Variance';
                //     Image = Aging;
                //     RunObject = Report "PRL-Detailed Payroll Variance";
                //     ToolTip = 'Executes the Details Payroll Variance action.';
                // }
                // action(DetailedSimplifiedReport)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Detailed Simplified Payroll Report';
                //     Image = Aging;
                //     RunObject = Report "PRL Detailed simplified Report";
                //     ToolTip = 'Executes the Detailed Simplified Payroll Report action.';
                // }
            }
            group(casualsRpt)
            {
                Caption = 'Casuals Payroll Reports';
                action(casualCom)
                {
                    ApplicationArea = all;
                    Caption = 'Casuals Company Payslip';
                    Image = CashFlow;
                    RunObject = Report "Casual-Company Payslip";
                    ToolTip = 'Casuals Company Payslip';
                }

                action(payslipCasual)
                {
                    ApplicationArea = all;
                    Caption = 'Caual Payslips';
                    Image = Calculate;
                    RunObject = Report "Casual-Individual Payslips";
                    ToolTip = 'Casuals Individual Payslip';
                }
                action(casualSummary)
                {
                    ApplicationArea = all;
                    Caption = 'Caual Payroll Summary';
                    Image = CompareContacts;
                    RunObject = Report "Casuals Summary Report";
                    ToolTip = 'Casuals Summary Report';
                }
                action(workStudySumm)
                {
                    ApplicationArea = All;
                    Caption = 'Workstudy Payroll Summary';
                    Image = Workdays;
                    RunObject = Report "WorkStudy Summary Report";
                    ToolTip = 'Executes Workstudy Summary Report';

                }
            }
        }
    }

}

