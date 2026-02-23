alias mensa='( OLDPWD=$(pwd); cd ~/Documents/Development/GitHub/mensa || exit; micromamba activate mensa; python3 mensa.py; micromamba deactivate; cd "$OLDPWD" )'
codex_search() {
  local prompt="$*"
  codex exec --model gpt-5.2 --cd ~/codex --skip-git-repo-check --json "$prompt" 2>/dev/null | jq -r 'select(.item.type == "agent_message") | .item.text // empty' | glow
}
alias '??=codex_search'
