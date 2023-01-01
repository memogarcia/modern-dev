# Pre-commit hook

```bash
#!/usr/bin/env bash

set -eo pipefail

CHANGED_FILES=$(git diff --name-only --cached --diff-filter=ACMR)
# Get only changed files that match our file suffix pattern
get_pattern_files() {
    pattern=$(echo "$*" | sed "s/ /\$\\\|/g")
    echo "$CHANGED_FILES" | { grep "$pattern$" || true; }
}
# Get all changed python files
PY_FILES=$(get_pattern_files .py)

if [[ -n "$PY_FILES" ]]
then
    # Run black against changed python files for this commit
    poetry run black --check $PY_FILES
    echo "black passes all altered python sources."
    # Run flake8 against changed python files for this commit
    poetry run flake8 $PY_FILES
    echo "flake8 passed!"
fi
```