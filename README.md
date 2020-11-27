# build_and_deploy
Our GitHub Action to Build &amp; Deploy our Docker applications


# Developing

## Preface
This Repo contains templates for our various Github Actions build scripts.
The templates that other repos will use as their workflows are found in the `workflows/` directory.

This repo also takes the responsibility of _updating_ any project that uses these workflow templates.
When a new tag is pushed, the update actions in `.github/workflows/` will run, automatically making a PR on dependent repositories.


### Update Templates & Profiles
The scripts that will automatically make a PR on other repositories is basically the same for every project.
To keep things sane and reduce developer workload, the _actual_ actions are auto-generated, too!

If a developer desires to make a change or addition to the update actions should start in `update/`.
In this template directory, you'll find a `_base.yml` - that's the meat of the action, it's repeated for all profiles.
For each run of these actions, there will be minor but important distinctions (repo name, etc.), that's where "Profiles" come in.
In `update/workflows/*` there are a collection of YAML files that typically define environment variables to be used in the `_base.yml` template.

When running the generator, (`./bin/reconcile_templates.sh`) the profiles will be put at the top of each generated file, followed by the contents of the `_base.yml`.
