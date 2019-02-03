# frozen_string_literal: true
require "tempfile"

module Gmortar
  class YankCommand < Clamp::Command
    parameter "PROJECT", "gcloud project"
    parameter "GKE_REGION", "GKE Region"
    parameter "GKE_NAME", "GKE Name"
    parameter "NAME", "shot name"

    option "--debug", :flag, "debug", default: false

    def execute
      variables = [
        [:gke_region, gke_region],
        [:gke_name, gke_name],
      ]
      Gmortar.run project, "yank.yaml", variables: variables, name: name, debug: debug?
    end
  end
end
