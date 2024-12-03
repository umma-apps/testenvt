page 86002 "HRM Role C"
{
    Caption = 'HRM-Role Center';
    PageType = RoleCenter;

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
            // part(EmployeeStats; "Hrm-Cue")
            // {
            //     ApplicationArea = all;
            // }
            group(Control29)
            {

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
        area(Creation)
        {
            action(HRMJobs)
            {
                ApplicationArea = all;
                Caption = 'Jobs List';
                Image = Job;

                RunObject = Page "HRM-Jobs List";
                ToolTip = 'Executes the Jobs List action.';

            }

            action(HRMemployee)
            {
                ApplicationArea = all;
                Caption = 'Employee List';
                RunObject = Page "HRM-Employee List";
                ToolTip = 'Executes the Employee List action.';
            }
            action(leaveSch)
            {
                ApplicationArea = All;
                Caption = 'Leave Schedule';
                RunObject = page "HRM Leave Schedule";
                ToolTip = 'Employee Leave Schedule';
            }
            action(HRMEmployees)
            {
                ApplicationArea = all;
                Caption = 'Inactive Employee List';
                Image = Job;

                RunObject = Page "HRM-Employee-List (Inactive)";
                ToolTip = 'Executes the Inactive Employee List action.';

            }
            action(LeaveJournal)
            {
                ApplicationArea = all;
                Caption = 'Leave Journals';
                Image = Journals;

                ToolTip = 'Allocate and Post leave days for Employees';
                RunObject = Page "HRM-Emp. Leave Journal Lines";

            }
            action(Action1000000003)
            {
                ApplicationArea = all;
                Caption = 'Leave Applications';
                RunObject = Page "HRM-Leave Requisition List";
                ToolTip = 'Executes the Leave Applications action.';
            }
            action(HRMLeavesApplies)
            {
                ApplicationArea = all;
                Caption = 'View Leave Applications';
                RunObject = Page "HRM-View Leave List";
                ToolTip = 'Executes the View Leave Applications action.';
            }
            action(HRMPostedLeaves)
            {
                ApplicationArea = all;
                Caption = 'Posted Leave';
                RunObject = Page "HRM-Leave Requisition Posted";
                ToolTip = 'Executes the Posted Leave action.';
            }

            action("My Approved Leaves")
            {
                ApplicationArea = all;
                Caption = 'My Approved Leaves';
                Image = History;
                RunObject = Page "HRM-My Approved Leaves List";
                ToolTip = 'Executes the My Approved Leaves action.';
            }
        }

        area(Reporting)
        {
            group(HRMReport)
            {
                Caption = 'UMMA HRM Reports';
                ToolTip = 'Get Reports Related to Employee Manager';
                action(EmployeeList)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    Image = Employee;


                    RunObject = Report "HR Employee List";
                    ToolTip = 'Executes the Employee List action.';
                }
                action(empReq)
                {
                    ApplicationArea = All;
                    Caption = 'Report';
                    Image = Employee;

                    RunObject = Report "HR Leave Application";
                }
                action(mployeeBeneficiaries)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    Image = "Report";


                    RunObject = Report "HR Employee Beneficiaries";
                    ToolTip = 'Executes the Employee Beneficiaries action.';
                }
                action(EmployeeCVSunmmary)
                {
                    ApplicationArea = all;
                    Caption = 'Employee CV Sunmmary';
                    Image = SuggestGrid;


                    RunObject = Report "Employee Details Summary";
                    ToolTip = 'Executes the Employee CV Sunmmary action.';
                }

                action(Employee_List)
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
                action(Employee_CVSunmmary)
                {
                    ApplicationArea = all;
                    Caption = 'Employee CV Sunmmary';
                    Image = SuggestGrid;


                    RunObject = Report "Employee Details Summary";
                    ToolTip = 'Executes the Employee CV Sunmmary action.';
                }//HR Leave Application
                action("HR Leave Application")
                {
                    ApplicationArea = all;
                    Caption = 'HR Leave Application';
                    Image = SuggestGrid;


                    // RunObject = Report "HR Leave Application";
                    ToolTip = 'Executes the HR Leave Application action.';
                }//HR Leave Application
                action(LeaveStatementnew)
                {
                    Caption = 'Final  Leave Statement';
                    ApplicationArea = all;
                    Image = LedgerEntries;
                    //RunObject = Report "leave statement";
                    ToolTip = 'Executes the Employee Leave Statement action.';
                }
            }
            group("UMMAGeneralReports")
            {
                Caption = 'UMMA HRM General Reports';
                ToolTip = 'Get Reports Related to Employee Manager';
                action(appSumm)
                {
                    ApplicationArea = All;
                    Caption = 'HRM Applicants Summary';
                    Image = Employee;


                    RunObject = Report "HRM Applicants Summary";
                }
                action(appSummMark)
                {
                    ApplicationArea = All;
                    Caption = 'HRM Interview Summary';
                    Image = BreakRulesOff;


                    RunObject = Report "HRM Interview Summary";
                }

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
                action(Kpi)
                {
                    ApplicationArea = All;
                    Caption = 'KPI Status Report';
                    Image = PersonInCharge;


                    RunObject = Report "KPI Status Report";

                }
                // action(report)
                // {
                //     ApplicationArea = All;

                //     Image = PersonInCharge;


                //     RunObject = page "Portal Pass";
                // }



            }
            group(LeavReports)
            {
                Caption = 'Employee Leave Report';
                action(LeaveBalances)
                {
                    Caption = 'Employee Leave Balances';
                    ApplicationArea = all;
                    Image = Balance;


                    RunObject = Report "Employee Leaves";
                    ToolTip = 'Executes the Employee Leave Balances action.';
                }
                action(LeaveTransactions)
                {
                    Caption = 'Employee Leave Tansaction';
                    ApplicationArea = all;
                    Image = Translation;


                    RunObject = Report "Standard Leave Balance Report";
                    ToolTip = 'Executes the Employee Leave Tansaction action.';
                }
                action(LeaveStatement)
                {
                    Caption = 'Employee Leave Statement';
                    ApplicationArea = all;
                    Image = LedgerEntries;


                    RunObject = Report "HR Leave Statement";
                    ToolTip = 'Executes the Employee Leave Statement action.';
                }
                // action(LeaveStatementnew)
                // {
                //     Caption = 'Final  Leave Statement';
                //     ApplicationArea = all;
                //     Image = LedgerEntries;
                //     RunObject = Report "leave statement";
                //     ToolTip = 'Executes the Employee Leave Statement action.';
                // }

            }


            action(CommissionReport)
            {
                ApplicationArea = all;
                Caption = 'Commission Report';
                Image = Report2;


                ToolTip = 'Executes the Commission Report action.';
                //todo  RunObject = Report "HRM-Commission For Univ. Rep.";
            }



            action(Commission_Report)
            {
                ApplicationArea = all;
                Caption = 'Commission Report';
                Image = Report2;


                ToolTip = 'Executes the Commission Report action.';
                ///RunObject = Report "HRM-Commission For Univ. Rep.";
            }



        }
        area(Embedding)
        {
            action(employeelsting)
            {
                ApplicationArea = all;
                Caption = 'Employee List';
                RunObject = Page "HRM-Employee List";
                ToolTip = 'Executes the Employee List action.';
            }
            action(leaveapplication)
            {
                ApplicationArea = all;
                Caption = 'Leave Applications';
                RunObject = Page "HRM-Leave Requisition List";
                ToolTip = 'Executes the Leave Applications action.';
            }
            action(leavePendingapprl)
            {
                ApplicationArea = all;
                Caption = 'Leaves Pending Approval';
                RunObject = Page "HRM-LeavePendingApproval";


            }
            action(leaveRejected)
            {
                ApplicationArea = all;
                Caption = 'Leaves Rejected';
                RunObject = page "HRM-LeavesRejected";


            }

            action(payrolldata)
            {
                ApplicationArea = all;
                Caption = 'Payroll data';
                RunObject = Page "PRL-Payroll Raw Data";
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
                action(Casuals)
                {
                    ApplicationArea = all;
                    Caption = 'Casuals';
                    RunObject = Page "HRM-Casuals Lists";
                    ToolTip = 'Executes the Casuals action.';
                }

                action(HRMEmployeesInactive)
                {
                    ApplicationArea = all;
                    Caption = 'Inactive Employee List';
                    Image = Job;

                    RunObject = Page "HRM-Employee-List (Inactive)";
                    ToolTip = 'Executes the Inactive Employee List action.';

                }
            }
            group(Appraisals)
            {
                Caption = 'Perfomance Appraisal';
                action("PC Setup")
                {
                    RunObject = page "Corparate Affairs Setup";
                    ApplicationArea = All;
                }
                action("PC Indicators")
                {
                    RunObject = page "PC Category list";
                    ApplicationArea = All;
                }
                action("PC Matrix")
                {
                    RunObject = page "PC Work Plan Setup";
                    ApplicationArea = All;
                    //caption='Annual Performance Contract';
                }
                action("PC Targets")
                {
                    RunObject = page "PC SubCategories List";
                    ApplicationArea = all;
                }

                action("Departmental PC")
                {
                    RunObject = page "Department WorkPlan  List";
                    ApplicationArea = All;
                    //Caption = 'Annual Departmental PC';
                }
                action("Vetting By PC Secretariat")
                {
                    ApplicationArea = All;
                    //Caption = 'PC Secretariat';
                    RunObject = Page "Vetting List ";
                }
                action("Departmental PC Approval")
                {
                    ApplicationArea = All;
                    //Caption = 'PC Secretariat';
                    RunObject = Page "Work Plan Executive Committee";
                }
                // action(" Director's Approval")
                // {
                //     ApplicationArea = all;
                //     RunObject = page "Work Plan Consult Comimttee";
                // }
                action("Approved Departmental PC")
                {
                    RunObject = page "Approved WorkPlan List";
                    ApplicationArea = All;
                }
                action("Employee Performance Target List")
                {
                    RunObject = page "Employee Perf Target List";
                    ApplicationArea = All;
                }
                action("Employee Performance Target Pending Approval")
                {
                    RunObject = page "Targets Pending Approvals";
                    ApplicationArea = All;
                }
                action("Approved Performance Target List")
                {
                    RunObject = page "Approved Employee Targets";
                    ApplicationArea = All;
                }
                action("Appraisal List")
                {
                    RunObject = page "Appraisal List1";
                    ApplicationArea = All;
                }//"PC Reports"
                action("PC Reports")
                {
                    RunObject = page "PC Reports";
                    ApplicationArea = All;
                }

            }
            group(Payroll)
            {
                Visible = false;
                Caption = 'Payroll';
                Image = SNInfo;
                action("Salary Card")
                {

                    Caption = 'Salary Card';
                    Image = Employee;

                    RunObject = Page "HRM-Employee-List";
                    ToolTip = 'Executes the Salary Card action.';
                    ApplicationArea = All;
                }
                action("Transcation Codes")
                {

                    Caption = 'Transcation Codes';
                    Image = Setup;

                    RunObject = Page "PRL-Transaction Codes List";
                    ToolTip = 'Executes the Transcation Codes action.';
                    ApplicationArea = All;
                }
                action("NHIF Setup")
                {

                    Caption = 'NHIF Setup';
                    Image = SetupLines;

                    RunObject = Page "PRL-NHIF SetUp";
                    ToolTip = 'Executes the NHIF Setup action.';
                    ApplicationArea = All;
                }
                action("Payroll Mass Changes")
                {

                    Caption = 'Payroll Mass Changes';
                    Image = AddAction;

                    RunObject = Page "HRM-Import Emp. Trans Buff";
                    ToolTip = 'Executes the Payroll Mass Changes action.';
                    ApplicationArea = All;
                }
                action(" payment Vouchers")
                {

                    Caption = ' payment Vouchers';
                    //  RunObject = Page "FIN-Payment Vouchers";
                    ToolTip = 'Executes the  payment Vouchers action.';
                    ApplicationArea = All;
                }
            }
            group("Salary Increments")
            {
                Caption = 'Salary Increments';
                Image = Intrastat;
                Visible = false;
                action("Salary Increament Process")
                {

                    Caption = 'Salary Increment Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                    ToolTip = 'Executes the Salary Increment Process action.';
                    ApplicationArea = All;
                }
                action("Salary Increment Register")
                {

                    Caption = 'Salary Increment Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                    ToolTip = 'Executes the Salary Increment Register action.';
                    ApplicationArea = All;
                }
                action("Un-Afected Salary Increments")
                {

                    Caption = 'Un-Afected Salary Increments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                    ToolTip = 'Executes the Un-Afected Salary Increments action.';
                    ApplicationArea = All;
                }
                action("Leave Allowance Buffer")
                {

                    Caption = 'Leave Allowance Buffer';
                    Image = Bins;

                    RunObject = Page "HRM-Leave Allowance Buffer";
                    ToolTip = 'Executes the Leave Allowance Buffer action.';
                    ApplicationArea = All;
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
            group(Attnd)
            {
                Visible = false;
                Caption = 'Staff Attendance';
                Image = Statistics;
                action(ParmStaffCurr)
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff (Present)';
                    Image = AddContacts;


                    RunObject = Page "Staff Attendance (Current)";
                    ToolTip = 'Open List of Staff register (Daily Attendance)';
                }
                action(CasualStaffCurr)
                {
                    ApplicationArea = all;
                    Caption = 'Casual Staff (Present)';
                    Image = Purchasing;


                    RunObject = Page "Casual Attendance (Current)";
                    ToolTip = 'Open Attendance List for Casual Employees';
                }
                action(ParmStaff)
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff (History)';
                    Image = AddContacts;


                    RunObject = Page "Staff Attendance View";
                    ToolTip = 'Open List of Staff register (Daily Attendance)';
                }
                action(CasualStaff)
                {
                    ApplicationArea = all;
                    Caption = 'Casual Staff (History)';
                    Image = Purchasing;


                    RunObject = Page "Casual Staff Attendance View";
                    ToolTip = 'Open Attendance List for Casual Employees';
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
                action(leavePendingapprl2)
                {
                    ApplicationArea = all;
                    Caption = 'Leaves Pending Approval';
                    RunObject = Page "HRM-LeavePendingApproval";


                }
                action(leaveRejected2)
                {
                    ApplicationArea = all;
                    Caption = 'Leaves Rejected';
                    RunObject = page "HRM-LeavesRejected";


                }
                action("Approved Leaves")
                {
                    ApplicationArea = all;
                    RunObject = Page "HRM-LeaveList(Approved)";
                    ToolTip = 'Executes the Posted Leaves action.';
                }
                action("Posted Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Leaves';
                    RunObject = Page "HRM-Leave Requisition Posted";
                    ToolTip = 'Executes the Posted Leaves action.';
                }
                action("Staff Back To Office")
                {
                    ApplicationArea = all;
                    RunObject = Page "HRM-Return to Office";
                    ToolTip = 'Is filled by staff when they return from leave';
                }
                action("Leave Journals")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Journals';
                    Image = Journals;

                    RunObject = Page "HRM-Emp. Leave Journal Lines";
                    ToolTip = 'Executes the Leave Journals action.';
                }

                action("Leave Types")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';
                    RunObject = Page "HRM-Leave Types";
                    ToolTip = 'Set Up Leaves';
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
                action("Approved Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Approved Employee Requisitions';
                    Image = ApplicationWorksheet;


                    RunObject = Page "HRM Approved Requisition List";
                    ToolTip = 'Executes the Employee Requisitions action.';
                }
                action("CIR")
                {
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;


                    RunObject = Page "HRM List Submitted to CIRO";
                    ToolTip = 'Shows List Submitted for advertising.';
                }
                action("Advertised Jobs")
                {
                    ApplicationArea = all;
                    Caption = 'Advertised Jobs';
                    RunObject = Page "HRM-Advertised Job List";
                    ToolTip = 'Executes the Advertised Jobs action.';
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
                action("Shortlisted Applications")
                {
                    ApplicationArea = All;
                    Caption = 'Shortlisted Applications';
                    RunObject = page "HRM-Applications ShortList";
                    ToolTip = 'Shows List of all Shortlisted Applications';
                }
                action(sifted)
                {
                    ApplicationArea = All;
                    Caption = 'Sifted Applications';
                    RunObject = page "HRM-Sifted Applications";
                    ToolTip = 'Shows a list of all the sifted applications';
                }
                action("Interview Candidates")
                {
                    ApplicationArea = All;
                    Caption = 'Interview Candidates';
                    RunObject = page "HRM-Interview Invite";
                    ToolTip = 'Shows List of all Candidates awaiting interview';
                }
                action(coverLet)
                {
                    ApplicationArea = All;
                    Caption = 'Awaiting Offer Letter';
                    RunObject = page "HRM-Interview Passed";
                    Tooltip = 'Shows Candidates Awaiting cover letter';
                }

                action("Failed Interview")
                {
                    ApplicationArea = All;
                    Caption = 'Failed Interview';
                    RunObject = page "HRM-Interview Failed";
                    ToolTip = 'Shows Applicants Who Failed The Interview';
                }
                action("Rejected Applications")
                {
                    ApplicationArea = All;
                    Caption = 'Rejected Applications';
                    RunObject = page "HRM-Rejected App";
                    ToolTip = 'Shows List of all Rejected Applications';
                }

                action("Qualified Job Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Qualified Job Applicants';
                    RunObject = Page "HRM-Job Applicants Qualified";
                    ToolTip = 'Executes the Qualified Job Applicants action.';
                    Visible = false;




                }
                action("Unqualified Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Unqualified Applicants';
                    RunObject = Page "HRM-Job Applicants Unqualified";
                    ToolTip = 'Executes the Unqualified Applicants action.';
                    Visible = false;


                }

            }
            group(CRM)
            {
                Caption = 'Send Interview Invite';
                action(candidates)
                {
                    ApplicationArea = All;
                    Caption = 'Interview Candidates List';
                    RunObject = Page "Interview Cand Mailing List";

                }
                action(invite)
                {
                    ApplicationArea = All;
                    Caption = 'Send Invites';
                    RunObject = page "HRM-Invite Interview Params";
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
                }
                action("Supervisor Appraisal List")
                {
                    ApplicationArea = all;
                    Caption = 'Supervisor Appraisal List';
                    RunObject = Page "HRM-Appraisal Sup. Emp. List";

                }
                action("Appraisee Self Targets")
                {
                    ApplicationArea = all;
                    Caption = 'Appraisee Self Targets';
                    RunObject = Page "HRM-Appraisee Self Targets";
                }

                action("Appraisal HR List")
                {
                    ApplicationArea = all;
                    Caption = 'Appraisal HR List';
                    RunObject = Page "HRM-Appraisal HR Emp. List";

                }

            }
            group(statutory)
            {
                Caption = 'Statutory Tracker';
                action(Licences)
                {
                    ApplicationArea = All;
                    Caption = 'Licenses/Certificates';
                    RunObject = Page "HRM-Licensing List";
                }
            }
            group(Internships)
            {
                Caption = 'Internships';

                // action("InternshipLst")
                // {
                //     Caption = 'Internship List';
                //     ApplicationArea = All;
                //     //RunObject = Page "HRM-Intern&Attach List";
                //     RunObject = Page "Attachment Applic List";
                // }
                action("InternshipLst2")
                {
                    Caption = 'Internship List';
                    ApplicationArea = All;
                    RunObject = Page "HRM-Intern&Attach List";
                }
            }
            group(Welfare)
            {
                Caption = 'Welfare Management';
                Image = Capacities;
                Visible = false;
                action("Company Activity")
                {
                    ApplicationArea = all;
                    Caption = 'Company Activity';
                    RunObject = Page "HRM-Company Activities List";
                    ToolTip = 'Executes the Company Activity action.';
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
                action(Religions)
                {
                    ApplicationArea = All;
                    Image = SendConfirmation;
                    RunObject = page "HRM-Religions";
                }
                action(Denominations)
                {
                    ApplicationArea = all;
                    Caption = 'Denominations';
                    Image = Line;

                    RunObject = Page "HRM-Denominations";
                    ToolTip = 'Executes the Denomination action.';
                }
                action(Respons)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Responsibility';
                    Image = Line;

                    RunObject = Page "HRM-Responsibility";
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
                action(Statuory)
                {
                    ApplicationArea = all;
                    Caption = 'Statutory and Licensing';
                    RunObject = Page "Portal Pass";
                    //Visible = False;
                    ToolTip = 'View institution and Licensing Details';
                }
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
                Visible = false;
                action(Action40)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    RunObject = Page "HRM-Emp. Beneficiaries List";
                    ToolTip = 'Executes the Employee Beneficiaries action.';
                }
                action("Pension Payments List")
                {
                    ApplicationArea = all;
                    Caption = 'Provident Payments List';
                    RunObject = Page "HRM-Pension Payments List";
                    ToolTip = 'Executes the Pension Payments List action.';
                }
            }
            group(train)
            {
                Caption = 'Training Management';
                action("Training Applications")
                {
                    ApplicationArea = all;
                    Caption = 'Training Applications';
                    RunObject = Page "HRM-Training Application List";
                    ToolTip = 'Executes the Training Applications action.';
                }
                action("Training Courses")
                {
                    ApplicationArea = all;
                    Caption = 'Training Courses';
                    RunObject = Page "HRM-Course List";
                    ToolTip = 'Executes the Training Courses action.';
                }
                action("Training Providers")
                {
                    ApplicationArea = all;
                    Caption = 'Training Providers';
                    RunObject = Page "HRM-Training Providers List";
                    ToolTip = 'Executes the Training Providers action.';
                }
                action("Training Needs")
                {
                    ApplicationArea = all;
                    Caption = 'Training Needs';
                    RunObject = Page "HRM-Train Need Analysis List";
                    ToolTip = 'Executes the Training Needs action.';
                }
                action("Back To Office")
                {
                    ApplicationArea = all;
                    Caption = 'Back To Office';
                    RunObject = Page "HRM-Back To Office List";
                    ToolTip = 'Executes the Back To Office action.';
                }
            }
            group(exitInterview)
            {
                Caption = 'Off Boarding';
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
                    Caption = 'Staff Clearance Forms';
                    RunObject = Page "HRM Clearance Form";
                    ToolTip = 'Executes the  Clearance action.';
                }
                action(" Exit Interview")
                {
                    ApplicationArea = all;
                    Caption = 'Leavers List';
                    RunObject = Page "HRM-Exit Interview List";
                    ToolTip = 'Executes the  Exit Interview action.';
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
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Executes the My Approval requests action.';
                }

            }

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Stores Requisitions")
                {
                    ApplicationArea = all;

                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition";
                    ToolTip = 'Executes the Stores Requisitions action.';
                }
                action("Imprest Requisitions")
                {
                    ApplicationArea = all;

                    Caption = 'Imprest Requisitions';
                    RunObject = Page "FIN-Imprests List";
                    ToolTip = 'Executes the Imprest Requisitions action.';
                }
                action("Leave Applications")
                {
                    ApplicationArea = all;

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ToolTip = 'Executes the Leave Applications action.';
                }
                action("My Approved Leaves1")
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


        /*        area(creation)
                {
                    group(Payroll_Setups)
                    {Visible = false;
                        Caption = 'Payroll Setups';
                        Image = HRSetup;
                        action("Payroll Period")
                        {
                            Caption = 'Payroll Period';
                            Image = Period;
                            RunObject = Page "PRL-Payroll Periods";
                        }
                        action("Pr Rates")
                        {
                            Caption = 'Pr Rates';
                            Image = SetupColumns;
                            
                            RunObject = Page "PRL-Rates & Ceilings";
                        }
                        action("NSSF Tiers")
                        {
                            Caption = 'NSSF Tiers';
                            Image = Agreement;
                            
                            RunObject = Page "prNSSF List";
                        }
                        action("paye Setup")
                        {
                            Caption = 'paye Setup';
                            Image = SetupPayment;
                            
                            RunObject = Page "PRL-P.A.Y.E Setup";
                        }
                        action(Action1000000070)
                        {
                            Caption = 'Transcation Codes';
                            Image = Setup;
                            
                            RunObject = Page "PRL-Transaction Codes List";
                        }
                        action(Action1000000069)
                        {
                            Caption = 'NHIF Setup';
                            Image = SetupLines;
                            
                            RunObject = Page "PRL-NHIF SetUp";
                        }
                        action("Hr Employee Card")
                        {
                        Image = Employee;
                            //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                            //
                            RunObject = Page "HRM-Employee (C)";
                        }
                        action("Bank Structure")
                        {
                            Caption = 'Bank Structure';
                            Image = Bank;
                            
                            RunObject = Page "PRL-Bank Structure (B)";
                        }
                        action("control information")
                        {
                            Caption = 'control information';
                            Image = CompanyInformation;
                            
                            RunObject = Page "GEN-Control-Information";
                        }
                        action("Salary Grades")
                        {
                            Caption = 'Salary Grades';
                            Image = EmployeeAgreement;
                            
                            RunObject = Page "PRL-Salary Grades";
                        }
                        action("posting group")
                        {
                            Caption = 'posting group';
                            Image = PostingEntries;
                            
                            RunObject = Page "PRL-Employee Posting Group";
                        }
                        action(Action1000000063)
                        {
                            Caption = 'Salary Increament Process';
                            Image = AddAction;
                            
                            RunObject = Page "HRM-Emp. Categories";
                        }
                        action(Action1000000062)
                        {
                            Caption = 'Salary Increament Register';
                            Image = Register;
                            
                            RunObject = Page "HRM-Salary Increament Register";
                        }
                        action(Action1000000061)
                        {
                            Caption = 'Un-Afected Salary Increaments';
                            Image = UndoCategory;
                            
                            RunObject = Page "HRM-Unaffected Sal. Increament";
                        }
                        action(Action1000000060)
                        {
                            Caption = ' payment Vouchers';
                            RunObject = Page "FIN-Payment Vouchers";
                        }
                    }
                    group(PayRepts2)
                    {Visible = false;
                        Caption = 'Payroll Reports';
                        Image = ResourcePlanning;
                        action("Detailed Payroll Summary")
                        {
                            Caption = 'Detailed Payroll Summary';
                            Image = Report2;
                            
                            
                            //todo RunObject = Report "Payroll Summary 3";
                        }
                        action("Departmental Summary")
                        {
                            Caption = 'Departmental Summary';
                            Image = "Report";
                            
                            
                            //todo RunObject = Report "Payroll Summary (Depts)";
                        }
                        action("vew payslip")
                        {                    Caption = 'vew payslip';
                            Image = "Report";
                            
                            RunObject = Report "Individual Payslips V.1.1.3";
                        }
                        action("Master Payroll Summary")
                        {
                            Caption = 'Master Payroll Summary';
                            Image = "Report";
                            
                            RunObject = Report "PRL-Company Payroll Summary 3";
                        }
                        action("Payroll summary")
                        {
                            Caption = 'Payroll summary';
                            Image = Report;
                            RunObject = Report "PRL-Company Payroll Summary 3";
                        }
                        action("Deductions Summary")
                        {
                            Caption = 'Deductions Summary';
                            Image = Report;
                            //todo  RunObject = Report "PRL-Deductions Summary";
                        }
                        action("Earnings Summary")
                        {
                            Caption = 'Earnings Summary';
                            Image = DepositSlip;
                            //todo RunObject = Report "PRL-Earnings Summary";
                        }
                        action("Deductions Summary 2")
                        {
                            Caption = 'Deductions Summary 2';
                            Image = "Report";
                            
                            //todo RunObject = Report "PRL-Deductions Summary 2";
                        }
                        action("Earnings Summary 2")
                        {
                            Caption = 'Earnings Summary 2';
                            Image = "Report";
                            
                            //todo RunObject = Report "PRL-Payments Summary 2";
                        }
                        action("Staff pension")
                        {
                            Caption = 'Staff pension';
                            Image = Aging;
                            //todo  RunObject = Report "prStaff Pension Contrib";
                        }
                        action("Gross Netpay")
                        {
                            Caption = 'Gross Netpay';
                            Image = Giro;
                            RunObject = Report prGrossNetPay;
                        }
                        action("Hrm credit Sales")
                        {
                            Caption = 'Hrm credit Sales';
                            Image = AddContacts;
                            //RunObject = Report "HRM- Credit Sales";
                        }
                    }
                    group(PayrollPeoro)
                    {Visible = false;
                        Caption = 'Periodic Reports';
                        Image = RegisteredDocs;
                        action("P9 Report")
                        {
                            Caption = 'P9 Report';
                            Image = PrintForm;
                            
                            
                            RunObject = Report "P9 Report (Final)";
                        }
                        action(Transactions)
                        {
                            Caption = 'Transactions';
                            Image = "Report";
                            
                             RunObject = Report "pr Transactions";

                        }
                        action("Company Payslip")
                        {
                            Caption = 'Company Payslip';
                            Image = "Report";
                            
                            RunObject = Report "PRL-Company Payslip";
                        }
                        action("bank Schedule2")
                        {
                            Caption = 'bank Schedule';
                            Image = "Report";
                            

                             RunObject = Report "pr Bank Schedule";
                        }
                        action("Employer Certificate")
                        {
                            Caption = 'Employer Certificate';
                            Image = "Report";
                            
                            
                        //  RunObject = Report "Employer Certificate P.10 mst";
                        }
                        action("P.10")
                        {
                            Caption = 'P.10';
                            Image = "Report";
                            
                           //  RunObject = Report "P.10 A mst";
                        }
                        action("Paye Scheule")
                        {
                            Caption = 'Paye Scheule';
                            Image = "Report";
                            
                            RunObject = Report "prPaye Schedule mst";
                        }
                        action("NHIF Schedult")
                        {
                            Caption = 'NHIF Schedule';
                            Image = "Report";
                            
                          //  RunObject = Report "prNHIF mst";
                        }
                        action("NSSF Schedule")
                        {
                            Caption = 'NSSF Schedule';
                            Image = "Report";
                            
                              RunObject = Report "prNSSF mst";
                        }
                        action("Third Rule")
                        {
                            Caption = 'Third Rule';
                            Image = AddWatch;
                            RunObject = Report "A third Rule Report";
                        }
                        action("Co_op Remittance")
                        {
                            Caption = 'Co_op Remittance';
                            Image = CreateForm;
                             RunObject = Report "prCoop remmitance";
                        }
                        action("payroll Journal Transfer")
                        {
                            Caption = 'payroll Journal Transfer';
                            Image = Journals;
                            
                            // RunObject = Report prPayrollJournalTransfer;
                        }
                        action("mass update Transactions")
                        {
                            Caption = 'mass update Transactions';
                            Image = PostBatch;
                            
                            //todo  RunObject = Report "Mass Update Transactions";
                        }
                        action("Pension Report")
                        {
                            Caption = 'Pension Report';
                            Image = PrintForm;
                            
                            
                            RunObject = Report "PRL-Pension Report";
                        }
                        action("Bank Schedule")
                        {
                            Caption = 'Bank Schedule';
                            Image = "Report";
                            
                            RunObject = Report "PRL-Bank Schedule";
                        }
                        action("NHIF Report")
                        {
                            Caption = 'NHIF Report';
                            Image = "Report";
                            
                            //todo RunObject = Report "PRL-NHIF Report";
                        }
                        action("SACCO Report")
                        {
                            Caption = 'SACCO Report';
                            Image = "Report";
                            
                            RunObject = Report "PRL-Welfare Report";
                        }
                        action("HELB Report")
                        {
                            Caption = 'HELB Report';
                            Image = "Report";
                            
                            
                            RunObject = Report "PRL-HELB Report";
                        }
                        action("NSSF Report (A)")
                        {
                            Caption = 'NSSF Report (A)';
                            Image = "Report";
                            
                            RunObject = Report "PRL-NSSF Report (A)";
                        }
                        action("NSSF Report (B)")
                        {
                            Caption = 'NSSF Report (B)';
                            Image = "Report";
                            
                            RunObject = Report "PRL-NSSF Report (B)";
                        }
                        action("NSSF Report (Combined)")
                        {
                            Caption = 'NSSF Report (Combined)';
                            Image = "Report";
                            
                            RunObject = Report "PRL-NSSF Report Combined";
                        }
                    }
                }
                */
    }
}

