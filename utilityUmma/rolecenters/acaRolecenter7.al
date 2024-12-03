/// <summary>
/// Page ACA-Academics Role Center (ID 68861).
/// </summary>
page 86056 "ACA-Academics Role Center7"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("Dashboard Greetings"; "Dashboard Greetings")

            {
                ApplicationArea = all;
            }
            group(contrl)
            {
#pragma warning disable AL0269
                part("Students List"; "ACA-Std Card List")
#pragma warning restore AL0269
                {
                    ApplicationArea = All;
                    Caption = 'Students List';
                }
            }




        }
    }

    actions
    {
        area(processing)
        {
            group("General Setups")
            {
                Caption = 'Setups';
                Visible = false;
                group(SetupsG)
                {

                    Caption = 'General Setups';
                    Image = Administration;
                    action(Programs)
                    {
                        Caption = 'Programs';
                        Image = FixedAssets;

                        RunObject = Page 68757;
                        ApplicationArea = All;
                    }//"ACA-Academics departments"
                    action("Academic Departments")
                    {
                        Caption = 'Academic Departments';
                        Image = FixedAssets;

                        RunObject = Page "ACA-Academics departments";
                        ApplicationArea = All;
                    }//"ACA-Academics departments"
                    action(Semesters)
                    {
                        Image = FixedAssetLedger;


                        RunObject = Page 68744;
                        ApplicationArea = All;
                    }
                    action(portalSetups)
                    {
                        Image = Web;
                        RunObject = page "Portal Setups";
                        ApplicationArea = All;
                    }
                    action(Buildings)
                    {
                        Image = Insurance;


                        RunObject = Page "ACA-Buildings Setup";
                        ApplicationArea = All;
                    }
                    action(lecHalls)
                    {
                        Image = RefreshDiscount;


                        RunObject = Page "ACA-LectureHalls Setup";
                        ApplicationArea = All;
                    }
                    action("Academic Year")
                    {
                        Image = Calendar;


                        RunObject = Page 68510;
                        ApplicationArea = All;
                    }
                    action("General Setup")
                    {
                        Image = SetupLines;


                        RunObject = Page 68760;
                        ApplicationArea = All;
                    }
                    action("Modes of Study")
                    {
                        Image = Category;

                        RunObject = Page 68739;
                        ApplicationArea = All;
                    }
                    action("Program Duration")
                    {
                        Image = Timeline;

                        RunObject = Page 86523;
                        ApplicationArea = All;
                    }
                    action("InsuranceCompanies")
                    {
                        Image = Insurance;

                        ApplicationArea = All;
                        //RunObject = Page 50051;
                    }
                    action("Application Setups")
                    {
                        Image = SetupList;

                        RunObject = Page 68480;
                        ApplicationArea = All;
                    }
                    action("Admission Number Setup")
                    {
                        Image = SetupColumns;


                        RunObject = Page 68495;
                        ApplicationArea = All;
                    }
                    action("Admission Subjects")
                    {
                        Image = GeneralPostingSetup;

                        RunObject = Page 68472;
                        ApplicationArea = All;
                    }
                    action("Academic Department")
                    {
                        Caption = 'Academic Departments';
                        Image = FixedAssets;

                        RunObject = Page "ACA-Academics departments";
                        ApplicationArea = All;
                    }//"ACA-Academics departments"
                    action("MarketingStrategies")
                    {
                        Image = MarketingSetup;

                        // RunObject = Page 50022;
                        ApplicationArea = All;
                    }
                    action("Import Data for Update")
                    {
                        Caption = 'Import Data for Update';
                        Image = ImportDatabase;


                        RunObject = Page 68929;
                        ApplicationArea = All;
                    }
                    action("Import Course Reg. Buffer")
                    {
                        Caption = 'Import Course Reg. Buffer';
                        Image = RegisterPutAway;


                        RunObject = Page 68900;
                        ApplicationArea = All;
                    }
                    action("Exam Setup")
                    {
                        Caption = '<Exam Setup>';
                        Image = SetupColumns;


                        RunObject = Page 68800;
                        ApplicationArea = All;
                    }
                    action("Grading System")
                    {
                        Image = Setup;

                        RunObject = Page 68830;
                        ApplicationArea = All;
                    }
                    action("Lecturer List")
                    {
                        Image = Employee;

                        RunObject = Page 68766;
                        ApplicationArea = All;
                    }
                    action("ImportUnits")
                    {
                        Caption = 'Import Units';
                        Image = ImportCodes;


                        ApplicationArea = All;
                        //  RunObject = XMLport 50155;
                    }
                    action("Import Units (Buffered)")
                    {
                        Caption = 'Import Units (Buffered)';
                        Image = ImportLog;


                        RunObject = Page "ACA-Prog. Units Buffer";
                        ApplicationArea = All;
                    }
                }
            }
            group("Application and Admission")
            {
                group(AppliAdmin)
                {
                    Caption = 'Applications & General setup';
                    Image = Job;
                    //Visible = false;
                    action("Online Enquiries")
                    {
                        Image = NewOrder;


                        RunObject = Page 68292;
                        ApplicationArea = All;
                    }
                    action("Online Applications")
                    {
                        Image = NewCustomer;


                        //RunObject = Page 50021;
                        ApplicationArea = All;
                    }
                    action("Admission Applications")
                    {
                        Image = NewCustomer;


                        RunObject = Page 50059;
                        ApplicationArea = All;
                    }
                    action("Approved Applications")
                    {
                        Image = Archive;

                        RunObject = Page 68011;
                        ApplicationArea = All;
                    }
                    action("Admission Letters")
                    {
                        Image = CustomerList;


                        RunObject = Page 68515;
                        ApplicationArea = All;
                    }
                    action("Admitted Applicants")
                    {
                        Image = Archive;


                        RunObject = Page 68010;
                        ApplicationArea = All;
                    }
                }
            }
            group("Admission History")
            {
                //Visible = False;
                group(AdminHist)
                {
                    Caption = 'Admissions History';
                    Image = History;
                    action("Pending Admissions")
                    {
                        Image = History;

                        RunObject = Page 68483;
                        ApplicationArea = All;
                    }
                    action("Rejected Applications")
                    {
                        Image = Reject;

                        RunObject = Page 68012;
                        ApplicationArea = All;
                    }
                    action("Cancelled Applications")
                    {
                        Image = Cancel;

                        RunObject = Page 68009;
                        ApplicationArea = All;
                    }
                }
            }
            group("Admission Reports")
            {
                //Visible = False;
                group(AdminReports)
                {
                    Caption = 'Admission Reports';
                    Image = ResourcePlanning;
                    action("Admissions Summary")
                    {
                        Caption = 'Admissions Summary';
                        Image = Report;


                        RunObject = Report 69285;
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Admission By Program")
                    {
                        Caption = 'Admission By Program';
                        Image = Report;


                        RunObject = Report 69286;
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Admission Summary 2")
                    {
                        Caption = 'Admission Summary 2';
                        Image = Report;


                        ApplicationArea = All;
                        //  RunObject = Report 69287;
                        Visible = false;
                    }
                    action("New Applications")
                    {
                        Image = Report;
                        Caption = 'Applicants Summary Report';


                        RunObject = Report 86521;
                        ApplicationArea = All;
                    }
                    action("Student Programme Data")
                    {
                        Image = Report;
                        Caption = 'Students Programme Data';


                        RunObject = Report 86520;
                        ApplicationArea = All;
                    }
                    action("Online Applications Report")
                    {
                        Image = Report;


                        RunObject = Report 51351;
                        ApplicationArea = All;
                    }
                    action(Enquiries)
                    {
                        Image = Report;


                        ApplicationArea = All;
                        //RunObject = Report 50052;
                    }
                    action("Marketing Strategies Report")
                    {
                        Image = Report;


                        RunObject = Report 50049;
                        ApplicationArea = All;
                    }
                    action("Direct Applications")
                    {
                        Image = Report;


                        RunObject = Report 51379;
                        ApplicationArea = All;
                    }
                    action("Application List")
                    {
                        Image = Report;


                        RunObject = Report 51352;
                        ApplicationArea = All;
                    }
                    action("Application Summary")
                    {
                        Image = Report;


                        RunObject = Report 51350;
                        ApplicationArea = All;
                    }
                    action("Applicant Shortlisting (Summary)")
                    {
                        Image = Report;


                        RunObject = Report 51365;
                        ApplicationArea = All;
                    }
                    action("Applicant Shortlisting (Detailed)")
                    {
                        Image = Report;


                        RunObject = Report 51364;
                        ApplicationArea = All;
                    }
                    action(ClassSplits)
                    {
                        Image = Report;


                        RunObject = Report "Class Splits Reports";
                        ApplicationArea = All;
                    }

                }
            }
            group(Academics)
            {
                Visible = False;
                group(Academics2)
                {
                    Caption = 'Academic';
                    Image = Departments;
                    action("Student Registration")
                    {
                        Image = Register;

                        RunObject = Page 68836;
                        ApplicationArea = All;
                    }
                    action("Student Card")
                    {
                        Image = Registered;

                        RunObject = Page 68837;
                        ApplicationArea = All;
                    }
                    action(Alumni)
                    {
                        Image = History;


                        RunObject = Page 68974;
                        ApplicationArea = All;
                    }
                    action("Lecturers List")
                    {
                        Image = Resource;

                        RunObject = Page 68853;
                        ApplicationArea = All;
                    }
                }
            }
            group("Periodic Activities")
            {
                Visible = false;
                group(PerAc)
                {
                    Caption = 'Periodic Activities';
                    Image = Transactions;
                    action("Graduation Charges (Unposted)")
                    {
                        Caption = 'Graduation Charges (Unposted)';
                        Image = UnApply;


                        RunObject = Page 68420;
                        ApplicationArea = All;
                    }
                    action(GenGraduInd)
                    {
                        Caption = 'Generate Graduation Charges (Individual Students)';
                        Image = GetEntries;


                        RunObject = Report 51792;
                        ApplicationArea = All;
                    }
                }
            }
            group("Academic reports")
            {
                //Visible = false;
                group(AcadReports)
                {
                    Caption = 'Academic reports';
                    Image = RegisteredDocs;
                    action("Registered Students")
                    {
                        Image = Report;

                        RunObject = Report 51765;
                        ApplicationArea = All;
                    }
                    action("Transcript Report")
                    {
                        Image = Transactions;


                        RunObject = Report "Final Graduation Transcript";
                        ApplicationArea = All;
                    }
                    action(examattendanceVC)
                    {
                        Caption = 'Exam Attendance';
                        Image = Report;
                        RunObject = Report 84509;
                        ApplicationArea = All;

                    }
                    action("Enrollment Statistics")
                    {
                        Image = Report;


                        RunObject = Report 51669;
                        ApplicationArea = All;
                    }
                    action("Student Balances")
                    {
                        Image = Report;


                        RunObject = Report 51393;
                        ApplicationArea = All;
                    }
                    action("Fee Statements")
                    {
                        Image = Report;


                        RunObject = Report 51072;
                        ApplicationArea = All;
                    }
                    action("Statistics By Programme Category")
                    {
                        Image = Statistics;


                        RunObject = Report 51779;
                        ApplicationArea = All;
                    }
                }
            }
        }
        area(embedding)
        {


            action("program List")
            {
                Caption = 'Program List';
                Image = FixedAssets;



                RunObject = Page 68757;
                ApplicationArea = All;
            }
            action(loadStages)
            {
                Caption = 'Find Stages';
                Image = FixedAssets;



                RunObject = Page progStagesTest;
                ApplicationArea = All;
                Visible = false;
            }
            action("Units on Offer")
            {
                //Caption = 'Load Stages';
                Image = FixedAssets;



                RunObject = Page "Units on Offer";
                ApplicationArea = All;
                //Visible = false;

            }
            action("Decomissioned Programs")
            {
                Image = FixedAssets;



                RunObject = page "ACA-Programmes Decomissioned";
                ApplicationArea = All;
            }
            action("Historical Transcript")
            {



                RunObject = Page "Historical Transcript Data";
                ApplicationArea = All;
            }
            action("Find Misiing std")
            {



                RunObject = Page progStagesTest;
                ApplicationArea = All;
                Visible = false;
            }
            action("Fin Test")
            {



                RunObject = Page "Fin Test";
                ApplicationArea = All;
                Visible = false;
            }
            action(programIteration)
            {
                Caption = 'Program Iterations';
                Image = FixedAssets;



                RunObject = Page "ACA-Programmes Iteration";
                ApplicationArea = All;
            }
            action(unitsMater)
            {
                Caption = 'Units Master Table';
                Image = UserInterface;



                RunObject = Page "ACA-Units Master table";
                ApplicationArea = All;
            }
            action("Programme Leaders")
            {
                Image = FixedAssets;


                RunObject = page 79021;
                ApplicationArea = All;
            }
            action("Semester Setup")
            {
                Caption = 'Semester Setup';
                Image = FixedAssetLedger;



                RunObject = Page 68744;
                ApplicationArea = All;
                Visible = false;
            }
            action("Academic Year Manager")
            {
                Caption = 'Academic Year Manager';
                Image = Calendar;


                RunObject = Page 68510;
                ApplicationArea = All;
                Visible = false;
            }


            // action("Applications (Online)")
            // {
            //     Image = NewCustomer;
            //    
            //     
            //     RunObject = Page 68864;
            //     ApplicationArea = All;
            // }
            // action("Applications - Direct ")
            // {
            //     Image = NewCustomer;
            //    
            //     
            //     RunObject = Page 68848;
            //     ApplicationArea = All;
            // }
            action("Applicant Admission Letters")
            {
                Image = CustomerList;


                RunObject = Page 68515;
                ApplicationArea = All;
                Visible = false;
            }
            // action("Admissions (New)")
            // {
            //     Image = NewItem;
            //    
            //     
            //     RunObject = Page 68850;
            //     ApplicationArea = All;
            // }


            // action(Registration2)
            // {
            //     Image = Register;
            //    
            //    
            //     
            //     RunObject = Page 68836;
            //     ApplicationArea = All;
            // }
            // action("Students Card2")
            // {
            //     Image = Registered;
            //    
            //    
            //     
            //     RunObject = Page 68837;
            //     ApplicationArea = All;
            // }


        }
        area(sections)
        {
            group("Admissions")
            {
                Caption = 'Admissions';
                Image = RegisteredDocs;
                //Visible = false;
                action(allApps)
                {
                    Caption = 'SRO';
                    RunObject = Page "ACA-Application Form H. list";
                    ApplicationArea = All;
                }
                action(process)
                {
                    Caption = 'My List';
                    RunObject = Page "SRO Processing";
                    ApplicationArea = All;

                }

                action(Applications)
                {
                    Caption = 'Departmental Admission Board';
                    RunObject = Page "ACA-Application Form H. list";
                    ApplicationArea = All;
                }
                action(dabReject)
                {
                    Caption = 'DAB Rejected';
                    RunObject = Page "DAB Rejection List";
                    ApplicationArea = All;
                }

                action("Faculty Admission Board")
                {
                    ApplicationArea = All;
                    RunObject = Page "Applications FAB List";
                }
                action("Faculty Applications")
                {
                    ApplicationArea = All;
                    RunObject = Page "ACA-FAB Applications";
                    Visible = false;
                }
                action("Faculty Rejections")
                {
                    ApplicationArea = All;
                    RunObject = Page "FAB Rejection List";
                }
                action("UABC Admission Board")
                {
                    Caption = 'UAB Admission Board';
                    ApplicationArea = All;
                    RunObject = Page "Applications UABC List";
                }
                action("UAB Reject")
                {
                    Caption = 'UAB Reject';
                    ApplicationArea = All;
                    RunObject = Page "ACA-Rejected Applications List";
                }

                action("Issuance of Letter")
                {
                    ApplicationArea = All;
                    RunObject = Page "ACA- Admission Letters";
                }
                action(Registrations)
                {
                    Caption = 'Registration';
                    RunObject = Page 70083;
                    Visible = true;
                    ApplicationArea = All;
                }
                action("Admitted Students")
                {
                    Caption = 'Admitted Students';
                    RunObject = Page 70085;
                    ApplicationArea = All;
                }
                action("GSS Imports")
                {
                    Caption = 'Import GSS Admissions';
                    RunObject = Page 68491;
                    ApplicationArea = All;
                }
            }
            // group("GSS Imports")
            // {

            // }
            // group("GSS Admission")
            // {
            //     //Caption = 'GSS Admission';
            //     // Image = Transactions;
            //     action("Import GSS Admissions")
            //     {
            //         Caption = 'Import GSS Admissions';
            //         RunObject = Page 68491;
            //         ApplicationArea = All;
            //     }

            //     /* action("Processed GSS Admissions")
            //     {
            //         Caption = 'Processed GSS Admissions';
            //         RunObject = Page 78132;
            //         Visible = false;
            //         ApplicationArea = All;
            //     }

            //     action("Admissions letters list")
            //     {
            //         Caption = 'Admissions letters list';
            //         RunObject = Page 68524;
            //         Visible = false;
            //         ApplicationArea = All;
            //     }
            //     action("pending documents verification")
            //     {
            //         Caption = 'pending documents verification';
            //         RunObject = Page 68483;
            //         ApplicationArea = All;
            //     }
            //     action("pending payments confirmation")
            //     {
            //         Caption = 'pending payments confirmation';
            //         RunObject = Page 68522;
            //         Visible = false;
            //         ApplicationArea = All;
            //     }
            //     action("pending Admission confirmation")
            //     {
            //         Caption = 'pending Admission confirmation';
            //         RunObject = Page 68523;
            //         Visible = false;
            //         ApplicationArea = All;
            //     }
            //     action(Admitted_GSS)
            //     {
            //         Caption = 'Admitted Students - GSS';
            //         RunObject = Page 70086;
            //         ApplicationArea = All;
            //     } */
            // }
            group("Students Management")
            {
                Caption = 'Students Management';
                Image = ResourcePlanning;
                Visible = false;
                action(Registration)
                {
                    Image = Register;



                    RunObject = Page 68836;
                    ApplicationArea = All;
                    Visible = False;
                }
                action("Students Card")
                {
                    Image = Registered;



                    RunObject = Page 68837;
                    ApplicationArea = All;
                }
                action(Programme)
                {
                    Caption = 'Programmes';
                    RunObject = Page 68757;
                    ApplicationArea = All;
                }
                action("Signing of Norminal Role")
                {
                    Caption = 'Signing of Norminal Role';
                    RunObject = Page 68238;
                    ApplicationArea = All;
                }
                action("Class Allocations")
                {
                    Image = Allocate;
                    RunObject = Page 68417;
                    ApplicationArea = All;
                }
            }
            group(LectMan)
            {
                Caption = 'Lecturer Management';
                Image = HumanResources;
                Visible = False;
                action(SemBatches)
                {
                    Caption = 'Lect. Loading Semester Batches';
                    Image = Register;



                    RunObject = Page 65210;
                    ApplicationArea = All;
                }
                action(LoadApp)
                {
                    Caption = 'Loading Approvals';
                    Image = Registered;



                    RunObject = Page 65215;
                    ApplicationArea = All;
                }
                action(ApprovedLoad)
                {
                    Caption = 'Approved Loading';
                    RunObject = Page 65227;
                    ApplicationArea = All;
                }
                action(ClaimsGen)
                {
                    Caption = 'Lect. Claim Generation';
                    RunObject = Page 65216;
                    ApplicationArea = All;
                }
                action(LoadPendingDeptApp)
                {
                    Caption = 'Loading Pending Dept. Approval';
                    Image = Registered;



                    RunObject = Page 65226;
                    ApplicationArea = All;
                }
                action(PostedSemBatches)
                {
                    Caption = 'Posted Load Batches';
                    RunObject = Page 65217;
                    ApplicationArea = All;
                }
                action(LoadHist)
                {
                    Caption = 'Loading History';
                    RunObject = Page 65225;
                    ApplicationArea = All;
                }
                action(LoadCentralSetup)
                {
                    Caption = 'Loading Central Setup';
                    Image = Registered;



                    RunObject = Page 65204;
                    ApplicationArea = All;
                }
            }
            group(Timetabling)
            {
                Caption = 'Timetable Management';
                Image = Statistics;
                Visible = false;
                action(TimetableCentral)
                {
                    Caption = 'Teaching Timetable';
                    Image = Register;



                    RunObject = Page 74500;
                    ApplicationArea = All;
                }
                action("Exam Timetable")
                {
                    Caption = 'Exam Timetable';
                    RunObject = Page 74550;
                    ApplicationArea = All;
                }
            }
            group("Lecture Evaluation")

            {
                Visible = false;

                action(Evaluation)

                {
                    ApplicationArea = All;


                    RunObject = page "ACA-Evaluation Semesters List";
                }
            }
            // group("Class Attendance")
            // {
            //     action("Class Register")
            //     {
            //         ApplicationArea = All;


            //         RunObject = Page "Class Attendance List";
            //     }
            // }
            group(Clearances)
            {
                Caption = 'Student Clearance';
                Image = Intrastat;
                Visible = False;
                action(OpenClearance)
                {
                    Caption = 'Student Clearance (Open)';
                    Image = Register;



                    RunObject = Page 68971;
                    ApplicationArea = All;
                }
                action(ActiveClearance)
                {
                    Caption = 'Student Clearance (Active)';
                    Image = Registered;



                    RunObject = Page 68972;
                    ApplicationArea = All;
                }
                action(Cleared)
                {
                    Caption = 'Student Clearance(Cleared)';
                    RunObject = Page 68973;
                    ApplicationArea = All;
                }
                action(AllumniList)
                {
                    Caption = 'Student Aluminae List';
                    RunObject = Page 68974;
                    ApplicationArea = All;
                }
            }
            group(thesis)
            {
                Caption = 'Project/Thesis Tracking';
                Visible = false;
                action(project)
                {
                    Caption = 'Thesis';
                    RunObject = Page "ACA-Project Thesis";
                    ApplicationArea = All;
                }
            }
            group(Setups)
            {
                Caption = 'Setups';
                Image = Setup;
                Visible = False;
                action(Programmes)
                {
                    Caption = 'Programmes';
                    RunObject = Page 68757;
                    ApplicationArea = All;
                }
                action(Nationality)
                {
                    Caption = 'Nationality';
                    RunObject = Page 68868;
                    ApplicationArea = All;
                }
                action("Marketing Strategies")
                {
                    Caption = 'Marketing Strategies';
                    RunObject = Page 68865;
                    ApplicationArea = All;
                }
                action("Schools/Faculties")
                {
                    Caption = 'Schools/Faculties';
                    RunObject = Page 68832;
                    ApplicationArea = All;
                }
                action(Religions)
                {
                    Caption = 'Religions';
                    RunObject = Page 68841;
                    ApplicationArea = All;
                }
                action(Denominations)
                {
                    Caption = 'Denominations';
                    RunObject = Page 68842;
                    ApplicationArea = All;
                }
                action("Insurance Companies")
                {
                    Caption = 'Insurance Companies';
                    ApplicationArea = All;
                    //RunObject = Page 68844;
                }
                action(Relationships)
                {
                    Caption = 'Relationships';
                    RunObject = Page 68845;
                    ApplicationArea = All;
                }
                action(Counties)
                {
                    Caption = 'Counties';
                    RunObject = Page 68871;
                    ApplicationArea = All;
                }
                action("Clearance Codes")
                {
                    Caption = 'Clearance Codes';
                    Image = Setup;
                    RunObject = Page 68966;
                    ApplicationArea = All;
                }
                action("Registration List")
                {
                    Image = Allocations;
                    RunObject = Page 69187;
                    ApplicationArea = All;
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;
                Visible = false;
                action("Pending My Approval")
                {
                    Caption = 'Pending My Approval';
                    RunObject = Page 658;
                    ApplicationArea = All;
                }
                action("My Approval requests")
                {
                    Caption = 'My Approval requests';
                    RunObject = Page 662;
                    ApplicationArea = All;
                }
                action("Clearance Requests")
                {
                    Caption = 'Clearance Requests';
                    RunObject = Page 68970;
                    ApplicationArea = All;
                }
            }
            /* group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Stores Requisitions")
                {
                    Caption = 'Stores Requisitions';
                    RunObject = Page 68218;
                }
                action("Imprest Requisitions")
                {
                    Caption = 'Imprest Requisitions';
                    RunObject = Page 68125;
                }
                action("Leave Applications")
                {
                    Caption = 'Leave Applications';
                    RunObject = Page 68107;
                }
                action("My Approved Leaves")
                {
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page 68232;
                }
                action("File Requisitions")
                {
                    Image = Register;
                   
                    RunObject = Page 69183;
                }
                action("Meal Booking")
                {
                    Caption = 'Meal Booking';
                    RunObject = Page 69302;
                }
            } */
        }
        area(reporting)
        {
            group(Periodic)
            {
                Caption = 'Periodic Reports';
                Visible = False;
                group(AcadReports2)
                {
                    Caption = 'Academic Reports';
                    Image = AnalysisView;
                    action("All Students")
                    {
                        Image = Report2;
                        RunObject = Report 51466;
                        ApplicationArea = All;
                    }
                    action("Class List")
                    {
                        Image = DueDate;
                        RunObject = Report 86524;
                        ApplicationArea = All;
                    }
                    action("Prog. Units")
                    {
                        Caption = 'PRogram Study Plan';
                        Image = Report;
                        RunObject = Report 51203;
                        ApplicationArea = All;
                    }
                    action(unitsOff)
                    {
                        Caption = 'Units On Offer';
                        Image = Report;
                        RunObject = Report 86522;
                        ApplicationArea = All;
                    }
                    action("Student Applications Report")
                    {
                        Caption = 'Student Applications Report';
                        Image = Report;
                        RunObject = Report 51862;
                        ApplicationArea = All;
                    }
                    action("Norminal Roll")
                    {
                        Caption = 'Norminal Roll';
                        Image = Report2;
                        RunObject = Report 51765;
                        ApplicationArea = All;
                    }
                    action("Class List (By Stage)")
                    {
                        Caption = 'Class List (By Stage)';
                        Image = List;


                        RunObject = Report 51767;
                        ApplicationArea = All;
                    }
                    action("Signed Norminal Roll")
                    {
                        Caption = 'Signed Norminal Roll';
                        Image = Report2;

                        RunObject = Report 51134;
                        ApplicationArea = All;
                    }
                    action("Program List By Gender && Type")
                    {
                        Caption = 'Program List By Gender && Type';
                        Image = PrintReport;


                        RunObject = Report 51780;
                        ApplicationArea = All;
                    }
                    action("population By Faculty")
                    {
                        Caption = 'population By Faculty';
                        Image = PrintExcise;


                        RunObject = Report 51781;
                        ApplicationArea = All;
                    }
                    action("Multiple Record")
                    {
                        Caption = 'Multiple Record';
                        Image = Report2;
                        RunObject = Report 51770;
                        ApplicationArea = All;
                    }
                    action("Classification By Campus")
                    {
                        Caption = 'Classification By Campus';
                        Image = Report2;
                        RunObject = Report 51776;
                        ApplicationArea = All;
                    }
                    action("Population By Campus")
                    {
                        Caption = 'Population By Campus';
                        Image = Report2;
                        RunObject = Report 51777;
                        ApplicationArea = All;
                    }
                    action("Population by Programme")
                    {
                        Caption = 'Population by Programme';
                        Image = Report2;
                        RunObject = Report 51778;
                        ApplicationArea = All;
                    }
                    action("Prog. Category")
                    {
                        Caption = 'Prog. Category';
                        Image = Report2;
                        RunObject = Report 51779;
                        ApplicationArea = All;
                    }
                    action("List By Programme")
                    {
                        Caption = 'List By Programme';
                        Image = Report;
                        RunObject = Report 51766;
                        ApplicationArea = All;
                    }
                    action("List By Programme (With Balances)")
                    {
                        Caption = 'List By Programme (With Balances)';
                        Image = PrintReport;


                        RunObject = Report 51768;
                        ApplicationArea = All;
                    }
                    action("Type. Study Mode, & Gender")
                    {
                        Caption = 'Type. Study Mode, & Gender';
                        Image = Report;
                        RunObject = Report 51785;
                        ApplicationArea = All;
                    }
                    action("Study Mode & Gender")
                    {
                        Caption = 'Study Mode & Gender';
                        Image = Report;
                        RunObject = Report 51786;
                        ApplicationArea = All;
                    }
                    action("County & Gender")
                    {
                        Caption = 'County & Gender';
                        Image = Report;
                        RunObject = Report 51788;
                        ApplicationArea = All;
                    }
                    action("List By County")
                    {
                        Caption = 'List By County';
                        Image = Report;
                        RunObject = Report 51789;
                        ApplicationArea = All;
                    }

                    action("Enrollment By Stage")
                    {
                        Caption = 'Enrollment By Stage';
                        Image = Report2;
                        RunObject = Report 51545;
                        ApplicationArea = All;
                    }
                    action("Import Units")
                    {
                        Caption = 'Import Units';
                        Image = ImportExcel;


                        RunObject = Page 68938;
                        ApplicationArea = All;
                    }
                    action("Hostel Allocations")
                    {
                        Caption = 'Hostel Allocations';
                        Image = PrintCover;


                        RunObject = Report 51719;
                        ApplicationArea = All;
                    }
                    action("Students List (By Program)")
                    {
                        Caption = 'Students List (By Program)';
                        Image = Report;


                        RunObject = Report 51820;
                        ApplicationArea = All;
                    }
                    action("Programme Units")
                    {
                        Caption = 'Programme Units';
                        Image = Report;

                        RunObject = Report 51203;
                        ApplicationArea = All;
                    }
                    action("CUE Report")
                    {
                        Caption = 'CUE Report';
                        Image = Agreement;

                        RunObject = Report 63905;
                        ApplicationArea = All;
                    }
                }
                group("Before Exams")
                {
                    Caption = 'Before Exams';
                    action("Examination Cards")
                    {
                        Caption = 'Examination Cards';
                        Image = Card;


                        RunObject = Report 51774;
                        ApplicationArea = All;
                    }
                    action("Exam Card Stickers")
                    {
                        Caption = 'Exam Card Stickers';
                        Image = Split;

                        RunObject = Report 51775;
                        ApplicationArea = All;
                    }
                }
                group("Students Finance Reports")
                {
                    Image = Statistics;
                    action("Students Balances")
                    {
                        Image = PrintInstallment;

                        RunObject = Report 51481;
                        ApplicationArea = All;
                    }
                    action("Per Programme Balances")
                    {
                        Image = PrintInstallment;

                        RunObject = Report 51485;
                        ApplicationArea = All;
                    }
                    action("Per Stage Balances")
                    {
                        Image = PrintInstallment;
                        RunObject = Report 51493;
                        ApplicationArea = All;
                    }
                    action("Students Faculty Income Summary")
                    {
                        Image = PrintInstallment;
                        RunObject = Report 51482;
                        ApplicationArea = All;
                    }
                    action("Student Invoices Per Charge")
                    {
                        Caption = 'Student Invoices Per Charge';
                        Image = PrintInstallment;


                        RunObject = Report 51747;
                        ApplicationArea = All;
                    }
                    action("Fee Structure Report")
                    {
                        Caption = 'Fee Structure Report';
                        Image = Report;
                        RunObject = Report 51794;
                        ApplicationArea = All;
                    }
                    action("Student Receipts per Charge")
                    {
                        Caption = 'Student Receipts per Charge';
                        Image = PrintReport;


                        RunObject = Report 51748;
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
}

