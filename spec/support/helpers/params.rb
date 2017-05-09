module Helpers
  module Params
    def create_pull_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/pr',
        text: 'message pr to solve a rubix cude https://github.com/IntrepidPursuits/follow-app-server/pull/125',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def create_bitbucket_pull_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/pr',
        text: 'message pr to solve a rubix cude https://bitbucket.org/mechio_inc/ecommerce/pull-requests/125',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def create_ship_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/ship',
        text: 'hey @Steve you can /125',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def invalid_user_create_ship_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/ship',
        text: 'hey @Stev you can /125',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def invalid_number_create_ship_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/ship',
        text: 'hey @Steve you can /12',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def invalid_matching_create_ship_request_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/ship',
        text: 'hey @Steve you can /125',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end

    def todays_ships_params
      { token: 'RyPgoRCq4HvWQX1b37l6ivRQ',
        team_id: 'T0001',
        team_domain: 'example',
        channel_id: 'C2147483705',
        channel_name: 'test',
        user_id: 'U2147483697',
        user_name: 'Steve',
        command: '/ships_today',
        text: '',
        response_url: 'https://hooks.slack.com/commands/1234/5678' }
    end
  end
end
