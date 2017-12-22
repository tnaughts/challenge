require './lib/services/pivotal/requestor'

module Services
  module Projects
    module Configuration

      def self.process
        Services::Pivotal::Requestor.new('projects').process.each do |p|
          unless Project.find_by(ppid: p["id"], name: p["name"])
            Project.create(ppid: p["id"], name: p["name"])
          end
        end
      end

    end
  end
end
