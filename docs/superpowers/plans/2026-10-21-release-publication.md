# Release automation and publication

Approved user request: MIT licensing, GitHub Actions versioned ZIP builds, publication to Vintage Story Mod DB.

- Add MIT `LICENSE` for copyright 2026 h1w; include it in the ZIP. Referenced game assets remain Anego Studios property.
- Reuse `build.ps1`; derive ZIP name/version from `modinfo.json`. Keep game version and block IDs unchanged.
- Add `.github/workflows/release.yml`: build/validate on main pushes, pull requests, manual runs and `v*` tags. Fail mismatched version tags. Upload versioned build artifact. A separate tag-only job with contents-write permission publishes a GitHub Release using that artifact; normal builds are read-only.
- Validate packaging locally and workflow with actionlint; commit/push requested changes, tag current version, observe actual hosted Actions build and release.
- Use the user's authenticated Mod DB session. Create English description, MIT/source links and game/content classification; upload the verified ZIP with game compatibility 1.22.7 and publish. Verify the public page and downloadable release. No passwords, tokens or copied game assets in the repository.
