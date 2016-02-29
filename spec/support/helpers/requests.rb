module Helpers
  module Requests
    def body
      response.body
    end

    def parsed_json
      @parsed_json ||= parse_json(body)
    end

    def json_value_at_path(path = '')
      parse_json(body, path)
    end

    def puts_json
      puts normalize_json(body)
    end

    def errors
      parsed_json['errors'].to_s if parsed_json['errors']
    end

    def token(user = nil)
      if user
        user.authentication_token
      else
        create(:user).authentication_token
      end
    end

    def accept_header(api_version = 1)
      "application/vnd.pr.bot; version=#{api_version}"
    end

    def accept_headers
      { 'Accept' => accept_header,
        'Content-Type' => 'application/json' }
    end

    def authorization_header(user = nil)
      "Token token=#{token(user)}"
    end

    def authorization_headers(user = nil)
      accept_headers.merge('Authorization' => authorization_header(user))
    end
  end
end
