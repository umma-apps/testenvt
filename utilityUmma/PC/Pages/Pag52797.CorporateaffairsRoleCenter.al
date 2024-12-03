// page 54417 "Corporate affairs Role Center"
// {
//     Caption = 'Corporate affairs Role Center';
//     PageType = RoleCenter;


//     layout
//     {
//         area(RoleCenter)
//         {
//             // part(Control18; "Headline RC Serv. Dispatcher")
//             // {
//             //     ApplicationArea = Basic, Suite;
//             // }
//             // part(Document; "CAQ Ques")
//             // {
//             //     ApplicationArea = all;
//             //     Caption = 'Navigate';
//             // }
//             part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
//             {
//                 AccessByPermission = TableData "Power BI User Configuration" = I;
//                 ApplicationArea = Basic, Suite;
//             }
//         }
//     }
//     actions
//     {
//         area(Sections)
//         {
//             // group(branding)
//             // {
//             //     action("CA-Branding Req. List")
//             //     {
//             //         Caption = 'Branding';
//             //         RunObject = page "CA-Branding Req. List";
//             //         ApplicationArea = all;
//             //     }
//             //     action("Approved Branding")
//             //     {
//             //         Caption = 'Approved Branding';
//             //         RunObject = page "CA-Branding Req. List-Posted";
//             //         ApplicationArea = all;
//             //     }
//             // }
//             // group(Complaints)
//             // {
//             //     Caption = 'Complaints';
//             //     Image = Alerts;
//             //     action(Grievances)
//             //     {
//             //         ApplicationArea = all;
//             //         Caption = 'Complaints List';
//             //         RunObject = Page "Complaints List";
//             //     }
//             //     action(Pending)
//             //     {
//             //         ApplicationArea = all;
//             //         Caption = 'Pending Complaints';
//             //         RunObject = Page "Complaints Pending";
//             //     }
//             //     action(ClosedCasesEnd)
//             //     {
//             //         ApplicationArea = all;
//             //         Caption = 'Closed Cases';
//             //         RunObject = Page "Complaints Closed";
//             //     }

//             // }
//             /*group("Complaints Management")
//             {
//                 action("Complaints Management List")
//                 {
//                     RunObject = page "Complait Affair List";
//                     ApplicationArea = All;
//                 }
//                 action("Chairman Complaints Management List")
//                 {
//                     RunObject = page "Complaint Chairman Assessment";
//                     ApplicationArea = All;
//                 }
//                 action(" Committiee Complaints Management List")
//                 {
//                     RunObject = page "Committee Complaint List";
//                     Caption = 'Committee Complaints Management List';
//                     ApplicationArea = All;
//                 }
//                 action("Division Complaints Management List")
//                 {
//                     RunObject = page "Divison Complaint List";
//                     Caption = 'Division/Centre Complaints Management List';
//                     ApplicationArea = All;
//                 }

//                 action("Meeting Complaints Management List")
//                 {
//                     RunObject = page "Complaint meeting List";
//                     Caption = 'Complaints Resolutiuon Meeting';
//                     ApplicationArea = All;
//                 }
//                 action("Director Complaints List")
//                 {
//                     RunObject = page "Director Compalint List";
//                     ApplicationArea = All;
//                 }
//                 action("BOD Complaints List")
//                 {
//                     RunObject = page "BOD Complaint List";
//                     ApplicationArea = All;
//                 }
//                 action("Resolved Complaints List")
//                 {
//                     RunObject = page "Resolved Complaints List";
//                     ApplicationArea = All;
//                 }

//             }*/
//             // group("Branding")
//             // {
//             //     Caption = 'Branding';
//             //     action("Branding List")
//             //     {
//             //         Caption = 'Branding Requisition';
//             //         Image = MovementWorksheet;
//             //         RunObject = Page "CA-Branding Req. List";
//             //         ApplicationArea = All;
//             //     }
//             //     action("Posted Branding List")
//             //     {
//             //         Caption = 'Posted Branding Requisitions';
//             //         Image = MovementWorksheet;
//             //         RunObject = Page "CA-Branding Req. List-Posted";
//             //         ApplicationArea = All;
//             //     }
//             // }
//             /*group("Branding & CSR")
//             {
//                 action("Reciept Of CSR/Branding")
//                 {
//                     RunObject = page "Receipt of CSR List";
//                     ApplicationArea = all;
//                 }
//                 action("Branding& CSR pending Approval")
//                 {
//                     RunObject = page "Branding& CSR pending Approval";
//                     ApplicationArea = all;
//                 }
//                 action("Approved Receipt CSR/Branding")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Approved CSR Reciepts";
//                 }
//             }*/
//             group("Development/Signing of Perf Contract")
//             {
//                 action("Corporate Affair Setup")
//                 {
//                     RunObject = page "Corparate Affairs Setup";
//                     ApplicationArea = All;
//                 }
//                 action("PC Indicators")
//                 {
//                     RunObject = page "PC Category list";
//                     ApplicationArea = All;
//                 }
//                 action("PC Matrix")
//                 {
//                     RunObject = page "PC Work Plan Setup";
//                     ApplicationArea = All;
//                     //caption='Annual Performance Contract';
//                 }
//                 action("PC Targets")
//                 {
//                     RunObject = page "PC SubCategories List";
//                     ApplicationArea = all;
//                 }

