# gmortar

(Optionally) use https://www.github.com/matti/gbuild to build your image

    gbuild build gcr.io/project/name

Then

    gmortar fire      gcloud_project europe-north1 gke_name k8smanifests shotname \
        --var some=value --var another=value

    gmortar list     gcloud_project europe-north1 gke_name
    gmortar describe gcloud_project europe-north1 gke_name shotname
    gmortar yank     gcloud_project europe-north1 gke_name shotname
