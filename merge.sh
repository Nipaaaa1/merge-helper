merge() {
  if [ -z "$1" ]; then
    echo "Usage: merge <branch-name> [--push]"
    return 1
  fi

  target_branch="$1"
  auto_push=false

  if [ "$2" = "--push" ]; then
    auto_push=true
  fi

  current_branch=$(git symbolic-ref --short HEAD)

  if ! git show-ref --verify --quiet "refs/heads/$target_branch"; then
    echo "Error: Branch '$target_branch' tidak ditemukan secara lokal."
    return 1
  fi

  if [ "$current_branch" = "$target_branch" ]; then
    echo "Error: Kamu gak bisa merge branch ke dirinya sendiri."
    return 1
  fi

  echo "Merging branch '$target_branch' ke '$current_branch'..."

  git merge "$target_branch"
  if [ $? -eq 0 ]; then
    echo "Merge berhasil!"

    git branch -d "$target_branch"

    if git ls-remote --exit-code --heads origin "$target_branch" >/dev/null 2>&1; then
      git push origin --delete "$target_branch"
    fi

    if [ "$auto_push" = true ]; then
      echo "Push otomatis aktif. Push ke remote..."
      git push origin "$current_branch"
    else
      read -p "Mau push '$current_branch' ke remote? (y/n): " confirm
      if [ "$confirm" = "y" ]; then
        git push origin "$current_branch"
      else
        echo "Push dibatalkan."
      fi
    fi

  else
    echo "Merge gagal. Branch tidak dihapus."
  fi
}
