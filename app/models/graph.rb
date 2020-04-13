class Graph


    def self.monthly_pie(user)
        subs = user.subscriptions
        @data = []
        @labels = []
        subs.each do |sub| 
            @labels << sub.name
            if sub.frequency == "Monthly"
                @data << sub.amount
            elsif sub.frequency == "Quarterly"
                @data << (sub.amount / 3 )
            elsif sub.frequency == "Annually"
                @data << (sub.amount / 12)
            end
        end

        Gchart.pie( 
            :size => '600x500',
            :title => 'Breakdown of Monthly Spending',
            :bg => 'efefefef',
            :labels => @labels,
            :data => @data 
        ) 
    end 



end 