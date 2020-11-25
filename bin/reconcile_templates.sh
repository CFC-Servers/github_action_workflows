#!/bin/bash

GITROOT=$(git rev-parse --show-toplevel)
WORKFLOW_ROOT="$GITROOT/.github/workflows"

echo "Cleaning workflows"
rm "$WORKFLOW_ROOT"/*.yml

for template in $GITROOT/.github/workflow_templates/*
do
    base="$template/_base.yml"
    template_name=$(basename "$template")

    for profile in $template/profiles/*.yml
    do
        profile_name="${profile%.*}"
        profile_name=$(basename "$profile_name")

        echo "Building update workflow for $profile_name"

        workflow_path="$WORKFLOW_ROOT/$profile_name.$template_name.yml"

        cat "$profile" > "$workflow_path"
        cat "$base" >> "$workflow_path"
    done
done
