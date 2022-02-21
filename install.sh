# setup_repo <repo_name, target_path>
function setup_repo {
  local github_base="git@github.com:krmckone"
  readonly repo_name=${1:?"repo_name must be specified."}
  readonly target_path=${2:?"target_path must be specified."}
  if [ ! -d $target_path ]
  then
      echo "$target_path does not exist. Cloning $repo_name"
      git clone $github_base/$repo_name.git $target_path
  fi
  git -C $target_path checkout main --quiet && git -C $target_path fetch --quiet
  if git -C $target_path status -uno | grep "Your branch is behind 'origin/main'" 1> /dev/null
  then
    git -C $target_path pull --quiet
  fi
}

DOTFILES_REPO="$HOME/.dotfiles"

setup_repo "dotfiles" $DOTFILES_REPO

dotFiles=(
  "vimrc"
  "zshrc"
  "tmux.conf"
  "gitconfig"
)

for dotFile in ${dotFiles[@]}
do
  # Backup existing dotfile if it exists and is not a symlink
  [[ -f $HOME/.$dotFile ]] && [ ! -L $HOME/.$dotFile ] && mv $HOME/.$dotFile $HOME/.$dotFile.bak
  ln -sf $DOTFILES_REPO/.$dotFile $HOME/.$dotFile
done
