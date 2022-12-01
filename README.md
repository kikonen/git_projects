# Repository "manager"

## Setup
```bash
# get list of repositories
gh repo list [ORGANIZATION] -L 1000 | awk ' { print $1 }' | sort > repositories.txt

# as needed add ignores
cat xxx >ignore.txt
```

## Usage

```bash
scripts/git_clone.sh
#... etc.
```