//                 action("Divisional PC")
//                 {
//                     RunObject = page "Department WorkPlan  List";
//                     ApplicationArea = All;
//                     //Caption = 'Annual Departmental PC';
//                 }
//                 action("Vetting By PC Secretariat")
//                 {
//                     ApplicationArea = All;
//                     //Caption = 'PC Secretariat';
//                     RunObject = Page "Vetting List ";
//                 }
//                 action("Divisional PC Approval")
//                 {
//                     ApplicationArea = All;
//                     //Caption = 'PC Secretariat';
//                     RunObject = Page "Work Plan Executive Committee";
//                 }
//                 // action(" Director's Approval")
//                 // {
//                 //     ApplicationArea = all;
//                 //     RunObject = page "Work Plan Consult Comimttee";
//                 // }
//                 action("Approved Divisional PC")
//                 {
//                     RunObject = page "Approved WorkPlan List";
//                     ApplicationArea = All;
//                 }
//                 action("Employee Performance Target List")
//                 {
//                     RunObject = page "Employee Perf Target List";
//                     ApplicationArea = All;
//                 }
//                 action("Employee Performance Target Pending Approval")
//                 {
//                     RunObject = page "Targets Pending Approvals";
//                     ApplicationArea = All;
//                 }
//                 action("Approved Performance Target List")
//                 {
//                     RunObject = page "Approved Employee Targets";
//                     ApplicationArea = All;
//                 }
//                 action("Appraisal List")
//                 {
//                     RunObject = page "Appraisal List";
//                     ApplicationArea = All;
//                 }//"PC Reports"
//                 action("PC Reports")
//                 {
//                     RunObject = page "PC Reports";
//                     ApplicationArea = All;
//                 }
//             }
//             /*group(Committee)
//             {
//                 action("Committee list")
//                 {
//                     RunObject = page "Committiees List";
//                     ApplicationArea = All;
//                 }
//                 action("Committee Member List")
//                 {
//                     RunObject = page "Committies Members List";
//                     ApplicationArea = All;
//                 }

//             }

//             group(Feedback)
//             {
//                 action("Feedback Register")
//                 {
//                     RunObject = page "Feedback List";
//                     ApplicationArea = All;
//                 }
//                 action("Closed Register")
//                 {
//                     RunObject = page "Closed Feedbacks";
//                     ApplicationArea = All;
//                 }*/
//             //"Closed Feedback"
//             // action("Closed Register")
//             // {
//             //     RunObject = page "Closed Feedbacks";
//             //     ApplicationArea = All;
//             // }
//         }
//         //         group("Internal Audit")
//         //         {
//         //             action("Internal Audit Schedule")
//         //             {
//         //                 RunObject = page "Internal Audit List";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("Audit Schedule pending Approval")
//         //             {
//         //                 RunObject = page "A.S Pending Approval";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("Approved Internal Audit Schedule")
//         //             {
//         //                 RunObject = page "Approved Internal Audit";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("Audit Preparation")
//         //             {
//         //                 RunObject = page "Audit Preparation List";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("Audit Reporting")
//         //             {
//         //                 //RunObject = Page "Audit Reporting";
//         //                 ApplicationArea = ALL;
//         //                 RunObject = page "Internal Audit Reporting list";
//         //             }//Reports submitted to Auditee
//         //             action("Audit Reports submitted to Auditee")
//         //             {
//         //                 //RunObject = Page "Audit Reporting";
//         //                 ApplicationArea = ALL;
//         //                 RunObject = page "Reports submitted to Auditee";
//         //             }
//         //             action("Corrective Action Request")
//         //             {
//         //                 RunObject = page "CAR List";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("CAR List submitted to the Auditor")
//         //             {
//         //                 RunObject = page "CAR submitted to the Auditor";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("CAP List submitted to the HISO")
//         //             {
//         //                 RunObject = page "Corrective Action Plan";
//         //                 ApplicationArea = all;
//         //             }
//         //             action("Completed CAR Forms")
//         //             {
//         //                 RunObject = page "Completed CAR Forms";
//         //                 ApplicationArea = all;
//         //             }


//         //             action("Approved Audit Reportings")
//         //             {
//         //                 RunObject = page "Approved Audit Reportings";
//         //                 ApplicationArea = all;
//         //             }


//         //         }
//         //     }
//         //     area(Processing)
//         //     {

//         //     }
//         //     area(Creation)
//         //     {
//         //         Group("Auditees")
//         //         {
//         //             action("Auditee Setup")
//         //             {
//         //                 RunObject = page "Auditee List";
//         //                 ApplicationArea = All;
//         //             }
//         //         }
//         //     }
//         //}
//     }
// }
