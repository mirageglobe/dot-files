# dot-files spec

technical blueprint for the repo. the user manual is [README.md](README.md); agent rules are in [AGENTS.md](AGENTS.md).

## architecture

a flat repo of config files plus one `Makefile` that copies them into `$HOME`. there is no build step and no runtime; the files are the product.

| path pattern | meaning                                      | how it lands                                 |
| :----------- | :------------------------------------------- | :------------------------------------------- |
| `dot.*`      | a config meant for `$HOME` (`dot.tmux.conf`) | copied by a `make setup-*` target            |
| `tpl.<os>.*` | a shell snippet or template for a given os   | sourced from the user's shell config         |
| `Brewfile`   | homebrew bundle for macos dependencies       | `make setup-brew`                            |
| `Makefile`   | task runner: setup, lint, scan               | `make help` lists every target               |
| `skills/`    | agent skills kept with the dotfiles          | read by agent tooling, not installed by make |
| `.github/`   | the security-scan workflow                   | runs on github, not on the user's machine    |

`tpl.public.completion.git.dot.bash` is vendored git completion; the lint step excludes it.

## make targets

| target         | does                                                                   |
| :------------- | :--------------------------------------------------------------------- |
| `help`         | list targets (the default goal)                                        |
| `setup-all`    | run the primary setups: git, vim, tmux, starship                       |
| `setup-<tool>` | one tool: alacritty, completion, git, ranger, starship, tmux, vim, coc |
| `lint`         | shellcheck over the authored snippets, report-only                     |
| `test`         | runs `lint`; the only check in the repo                                |
| `scan`         | trivy (vulnerabilities, secrets, misconfig) and bearer (sast)          |

## decisions

- **copy, do not symlink.** `copy_safe` asks before overwriting an existing file, so bootstrapping a machine never silently replaces a hand-edited config.
- **make as the interface.** one `Makefile` with a menu, no install script, so the steps are readable and each runs alone.
- **lint is report-only.** shellcheck findings print but do not fail `make test`, because the snippets target several shells and some findings are intentional.
- **public by design.** nothing secret lives here; the security scan exists to keep it that way.

## complexity score

| dimension | score | notes                                         |
| :-------- | :---- | :-------------------------------------------- |
| overall   | 1 / 5 | config files and one makefile, no code to run |

## roadmap

### near term

- [ ] `[make]` make `lint` fail on real findings once the known noise is cleaned [easy]

### ideas

- [ ] `[make]` a `make verify` that checks each copied config matches the repo copy [medium]
