require "clamp"
if Clamp.respond_to? :allow_options_after_parameters
  Clamp.allow_options_after_parameters = true
end

require "kommando"
require "erb"
require "securerandom"

module Gmortar
  def self.run(project, template, source:nil, variables:[], name: nil, debug:)
    t = Template.new template
    for pair in variables
      t.set pair.first, pair.last
    end
    t.set :name, name if name

    gcloud_config = Tempfile.new
    File.write gcloud_config.path, t.result

    puts t.result if debug

    log_bucket = "gs://#{project}_cloudbuild/gmortar-logs/#{SecureRandom.uuid}"
    source_bucket = "gs://#{project}_cloudbuild/gmortar-sources/#{SecureRandom.uuid}"

    cmd = ["gcloud","builds","submit"]
    if source
      cmd << source
      cmd += ["--gcs-source-staging-dir", source_bucket]
    else
      cmd << "--no-source"
    end
    cmd += ["--gcs-log-dir", log_bucket]

    cmd += ["--config", gcloud_config.path]
    cmd += ["--project", project]

    puts cmd.join(" ") if debug
    k = Kommando.new cmd.join(" "), output: true
    k.run

    waits = []
    if source
      puts "removing source from #{source_bucket}"
      waits << (Kommando.run_async "gsutil rm -r #{source_bucket}")
    end

    puts "removing logs from #{log_bucket}"
    waits << (Kommando.run_async "gsutil rm -r #{log_bucket}")
    waits.each { |k| k.wait }
  end
end

require_relative "gmortar/version"
require_relative "gmortar/template"

require_relative "gmortar/fire_command"
require_relative "gmortar/yank_command"
require_relative "gmortar/list_command"
require_relative "gmortar/describe_command"

require_relative "gmortar/root_command"
