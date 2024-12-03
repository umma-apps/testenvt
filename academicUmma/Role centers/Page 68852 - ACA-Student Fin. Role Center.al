/// <summary>
/// Page ACA-Student Fin. Role Center (ID 68852).
/// </summary>
page 68852 "ACA-Student Fin. Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(general)
            {
#pragma warning disable AL0269
                part("StudBilling"; "ACA-Std Billing List")
#pragma warning restore AL0269
                {
                    Caption = 'Student Billing';
                    Visible = true;
                    ApplicationArea = All;
                }
#pragma warning disable AL0269
                part("Bank Account"; "Bank Account List")
#pragma warning restore AL0269
                {
                    Caption = 'Bank Account';
                    ApplicationArea = All;
                }
                /* part("OffReceipt"; 68207)
                {
                    Caption = 'Official Receipt';
                } */
                part(ACACharge; "ACA-Charge")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Students With Balances")
            {
                Image = AddAction;


                RunObject = Report 50058;
                ApplicationArea = All;
            }
            action("Import Receipts")
            {
                Caption = 'Import Receipts';
                Image = ImportExport;
                ApplicationArea = All;
                // RunObject = XMLport 50019;
            }
            // action("Import Receipts Buffer")
            // {
            //     Caption = 'Import Receipts Buffer';
            //     Image = Bins;
            //     RunObject = Page "ACA-Imported Receipts Buffer";
            //     ApplicationArea = All;
            // }
            action("Posted Receipts Buffer")
            {
                Caption = 'Posted Receipts Buffer';
                Image = PostedReceipt;

                RunObject = Page 68790;
                ApplicationArea = All;
            }
            action("Close Current Semester")
            {
                Caption = 'Close Current Semester';
                Image = "Report";
                RunObject = Report 51572;
                ApplicationArea = All;
            }
            action("Post Batch Billing")
            {
                Caption = 'Post Batch Billing';
                Image = Report2;

                RunObject = Report "Post Billing";
                ApplicationArea = All;
                //Visible = false;
            }
            action("Genereal Setup")
            {
                Caption = 'General Setup';
                Image = GeneralPostingSetup;

                RunObject = Page 68760;
                ApplicationArea = All;
            }
            action("General journal")
            {
                Caption = 'General journal';
                Image = Journal;
                RunObject = Page 39;
                ApplicationArea = All;
            }

            action(Programmes)
            {
                Caption = 'Programmes';
                Image = List;

                RunObject = Page "ACA-Programmes List";
                ApplicationArea = All;
            }
            action("Charge Codes")
            {
                Image = List;

                RunObject = Page "ACA-Charge";
                ApplicationArea = All;
            }
            action("import fee waiver")
            {
                Caption = 'import fee waiver';
                ApplicationArea = All;
                // RunObject = XMLport 50066;
            }
        }
        area(embedding)
        {
            action(Customers)
            {
                Caption = 'Customers';
                Image = Customer;

                RunObject = Page 22;
                ApplicationArea = All;
            }
            action("Export Data")
            {
                RunObject = Page "Data Mine2";
                ApplicationArea = All;
            }
            action("Student Billing")
            {
                Caption = 'Student Billing';
                Image = "Order";

                RunObject = Page 68835;
                ApplicationArea = All;
            }
            action("Receipt Buffer")
            {
                Image = BreakRulesOff;
                RunObject = page "Receipt Buffer List";
                ApplicationArea = All;
            }
            action("Charge addition")
            {
                ApplicationArea = all;
                RunObject = page "Aca-Charge Additions";

            }
            action("Process Admission")
            {
                //Caption = 'Student Billing';
                Image = "Order";

                RunObject = Page "ACA-Application Fin";
                ApplicationArea = All;
            }
            action("Receipts")
            {
                Image = Receivables;
                ApplicationArea = Basic, Suite;
                Caption = 'Receipts';
                RunObject = Page "FIN-Receipts List";
                ToolTip = 'Process Applications';
            }
            action("Posted Receipts")
            {
                ApplicationArea = all;
                Caption = 'Posted Receipts';
                RunObject = Page "FIN-Posted Receipts list";
            }
            action("Imprest Accounting")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "FIN-Imprest Accounting";
                ToolTip = 'Receive Imprest';
            }
            // action("Official Receipt")
            // {
            //     Caption = 'Official Receipt';
            //     ApplicationArea = All;
            //     // RunObject = Page 68207;
            // }
            action("Settlement Types")
            {
                Caption = 'Settlement Types';
                RunObject = Page 68747;
                ApplicationArea = All;
            }

        }
        area(reporting)
        {
            group("Reports And Analysis")
            {
                Caption = 'Reports And Analysis';
                Image = Journals;
                action("Vendor Statement")
                {
                    Caption = 'Vendor statement';
                    Image = Balance;
                    RunObject = Report "Vendor Statement Summary";
                    ApplicationArea = All;
                }
                action("Fee Structure")
                {
                    Caption = 'Fee Structure';
                    Image = Balance;
                    RunObject = Report "ACA-Fee Structure";
                    ApplicationArea = All;
                }
                action("Scholarship Summary")
                {

                    Image = Report;
                    RunObject = report "Scholarship-Batch Summary";
                    ApplicationArea = All;
                }
                action("Scholarship Summary2")
                {
                    Caption = 'Scholarship Summary Detailed';
                    Image = Report;
                    RunObject = report "Scholarship-Batch Report";
                    ApplicationArea = All;
                }

                action("Supp/Special")
                {
                    Image = Report;
                    RunObject = Report SupplimentaryReport;
                    ApplicationArea = All;
                }

                action("Transcript")
                {
                    Image = Register;
                    RunObject = Report "Final Graduation Transcript";
                    ApplicationArea = All;
                }
                action(unitPrices)
                {
                    Image = Payables;
                    ApplicationArea = All;
                    RunObject = Page UnitPrices;
                }
                action(Rebill)
                {
                    //Caption = 'Rebill';
                    Image = Balance;
                    RunObject = Report "Validate Settlement Type";
                    ApplicationArea = All;
                }
                action("Bill Supp")
                {
                    Image = VendorBill;
                    RunObject = Report "Validate Supp";
                    ApplicationArea = All;
                }
                action("StudBillVer")
                {
                    Caption = 'Verify Student Billing';
                    Image = Balance;
                    RunObject = Report "Verify Student Billing";
                    ApplicationArea = All;
                }
                action("Proforma Invoices")
                {
                    Caption = 'Proforma Invoices';
                    Image = PrintVoucher;
                    RunObject = Report "Student Proforma Invoice2";
                    ApplicationArea = All;
                }
                action("Student Statements")
                {
                    Caption = 'Student Statements';
                    Image = Journals;
                    RunObject = Report 51072;
                    ApplicationArea = All;
                }
                action("Student Receipts")
                {
                    Image = Receipt;
                    RunObject = Report "Student Fee Receipts";
                    ApplicationArea = All;
                }
                action("Payment Journals")
                {
                    Caption = 'Payment Journals';
                    Image = Journals;
                    RunObject = Page 251;
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ApplicationArea = All;
                }
                action("General Journals")
                {
                    Caption = 'General Journals';
                    Image = Journal;
                    RunObject = Page 251;
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ApplicationArea = All;
                }
                action("Student Billings Analysis")
                {
                    Caption = 'Student Billings Analysis';
                    Image = "Report";
                    RunObject = Report 51542;
                    ApplicationArea = All;
                }
                action("   Student Balances2")
                {
                    Caption = '   Student Balances2';
                    RunObject = Report 70092;
                    ApplicationArea = All;
                }
                action(Balances)
                {
                    Caption = 'Balances';
                    Image = AdjustItemCost;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Report 65588;
                    ApplicationArea = All;
                }
                action(" Fee balances")
                {
                    Caption = ' Fee balances';
                    Image = AddWatch;

                    RunObject = Report 51258;
                    ApplicationArea = All;
                }
                action("Helb Report")
                {
                    Caption = 'Helb Report';
                    Image = Agreement;

                    ApplicationArea = All;
                    //  RunObject = Report 77702;
                }
                action("Fee collection Report")
                {
                    Caption = '   Fee collection Report';
                    RunObject = Report 51370;
                    ApplicationArea = All;
                }
                action("Fee Balance New")
                {
                    RunObject = report "Student BalancesNew";
                    ApplicationArea = All;
                }
                action(examattendanceVC)
                {
                    Caption = 'Exam Attendance';
                    RunObject = Report 84509;
                    ApplicationArea = All;
                }
            }
            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page 344;
                ApplicationArea = All;
            }

        }
        area(sections)
        {
            group(Basics)
            {
                Caption = 'Basics';
                action(Programme)
                {
                    Caption = 'Programmes';
                    Image = List;

                    RunObject = Page "ACA-Programmes List";
                    ApplicationArea = All;
                }
                action(Customer)
                {
                    Caption = 'Customers';
                    Image = Customer;

                    RunObject = Page "Customer List";
                    ApplicationArea = All;
                }
                action("StuBilling")
                {
                    Caption = 'Student Billing';
                    Image = "Order";

                    RunObject = Page "ACA-Std Billing List";
                    ApplicationArea = All;
                }
                /* action("Unposted Intergration Transactions")
                {
                    Caption = 'Unposted Intergration Transactions';
                    RunObject = Page 77727;
                }
                action("Posted Equity Transactions")
                {
                    Caption = 'Posted Equity Transactions';
                    RunObject = Page 77728;
                } */
            }

            // group(Applications1)
            // {
            //     action(Applications)
            //     {
            //         //Caption = 'SRO';
            //         RunObject = Page "ACA-Applications Finance";
            //         ApplicationArea = All;
            //     }
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
                action("Students Card")
                {
                    Image = Registered;



                    RunObject = Page 68837;
                    ApplicationArea = All;
                }
                action(Prog)
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
            group("Scholarship")
            {
                action("Official Rece")
                {
                    Caption = 'Acknowledgement Receipt';
                    RunObject = Page "FIN-Receipts List";
                    ApplicationArea = All;
                }
                action("Scholarships")
                {
                    RunObject = Page "ACA-Scholarships";
                    ApplicationArea = All;
                }
                action("Scholarship Batches")
                {
                    RunObject = Page "ACA-Scholarship Batches";
                    ApplicationArea = All;
                }

            }
            group("VC Clerance List")
            {

                action("Vc Cleared List")
                {
                    RunObject = Page "Vc Cleared Batch";
                    ApplicationArea = All;
                }
            }
            group("Bank Intergration")
            {
                action("Coop Bank Transactions")
                {
                    //Caption = 'Settlement Types';
                    RunObject = Page coopBankIntergration;
                    ApplicationArea = All;
                }
                action("NCBA Transactions")
                {
                    RunObject = page "NCBA Bank Transactions";
                    ApplicationArea = All;
                }
                action("Equity Bank Transactions")
                {
                    RunObject = page "Bank Intergration Transactions";
                    ApplicationArea = All;
                }
                action("Mpesa Trans")
                {
                    RunObject = Page "Confimed Mpesa Trans";
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
    }
}

