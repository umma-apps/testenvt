page 40014 "HoD  Role center"
{
    Caption = 'HoD  Role center';
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

            group(Academics)
            {
                group(Academics2)
                {
                    Caption = 'Academic';
                    Image = Departments;
                    action("Process Marks")
                    {
                        Caption = 'Process Marks';
                        Image = AdjustEntries;
                        RunObject = Page "Process Exams Central Gen.";
                        ApplicationArea = All;
                    }
                    action("Marks Entry")
                    {
                        Image = MarketingSetup;
                        ApplicationArea = All;
                        RunObject = Page "Exam Mark Entry";
                    }

                    action("Import Results")
                    {
                        Caption = 'Import Results';
                        Image = UserSetup;
                        RunObject = Page 69023;
                        ApplicationArea = All;
                    }
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
            group("Academic reports")
            {
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

                    action(suppStud)
                    {
                        Caption = 'Supp/Special Students';
                        Image = Report;
                        RunObject = Report SupplimentaryReport;
                        ApplicationArea = All;
                    }
                    action(Classlist)
                    {
                        Image = CalculateSalesTax;
                        RunObject = Report "ACA-Class List";
                        ApplicationArea = All;
                    }
                    // action(Classlist2)
                    // {
                    //     Image = CalculateSalesTax;
                    //     RunObject = Report "ACA-Class List (List By Stage)";
                    //     ApplicationArea = All;
                    // }
                    action("Students Registered Per Unit")
                    {
                        Image = Register;
                        RunObject = Report "Students Registered Per Unit";
                        ApplicationArea = All;
                    }
                    action("Transcript")
                    {
                        Image = Register;
                        RunObject = Report "Final Graduation Transcript";
                        ApplicationArea = All;
                    }
                    action("Semester Results")
                    {
                        Image = ResourceSkills;


                        RunObject = Report "Provisional Transcript2";
                        ApplicationArea = All;
                    }
                    action("Exam Attendance")
                    {
                        Image = ResourceSkills;
                        RunObject = Report "Exam Attendance.";//Exam Attendance Clearance
                        ApplicationArea = All;
                    }
                    action("Exam Attendance Clearance")
                    {
                        Image = ResourceSkills;
                        RunObject = Report "Exam Attendance Clearance";//Exam Attendance Clearance
                        ApplicationArea = All;
                    }



                }
            }
        }
        area(embedding)
        {

            action(examEnrty)
            {
                Caption = 'Exam Marks Report';
                Image = ExpandAll;
                RunObject = page "Exam Mark Entry";
                ApplicationArea = All;
                //Visible = false;
            }


            action("program List")
            {
                Caption = 'Program Study Plan';
                Image = FixedAssets;
                RunObject = Page 68757;
                ApplicationArea = All;
            }

            action("Units on Offer")
            {
                //Caption = 'Load Stages';
                Image = FixedAssets;
                RunObject = Page "ACA-Units Offered";
                ApplicationArea = All;
                //Visible = false;

            }

            action("Historical Transcript")
            {
                RunObject = Page "Historical Transcript Data";
                ApplicationArea = All;
            }
            action("Supplimentary/Specials")
            {
                RunObject = page "Supplimentary/Specials";
                ApplicationArea = All;
            }


            action(unitsMater)
            {
                Caption = 'Units Master Table';
                Image = UserInterface;
                RunObject = Page "ACA-Units Master table";
                ApplicationArea = All;
            }





        }
        area(sections)
        {
            group("Registration Process")
            {
                action("Units Offered")
                {
                    RunObject = Page "ACA-Units Offered";
                    ApplicationArea = All;
                }
                action("Associate Units")
                {
                    RunObject = Page "ACA-Associated Units";
                    ApplicationArea = All;
                }
            }
            group("Students Management")
            {
                Caption = 'Students Management';
                Image = ResourcePlanning;
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

            }
            group(LectMan)
            {
                Caption = 'Lecturer Management';
                Image = HumanResources;
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
                    Visible = false;
                }
                action(ApprovedLoad)
                {
                    Caption = 'Approved Loading';
                    RunObject = Page 65227;
                    ApplicationArea = All;
                    Visible = false;
                }
                action(ClaimsGen)
                {
                    Caption = 'Lect. Claim Generation';
                    RunObject = Page 65216;
                    ApplicationArea = All;
                    Visible = false;
                }
                action(LoadPendingDeptApp)
                {
                    Caption = 'Loading Pending Dept. Approval';
                    Image = Registered;

                    Visible = false;

                    RunObject = Page 65226;
                    ApplicationArea = All;
                }
                action(PostedSemBatches)
                {
                    Caption = 'Posted Load Batches';
                    RunObject = Page 65217;
                    ApplicationArea = All;
                    Visible = false;
                }
                action(LoadHist)
                {
                    Caption = 'Loading History';
                    RunObject = Page 65225;
                    ApplicationArea = All;
                    Visible = false;
                }
                action(LoadCentralSetup)
                {
                    Caption = 'Loading Central Setup';
                    Image = Registered;
                    Visible = false;
                    RunObject = Page 65204;
                    ApplicationArea = All;
                }
            }


            group("Lecture Evaluation")
            {
                action(Evaluation)
                {
                    ApplicationArea = All;


                    RunObject = page "ACA-Evaluation Semesters List";
                }
                action("Evaluation Results")
                {
                    ApplicationArea = All;
                    RunObject = page "Evaluation Results";
                }
            }
            group("Periodic Reports")
            {
                group("Senate Reports")
                {
                    action(ConsMarkssheet)
                    {
                        Caption = 'Consolidated Marksheet';
                        Image = CompleteLine;
                        RunObject = Report "ACA-Consolidated Marksheet 1";
                        ApplicationArea = All;
                    }
                    action(ConsMarkssheet2)
                    {
                        Caption = 'Consolidated Marksheet';
                        Image = CompleteLine;

                        RunObject = Report "ACA-Consolidated Marksheet 2";
                        ApplicationArea = All;
                    }
                    action(SenSummary)
                    {
                        Visible = false;
                        Caption = 'Senate Summary Report';
                        Image = Agreement;
                        RunObject = Report 78052;
                        ApplicationArea = All;
                    }

                    action("Senate Summary Report 2")
                    {
                        Caption = 'Senate Summary Report 2';
                        Image = Report;

                        RunObject = Report 81800;

                        ApplicationArea = All;
                    }
                    action("Final Senate Report")
                    {
                        ApplicationArea = All;
                        Image = Report;
                        RunObject = report "Senate Report(NEW)";
                    }

                }
                group("Graduation Reports")
                {
                    action("ClassificationList")
                    {
                        Caption = 'Classification List';
                        Image = Completed;

                        RunObject = Report "Final Deans Classification 2";
                        ApplicationArea = All;
                    }
                    action("GraduationList")
                    {
                        Caption = 'Graduation List';
                        Image = CompleteLine;
                        RunObject = Report "Final Deans Graduation List 2";
                        ApplicationArea = All;
                    }
                    action("ConsolidatedMarksheet")
                    {
                        Caption = 'Consolidated Marksheet';
                        Image = CompleteLine;

                        RunObject = Report 78040;
                        ApplicationArea = All;
                    }
                    action("ClassificationMarksheet")
                    {
                        Caption = 'Classification Marksheet';
                        Image = Aging;
                        RunObject = Report "Classification Marksheet";
                        Visible = false;
                        ApplicationArea = All;
                    }
                    action("IncompleteList")
                    {
                        Caption = 'Incomplete List';
                        Image = ContactFilter;

                        RunObject = Report "Deans Incomplete List";
                        ApplicationArea = All;
                    }
                    action("IncompleteList (Detailed)")
                    {
                        Caption = 'Incomplete List (Detailed)';
                        Image = Continue;
                        RunObject = Report "Reasons for Incomplete";
                        ApplicationArea = All;
                    }
                    action("FailedUnits List")
                    {
                        Caption = 'Failed Units List';
                        Image = ContractPayment;

                        RunObject = Report "Cummulative Failed Units";
                        ApplicationArea = All;
                    }
                    action("GraduationProgressReport")
                    {
                        Caption = 'Graduation Progress Report';
                        Image = CreateJobSalesCreditMemo;


                        RunObject = Report 66629;
                        ApplicationArea = All;
                    }
                    action("SenateReport")
                    {
                        Caption = 'Senate Report';
                        Image = Agreement;

                        RunObject = Report "Exams Final Pass List C2";
                        ApplicationArea = All;
                    }
                    action("SenateReport(Grouped)")
                    {
                        Caption = 'Senate Report (Grouped)';
                        Image = AutofillQtyToHandle;

                        RunObject = Report "Exams Final Pass List C17";
                        ApplicationArea = All;
                    }
                    action(CummResits)
                    {
                        Caption = 'Cummulative Resit';
                        Image = AddAction;
                        RunObject = Report "ACA-Cummulative Resit";
                        ApplicationArea = All;
                    }
                    action(CummHalts)
                    {
                        Caption = 'Cummulative Halt List';
                        Image = AddWatch;
                        RunObject = Report "ACA-Cummulative Halt List";
                        ApplicationArea = All;
                    }
                }
                group("Transcript Reports")
                {
                    action("Provisional Transcript")
                    {
                        Caption = 'Provisional Transcript';
                        Image = FixedAssets;

                        RunObject = Report 66665;
                        ApplicationArea = All;
                    }
                    action("Provisional Transcript 2")
                    {
                        ApplicationArea = All;
                        Image = Track;
                        RunObject = report "Provisional College Trans. 3";
                    }
                    action("Test Transcript")
                    {
                        Caption = 'Exam Results';
                        Image = FixedAssets;

                        RunObject = Report "Provisional Transcript2";
                        ApplicationArea = All;
                    }
                    action("Final Transcript")
                    {
                        Caption = 'Final Transcript';
                        Image = Split;

                        RunObject = Report "Final Transcript";
                        ApplicationArea = All;
                    }

                }
                group("Other Reports")
                {
                    action("Course Loading")
                    {
                        Caption = 'Course Loading';
                        Image = LineDiscount;

                        RunObject = Report 69270;
                        ApplicationArea = All;
                    }
                    action("Examination Cards%")
                    {
                        Caption = 'Examination Cards';
                        Image = Card;
                        RunObject = Report "Exam Card Final";
                        ApplicationArea = All;
                    }
                    action("Class attendance With B")
                    {
                        RunObject = Report 51580;
                        ApplicationArea = All;
                    }
                    action("Class Attendance Without B")
                    {
                        RunObject = Report 51594;
                        ApplicationArea = All;
                    }
                    action(examattendanceVC)
                    {
                        Caption = 'Exam Attendance';
                        RunObject = Report "Exam Attendance Clearance";
                        ApplicationArea = All;
                    }
                    action("Class Grade Sheet")
                    {
                        Caption = 'Class Grade Sheet';
                        Image = CheckDuplicates;

                        RunObject = Report 51799;
                        Visible = false;
                        ApplicationArea = All;
                    }


                    action("Students Registered Per Unit@")
                    {
                        RunObject = Report "Students Registered Per Unit";
                        ApplicationArea = All;
                    }

                    action("Marks Entry Statistics")
                    {
                        Caption = 'Marks Entry Statistics';
                        Image = AddAction;
                        RunObject = Report 69276;
                        ApplicationArea = All;
                    }
                    action("Check Exam Results")
                    {
                        Caption = 'Check Exam Results';
                        Image = Design;

                        RunObject = Report 51771;
                        ApplicationArea = All;
                    }
                    action("Student Progress Report")
                    {
                        Caption = 'Student Progress Report';
                        Image = Agreement;
                        RunObject = Report 51801;
                        ApplicationArea = All;
                    }
                    action(CummRes2)
                    {
                        Caption = 'Cummulative Resit';
                        Image = AddAction;

                        RunObject = Report 50009;
                        ApplicationArea = All;
                    }
                    action(CummHalt)
                    {
                        Caption = 'Cummulative Halt List';
                        Image = AddWatch;

                        // RunObject = Report 50011;
                        ApplicationArea = All;
                    }

                }

            }


        }
        area(reporting)
        {
            group(Periodic)
            {
                Caption = 'Periodic Reports';
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
                    action("Exam Attendance Clearance2")
                    {
                        Caption = 'Exam Attendance Clearance';
                        Image = Card;


                        RunObject = Report "Exam Attendance Clearance";
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

            }
        }


    }
}

