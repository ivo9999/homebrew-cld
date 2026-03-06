# Release Workflow

When you make changes:

1. Edit `cld` in the repo, commit, push
2. Tag a new version: `git tag v0.2.0 && git push --tags`
3. Get the new SHA: `curl -sL https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.0.tar.gz | shasum -a 256`
4. Update `Formula/cld.rb` in this repo with the new version and SHA, push

Users then just run `brew upgrade cld`.
