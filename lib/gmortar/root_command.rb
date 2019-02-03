# frozen_string_literal: true

module Gmortar
  class RootCommand < Clamp::Command
    banner "💥 gmortar #{Gmortar::VERSION}"

    option ['-v', '--version'], :flag, "Show version information" do
      puts Gmortar::VERSION
      exit 0
    end

    subcommand ["fire"], "fire", FireCommand
    subcommand ["yank"], "yank", YankCommand
    subcommand ["list"], "list", ListCommand
    subcommand ["describe"], "describe", DescribeCommand

    def self.run
      super
    rescue StandardError => exc
      warn exc.message
      warn exc.backtrace.join("\n")
    end
  end
end
