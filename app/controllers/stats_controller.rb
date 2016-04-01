class StatsController < ApplicationController
  def index
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    team = Team.find_by(slack_team_id: params[:team_id])
    pull_requests = PullRequest.includes(:user, :approver).where(channel:channel, team: team)

    users = team.users
    this_week = 0.week.ago.monday.midnight..-1.weeks.ago.monday.midnight


    requests_this_week = pull_requests.where(created_at: this_week).count

    requests_per_week = pull_requests.count/((-1.days.ago.midnight - team.created_at.midnight)/(60*60*24))


    most_submits = []
    most_approves = []
    most_submits_week = []
    most_approves_week = []

    users.each do |user|
        submit_prs = PullRequest.where(user: user, channel: channel)
        approve_prs = PullRequest.where(approver: user, channel: channel)
        submit_prs_week = PullRequest.where(user: user,
                                            channel: channel,
                                            created_at: this_week)
        approve_prs_week = PullRequest.where(approver: user,
                                             channel: channel,
                                             created_at: this_week)
        if submit_prs.count > most_submits.count
            most_submits = submit_prs
        end
        if approve_prs.count > most_approves.count
            most_approves = approve_prs
        end
        if submit_prs_week.count > most_submits_week.count
            most_submits_week = submit_prs_week
        end
        if approve_prs_week.count > most_approves_week.count
            most_approves_week = approve_prs_week
        end
    end

    stats_text = "*PRBot Statistics*:\n"
    if requests_this_week && requests_per_week
        stats_text << "Pull Request Volume:\nThis Week: *#{requests_this_week} this week*\nAverage: #{'%.2f' % requests_per_week} per week\n\n"
    end

    if most_submits_week.present? && most_submits.present?
        stats_text << "Most Individual Submissions:\nThis Week: *#{most_submits_week[0].user.name}* with *#{most_submits_week.count}\nAll Time: #{most_submits[0].user.name} with #{most_submits.count}\n        \n"
    end
    if most_approves_week.present? && most_approves.present?
        stats_text << "Most Individual Reviews:\nThis Week: *#{most_approves_week[0].user.name}* with *#{most_approves_week.count}*\nAll Time: #{most_approves[0].user.name} with #{most_approves.count}\n"
    end
    render text: stats_text
  end
end
