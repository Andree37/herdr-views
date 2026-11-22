# herdr-views

A [herdr](https://herdr.dev) plugin with fzf views over your agents:

- **Agents**: travel to any agent, with blocked and done ones first.
- **Tree**: spaces > tabs > agents as a foldable tree. `j`/`k` move, `h`/`l` fold and unfold, `space`
  toggles, `enter` travels to the agent, tab or space. A folded branch shows its most urgent status and
  counts; folds are remembered.
- **PRs**: your GitHub pull requests.
- **Links**: the links the focused agent mentioned.

- **Travel keys**: `back` and `forward` retrace the panes you focused, across tabs and spaces, like a
  browser. `needs-you` goes to the agent at the top of the "needs you" queue (blocked first, then done);
  press it again to move to the next one.

A startup loop keeps the spaces tree and the attention queue annotated in the sidebar, and records the
panes you focus for `back` and `forward` (in `~/.cache/herdr-views/focus.json`).

## Install

```sh
herdr plugin install Andree37/herdr-views
```

Bind the actions (`local.herdr-views.open-agents`, `open-tree`, `open-prs`, `open-refs`, `back`, `forward`,
`needs-you`) in
`~/.config/herdr/config.toml` with `type = "plugin_action"`. Needs `fzf`, `jq` and `gh`.
