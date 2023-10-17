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
  "p10k.zsh"
  "spacemacs"
)

for dotFile in ${dotFiles[@]}
do
  # Backup existing dotfile if it exists and is not a symlink
  [[ -f $HOME/.$dotFile ]] && [ ! -L $HOME/.$dotFile ] && mv $HOME/.$dotFile $HOME/.$dotFile.bak
  ln -sf $DOTFILES_REPO/.$dotFile $HOME/.$dotFile
done

# Another version, originally in .zshrc. Removed to help with startup performance
# setup_repo <repo_name, target_path>
# function setup_repo {
#   local github_base="https://github.com/krmckone"
#   readonly repo_name=${1:?"repo_name must be specified."}
#   readonly target_path=${2:?"target_path must be specified."}
#   readonly quiet=${3:-true}
#   args=()
#   (( quiet == true )) && args+=( '--quiet' )
#   if [ ! -d $target_path ]
#   then
#       git clone $github_base/$repo_name.git $target_path "${args[@]}"
#   fi
#   git -C $target_path checkout main "${args[@]}" && git -C $target_path fetch "${args[@]}"
#   if git -C $target_path status -uno | grep "Your branch is behind 'origin/main'" 1> /dev/null
#   then
#     git -C $target_path pull "${args[@]}"
#   fi
# }
# 
# HELPERS_DIR="$HOME/.krm-helpers"
# setup_repo "krm-helpers" $HELPERS_DIR
# for file in $HELPERS_DIR/*; do
#   source "$file"
# done
# 
# NVIM_CONFIG_DIR="$HOME/.nvim-config"
# setup_repo "nvim-config" $NVIM_CONFIG_DIR
# # Setup symbolic link to my nvim config repo if it doesn't exist
# ln -fs ~/.nvim-config ~/.config/nvim
# 
# # function for pulling updates to .dotfiles
# function dotfiles_update {
#   echo "Pulling latest commits on main for dotfiles"
#   setup_repo "dotfiles" "$HOME/.dotfiles" false
#   # Restart the zsh process. This is favored over simply sourcing
#   # the .zshrc file. https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-reload-the-zshrc-file
#   exec zsh
# }
