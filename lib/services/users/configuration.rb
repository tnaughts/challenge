require './lib/services/pivotal/requestor'

module Services
  module Users
    module Configuration

      def self.process
        Project.all.pluck(:ppid).each do |id|
          Services::Pivotal::Requestor.new("projects/#{id}/memberships").process.each do |user|
            unless User.find_by_poid(user["person"]["id"])
              User.create(
                poid: user["person"]["id"],
                initials: user["person"]["initials"],
                name: user["person"]["name"])
            end
          end
        end
      end

    end
  end
end
