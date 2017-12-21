module Services
  module Stories
    module Configuration

      def self.process
        label = ENV['RELEASE_LABEL'] || '2.2017.1'

        Project.all.pluck(:ppid).each do |id|
          Services::Pivotal::Requestor.new("projects/#{id}/search?query=label%3A#{label}+AND+includedone%3Atrue").process["stories"]["stories"].each do |s|
            unless Story.find_by(psid: s["id"], name: s["name"])
              Story.create(
                psid: s["id"],
                name: s["name"],
                points: s["estimate"],
                status: s["current_state"],
                requested_by_id: User.find_by_poid(s["requested_by_id"]).id,
                url: s["url"],
                project_id: Project.find_by_ppid(s["project_id"]).id,
                deadline: s["deadline"],
                accepted_at: s["accepted_at"]
              )
              s["owner_ids"].each do |oid|
                AssignedProject.create(
                  project_id: Project.find_by_ppid(s["project_id"]).id,
                  user_id: User.find_by_poid(oid).id
                )
              end
            end

            s["labels"].each do |l|
              unless Label.find_by_plid(l["id"])
                story_label = Label.new(
                  plid: l["id"],
                  name: l["name"]
                )
                  story_label.project_id = Project.find_by_ppid(l["project_id"]).id if l["project_id"]
                  story_label.story_id = Story.find_by_psid(l["story_id"]).id if l["story_id"]
                  story_label.user_id = User.find_by_poid(l["user_id"]).id if l["user_id"]
                  story_label.save
              end
            end
          end
        end
      end

    end
  end
end
