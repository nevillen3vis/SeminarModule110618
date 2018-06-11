page 123456702 "Seminar List"
{
    PageType = List;
    SourceTable = Seminar;
    Caption = 'Seminar List';
    Editable = false;
    CardPageId = 123456701;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    
                }
                field(Name;Name)
                {

                }
                field("Seminar Duration";"Seminar Duration")
                {

                }
                field("Seminar Price";"Seminar Price")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {
                    
                }
                field("Maximum Participants";"Maximum Participants")
                {

                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links";Links)
            {

            }
            systempart("Notes";Notes)
            {
                
            }
        }  
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    RunObject=page "Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar),"No."=Field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
            }
        }
    }
}