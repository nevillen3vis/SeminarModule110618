table 123456701 Seminar
{
    Caption = 'Caption';

    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            trigger OnValidate();
            begin
                if "No." <> xRec."No." THEN begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                END;
            end;
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
            trigger OnValidate();
            begin
               IF ("Search Name" = UpperCase(xRec.Name)) OR ("Search Name" = '') then
                 "Search Name" := Name; 
            end;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces=0:1;
        }
        field(40;"Minimum Participants";integer)
        {
            Caption = 'Minimum Participants';
        }        
        field(50;"Maximum Participants";integer)
        {
            Caption = 'Maximum Participants';
        } 
        field(60;"Search Name";Text[50])
        {
            Caption = 'Search Name';
        }  

        field(70;"Blocked";Boolean)
        {
            Caption = 'Blocked';
        } 

        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        } 

        field(90;"Comment";Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula=exist(Seminar) Where (tab)
        }      
        field(100;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
        }     
        field(110;"Gen. Prod. Posting Group";code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if (xrec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") THEN begin
                    IF GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup,"Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",GenProdPostingGroup."Def. VAT Prod. Posting Group");
                END;
            end;
        }  
        field(120;"VAT Prod. Posting Group";code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }  
        field(130;"No. Series";code[10])
        {
            Editable = false;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }                                                       
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }
    
    var
        SeminarSetup: Record "Seminar Setup";
        CommentLine:Record "Seminar Comment Line";
        Seminar: Record Seminar;
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        IF "No." = '' THEN begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
    end;

    trigger OnModify();
    begin
        "last date modified" := Today;
    end;

    trigger OnDelete();
    begin
      CommentLine.Reset;
      CommentLine.SetRange("Table Name",CommentLine."Table Name"::Seminar);
      CommentLine.SetRange("No.","No.");
      CommentLine.DeleteAll;        
    end;

    trigger OnRename();
    begin
        "last date modified" := Today;
    end;

procedure AssistEdit() : Boolean;
begin
    with Seminar DO begin
        Seminar:= rec;
        SeminarSetup.get;
        SeminarSetup.TestField("Seminar Nos.");
        If NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",xRec."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            rec := Seminar;
            exit(true);
        END;
    end;
end;
}