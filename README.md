# gmortar

(Optionally) use https://www.github.com/matti/gbuild to build your image

    gbuild build gcr.io/project/name

Then

    gmortar fire      gcloud_project europe-north1 gke_name k8smanifests shotname \
        --var some=value --var another=value

    gmortar list     gcloud_project europe-north1 gke_name
    gmortar describe gcloud_project europe-north1 gke_name shotname
    gmortar yank     gcloud_project europe-north1 gke_name shotname


## install

See latest release https://github.com/matti/gmortar/releases

Linux binary:

    wget https://github.com/matti/gmortar/releases/download/v0.3.0/gmortar-linux-amd64-v0.3.0
    chmod +x gmortar-linux-amd64-v0.3.0

Mac binary:

    https://github.com/matti/gmortar/releases/download/v0.3.0/gmortar-darwin-amd64-v0.3.0
    chmod +x gmortar-darwin-amd64-v0.3.0
    
