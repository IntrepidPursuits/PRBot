module Helpers
  module RequestStubs
    def valid_ship_message_stub
      stub_request(:post, "https://hooks.slack.com/services/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").to_return(status: 200, body:"", headers:{})
    end
  end
end
