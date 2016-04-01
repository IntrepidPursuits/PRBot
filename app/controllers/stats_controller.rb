class StatsController < ApplicationController
  def index
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    team = Team.find_by(slack_team_id: params[:team_id])
    pull_requests = PullRequest.includes(:user, :approver).where(channel:channel, team: team)

    users = team.users
    this_week = 0.week.ago.monday.midnight..-1.weeks.ago.monday.midnight

    requests_this_week = pull_requests.where(created_at: this_week).count
    approves_this_week = pull_requests.where(approved_at: this_week).count

    since_inception =  (-1.days.ago.midnight..team.created_at.midnight)
    day_since_inception = (-1.days.ago.midnight - team.created_at.midnight)/(60*60*24)

    requests_per_week = pull_requests.where(created_at: since_inception).count/day_since_inception
    approves_per_week = pull_requests.where(approved_at: since_inception).count/day_since_inception


    most_submits = []
    most_approves = []
    most_submits_week = []
    most_approves_week = []

    users.each do |user|
        submit_prs = pull_requests.where(user: user)
        approve_prs = pull_requests.where(approver: user)
        submit_prs_week = pull_requests.where(user: user,
                                            created_at: this_week)
        approve_prs_week = pull_requests.where(approver: user,
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

    stats_text = ''
    if requests_this_week && requests_per_week
        stats_text << "*Pull Request Submission Volume:*\nThis Week: *#{requests_this_week} this week*\nAverage: #{'%.2f' % requests_per_week} per week\n\n"
    end

    if approves_this_week && approves_per_week
        stats_text << "*Pull Request Approval Volume:*\nThis Week: *#{approves_this_week} this week*\nAverage: #{'%.2f' % approves_per_week} per week\n\n"
    end

    if most_submits_week.present? && most_submits.present?
        stats_text << "*Most Individual Submissions:*\nThis Week: *#{most_submits_week[0].user.name}* with *@#{most_submits_week.count}*\nAll Time: #{most_submits[0].user.name} with #{most_submits.count}\n        \n"
    end
    if most_approves_week.present? && most_approves.present?
        stats_text << "*Most Individual Reviews:*\nThis Week: *#{most_approves_week[0].user.name}* with *@#{most_approves_week.count}*\nAll Time: #{most_approves[0].user.name} with #{most_approves.count}\n"
    end
    render text: stats_text
  end
end
