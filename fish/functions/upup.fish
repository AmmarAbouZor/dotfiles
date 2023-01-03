function upup --wraps='sudo dnf update' --description 'alias upup sudo dnf update'
  echo ========== dnf ==========;
  sudo dnf update $argv; 
  echo ======== flatpak ========;
  flatpak update;
end
