# .bashrc

# Super Commands
alias ll='ls -alh'
alias un='tar -zxvf'
alias diskspace="du -S | sort -n -r | more"

# Set up PATH variable
#PATH=$home_dir/scripts:$PATH
export PATH=$home_dir/scripts:$PATH

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

source /wayfair/pkg/yoda/repo/yoda_completion
