# Repository "manager"

## Setup
```bash
gh repo list <ORGANIZATION> -L 1000 | awk ' { print $1 }' > repositories.txt
```

## Usage

```bash
scripts/git_clone.sh
#... etc.
```
