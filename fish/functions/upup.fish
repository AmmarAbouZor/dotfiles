function upup --wraps='sudo dnf update' --description 'alias upup sudo dnf update'
  sudo dnf update $argv; 
end
