# frozen_string_literal: true
require "tempfile"

module Gmortar
  class ListCommand < Clamp::Command
    parameter "PROJECT", "gcloud project"
    parameter "GKE_REGION", "GKE Region"
    parameter "GKE_NAME", "GKE Name"

    option "--debug", :flag, "debug", default: false

    def execute
      variables = [
        [:gke_region, gke_region],
        [:gke_name, gke_name],
      ]

      Gmortar.run project, "list.yaml", variables: variables, debug: debug?
    end
  end
end
