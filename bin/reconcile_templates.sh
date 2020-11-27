#!/bin/bash

GITROOT=$(git rev-parse --show-toplevel)
WORKFLOW_ROOT="$GITROOT"/.github/workflows

echo "Cleaning workflows"
rm "$WORKFLOW_ROOT"/*.yml

update="$GITROOT"/update
base="$update"/_base.yml

for workflow in "$update"/workflows/*
do
    workflow_name=$(basename "$workflow")
    echo Processing update flows for "$workflow_name"

    for profile in "$workflow"/*.yml
    do
        profile_name="${profile%.*}"
        profile_name=$(basename "$profile_name")
        echo Building update workflow for: "$profile_name"

        workflow_path="$WORKFLOW_ROOT"/"$profile_name"."$workflow_name".update.yml

        cat "$profile" > "$workflow_path"
        cat "$base" >> "$workflow_path"
    done

    echo ""
done
