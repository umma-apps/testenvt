page 40013 "Admissions Role Center"
{
    Caption = 'Admissions Role Center';
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
            part("ACA Admission Statistics"; "ACA Admission Statistics")
            {
                ApplicationArea = basic, Suite;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("General Setups")
            {
                Caption = 'Setups';
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
                    }


                    action(Intakes)
                    {
                        Image = Customer;
                        RunObject = Page "ACA-Intake List";
                        ApplicationArea = ALL;
                    }
                    action(IntakeFee)
                    {
                        Image = CashFlow;
                        RunObject = Page "Program Intake Fee";
                        ApplicationArea = ALL;
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
                    action("Marketing Setup")
                    {
                        Image = MarketingSetup;

                        RunObject = Page "Marketing Setup";
                        ApplicationArea = All;
                    }
                    action("MarketingStrategies")
                    {
                        Image = MarketingSetup;

                        RunObject = Page "ACA-Marketing Strategies";
                        ApplicationArea = All;
                    }
                    action("ACA-Marketing Strategies 2")
                    {
                        Image = MarketingSetup;

                        RunObject = Page "ACA-Marketing Strategies 2";
                        ApplicationArea = All;
                    }



                }
            }
            group("Admission History")
            {
                group(AdminHist)
                {
                    Caption = 'Admissions History';
                    Image = History;
                    action("Pending Admissions")
                    {
                        Image = History;

                        RunObject = Page "ACA-Pending Admissions List";
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
                group(AdminReports)
                {
                    Caption = 'Admission Reports';
                    Image = ResourcePlanning;
                    action("Admissions Summary")
                    {
                        Caption = 'Admissions Summary';
                        Image = Report;


                        RunObject = Report 86663;
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
        }
        area(embedding)
        {
            action("Reg Temp")
            {
                RunObject = page "ACA-Application RegTemp";
                ApplicationArea = All;
            }






            action("Applicant Admission Letters")
            {
                Image = CustomerList;


                RunObject = Page 68515;
                ApplicationArea = All;
            }




        }

        area(Sections)
        {
            group("Admissions")
            {
                Caption = 'Admissions';
                Image = RegisteredDocs;
                action(AllAplications)
                {
                    Caption = 'All Aplications';
                    RunObject = Page "ACA- All Applications list";
                    ApplicationArea = All;
                }
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
                    RunObject = Page "DAB List";
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
                    Visible = false;
                }
                action(Registrations)
                {
                    Caption = 'Registration';
                    RunObject = Page 70083;
                    Visible = true;
                    ApplicationArea = All;
                }
                // action("Registration KUCCPS")
                // {
                //     RunObject = Page "ACA-KUCCPS Student Reg";
                //     Visible = true;
                //     ApplicationArea = All;
                // }
                action("Admitted Students")
                {
                    Caption = 'Admitted Students';
                    RunObject = Page "ACA-Admitted Students";
                    ApplicationArea = All;
                }
                // action("GSS Imports")
                // {
                //     Caption = 'Import GSS Admissions';
                //     RunObject = Page 68491;
                //     ApplicationArea = All;
                // }
                // action(onlineUsers)
                // {
                //     Image = User;
                //     RunObject = page OnlineUsers;
                //     ApplicationArea = All;
                // }
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
                action(Registration)
                {
                    Image = Register;
                    RunObject = Page 68836;
                    ApplicationArea = All;

                }


            }
            group(Setups)
            {
                Caption = 'Setups';
                Image = Setup;
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


                action(Counties)
                {
                    Caption = 'Counties';
                    RunObject = Page 68871;
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

        }



    }


}
