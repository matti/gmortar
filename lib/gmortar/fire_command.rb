# frozen_string_literal: true
require "tempfile"

module Gmortar
  class FireCommand < Clamp::Command
    parameter "PROJECT", "gcloud project"
    parameter "GKE_REGION", "GKE Region"
    parameter "GKE_NAME", "GKE Name"
    parameter "SOURCE", "source"
    parameter "NAME", "shot name"

    option "--var", "VAR", "mortar variable, can be given multiple times", multivalued: true
    option "--debug", :flag, "debug", default: false

    def execute
      variables = [
        [:gke_region, gke_region],
        [:gke_name, gke_name],
        [:variables, var_list],
        [:shot, name],
      ]

      Gmortar.run project, "fire.yaml", source: source, variables: variables, name: name, debug: debug?
    end
  end
end
