# Repository "manager"

## Setup
```bash
gh repo list [ORGANIZATION] -L 1000 | awk ' { print $1 }' | sort > repositories.txt
```

## Usage

```bash
scripts/git_clone.sh
#... etc.
```
