GITROOT=$(git rev-parse --show-toplevel)
WORKFLOW_ROOT="$GITROOT/.github/workflows"

for template in $GITROOT/.github/workflow_templates/*
do
    base="$template/_base.yml"
    template_name=$(basename "$template")

    for profile in $template/profiles/*.yml
    do
        profile_name="${profile%.*}"
        profile_name=$(basename "$profile_name")

        workflow_path="$WORKFLOW_ROOT/$profile_name.$template_name.yml"

        cat "$profile" > "$workflow_path"
        cat "$base" >> "$workflow_path"
    done
done
