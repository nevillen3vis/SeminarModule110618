table 123456704 "Seminar Comment Line"
{
    Caption = 'Seminar Comment Line';
    LookupPageId = "Seminar Comment List";
    DrillDownPageId = "Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionMembers = "Seminar", "Seminar Registration", "Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration",Posted Seminar Reg. Header';
            TableRelation = if("Table Name" = const (Seminar)) Seminar else IF("Table Name" = const ("Seminar Registration")) "Seminar Registration Header";
        }
        field(20; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(30; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if("Table Name" = const (Seminar)) Seminar;
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(50; Date; Date)
        {
            Caption = 'Date';
        }
        field(60; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(70; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

    procedure SetupNewLine();
    var
        SeminarCommentLine: Record "Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name", "Table Name");
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        SeminarCommentLine.SetRange(Date, WorkDate);
        If SeminarCommentLine.IsEmpty then
            Date := WorkDate;
    end;
}