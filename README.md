# Dakera AI Homebrew Tap

Homebrew formulae for the Dakera command-line tools. The Dakera server itself is not packaged here; it ships as a container image, `ghcr.io/dakera-ai/dakera` (see [dakera-deploy](https://github.com/dakera-ai/dakera-deploy)).

```bash
brew tap dakera-ai/tap
brew install dk
brew install dakera-mcp
```

## Available formulae

| Formula | Description | Updated by |
|---------|-------------|------------|
| `dk` | Dakera CLI: manage agent memories, sessions, and vector search from the terminal | cargo-dist, pushed by the `Release` workflow of [dakera-cli](https://github.com/dakera-ai/dakera-cli) on each release tag |
| `dakera-mcp` | Dakera MCP server for Claude, Cursor and Windsurf | The `Update Homebrew Formula` workflow of [dakera-mcp](https://github.com/dakera-ai/dakera-mcp), which computes the SHA256s from the release tarballs after each release |

Formulae are not edited by hand: a release of the tool regenerates its formula (version, URLs and checksums), so a version bump here always follows a dakera-cli or dakera-mcp release.

## Server compatibility

| Tool | Version in this tap | Dakera server |
|------|---------------------|---------------|
| `dk` | 0.8.0 | v0.12.0 and v0.11.108; the v0.12 commands (`dk capabilities`, `dk attachment`, `--lang`, ...) need v0.12.0, see the [dk 0.8.0 release](https://github.com/dakera-ai/dakera-cli/releases/tag/v0.8.0). 0.7.x works with v0.11.108 |
| `dakera-mcp` | see `Formula/dakera-mcp.rb` | Support for v0.12.0 arrives with dakera-mcp 0.11.0 ([dakera-mcp#155](https://github.com/dakera-ai/dakera-mcp/pull/155)); works with v0.11.108 and v0.12.0 |

Run `brew upgrade dk dakera-mcp` after those releases are published.

## Platforms

- `dk`: macOS (Apple Silicon and Intel), Linux x86_64
- `dakera-mcp`: macOS (Apple Silicon and Intel), Linux x86_64

## Links

- CLI repo: https://github.com/dakera-ai/dakera-cli
- MCP server: https://github.com/dakera-ai/dakera-mcp
- Documentation: https://dakera.ai/docs
- Dakera on GitHub: https://github.com/Dakera-AI
