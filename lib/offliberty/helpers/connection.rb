module Offliberty
  module Helpers
    class Connection
      attr_reader :form, :agent
      
      def initialize song_url
        @agent = agent
        @page = page
        @song_url = song_url
        @form = form
      end

      def agent
        agent = Mechanize.new
        agent.user_agent_alias = 'Mac Safari'

        return agent
      end

      def page
        @agent.get("http://offliberty.com")
      end

      def form
        form = @page.forms.fetch(0)
        form.action = "http://offliberty.com/off54.php"
        form.track = @song_url

        return form
      end

    end
  end
end
