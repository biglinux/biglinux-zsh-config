# Definição de Cores
# Tabela de cores: https://misc.flogisoft.com/_media/bash/colors_format/256_colors_fg.png

# Cores degrade
RED001='\e[38;5;1m'		    # Vermelho 1
RED009='\e[38;5;9m'		    # Vermelho 9
CYA122='\e[38;5;122m'		# Ciano 122
CYA044='\e[38;5;44m'		# Ciano 44
ROX063='\e[38;5;63m'		# Roxo 63
ROX027='\e[38;5;27m'		# Roxo 27
GRE046='\e[38;5;46m'		# Verde 46
GRY247='\e[38;5;247m'		# Cinza 247
LAR208='\e[38;5;208m'		# Laranja 208
LAR214='\e[38;5;214m'		# Laranja 214
AMA226='\e[38;5;226m'		# Amarelo 226
BLU039='\e[38;5;44m'		# Azul 39
MAR094='\e[38;5;94m'		# Marrom 94
MAR136='\e[38;5;136m'		# Marrom 136

# Cores chapadas
CIN='\e[30;1m'			# Cinza
RED='\e[31;1m'			# Vermelho
GRE='\e[32;1m'			# Verde
YEL='\e[33;1m'			# Amarelo
BLU='\e[34;1m'			# Azul
ROS='\e[35;1m'			# Rosa
CYA='\e[36;1m'			# Ciano
NEG='\e[37;1m'			# Negrito
CUI='\e[40;31;5m'		# Vermelho pisacando, aviso!
STD='\e[m'			    # Fechamento de cor

command_not_found_handler() {

  local pkgs cmd="$1"

  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    printf "${BLU}*${STD} ${YEL}"%s" The application${STD} ${GRE}%s${STD} ${YEL}"%s" is not installed. It may be found in the following packages:${STD}\n" "$cmd"
    printf "${GRE}*${STD} ${NEG}%s${STD}\n" $pkgs[@]
    setopt shwordsplit
    pkg_array=($pkgs[@])
    pkgname="${${(@s:/:)pkg_array}[2]}"
    printf "${BLU}*${STD} ${NEG}Do you want to Install package${STD} ${GRE}%s${STD}? (${GRE}Y${STD}es/${RED001}N${STD}o)" $pkgname
    if read -q "choice? "; then
    		echo
    		echo "Executing command: pamac install $pkgname"
            pamac install $pkgname
    else
    		echo " "
    fi
  else
    printf "${NEG}Command not found:${STD} ${CYA}%s${STD}\n" "$cmd"
  fi 1>&2

  return 127
}
