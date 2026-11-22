# herdr-views

A [herdr](https://herdr.dev) plugin with fzf views over your agents:

- **Agents**: travel to any agent, with blocked and done ones first.
- **PRs**: your GitHub pull requests.
- **Links**: the links the focused agent mentioned.

A startup loop keeps the spaces tree and the attention queue annotated in the sidebar.

## Install

```sh
herdr plugin install Andree37/herdr-views
```

Bind the actions (`local.herdr-views.open-agents`, `open-prs`, `open-refs`) in
`~/.config/herdr/config.toml` with `type = "plugin_action"`. Needs `fzf`, `jq` and `gh`.
