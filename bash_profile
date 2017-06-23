# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Make bash check its window size after a process completes
shopt -s checkwinsize

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

get_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# GIT ALIASES
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gl='git pull origin $(get_git_branch)'
alias glm='git pull origin master'
alias gp='git push origin $(get_git_branch)'
alias gpm='git push origin master'
alias gst='git status'
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias gdc='git svn dcommit'
alias subl="open -a 'Sublime Text 2' $1"

# MORE ALIASES
alias ..="cd .."
alias la="ls -lah"
alias pa="ps aux"
alias check-nodes="sh ~/Development/wine/devops-wine/scripts/health-check/check.sh"

#PostgreSQL

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'
alias pg_restart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log restart'


# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37'
alias grep='grep --color=auto' # Always highlight grep search term

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# Everything else is green...
# 0 - Normal
# 1 - Bold
# 2 - 
function prompt {
	local BLACK="\[\033[0;30m\]"
	local RED="\[\033[0;31m\]"
	local GREEN="\[\033[0;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local BLUE="\[\033[0;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local CYAN="\[\033[0;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
export PS1="${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}\$(parse_git_branch) ${YELLOW}\n$ \[\e[m\]\[\e[m\]"
}
prompt

# WELCOME MESSAGE
echo -e ""
echo -ne "Today is "; date
echo -e ""; cal;
echo -ne "Up time: ";uptime | awk /'up/ {print $3,$4}'
echo "";



# MacPorts Installer addition on 2009-09-10_at_18:53:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

change_maven() {
	case $1 in
		2)
			export MAVEN_HOME=/Users/makoto/Development/apache-maven-3.3.9
			;;
		3)
			export MAVEN_HOME=/Users/makoto/Development/apache-maven-3.0.5
			;;
		*)
			echo "Use 3 or 2"
			;;
	esac
	export M2_HOME=$MAVEN_HOME
	export M2=$M2_HOME/bin
	export PATH=$M2:$PATH
}

## Incluindi variável de ambiente para dizer qual a versão dos projetos estendidos do EP6.12
launchctl setenv EXTVERSION 1.12

### Incluindo o Java home e o ant home

export ACTIVEMQ_HOME=/Users/makoto/Development/apache-activemq-5.11.1/
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export ANT_HOME=/Users/makoto/Development/apache-ant-1.7.1
export DB_ENV=dev
export ORACLE_CLIENT=/Users/makoto/Development/instantclient_11_2

export DYLD_LIBRARY_PATH="$HOME/Development/instantclient_11_2/"
export SQLPATH="$HOME/Development/instantclient_11_2/"
export TNS_ADMIN="$HOME/Development/instantclient_11_2/network/admin"
export DB_ENV=dev
#export DB_ENV=prod
#export DB_ENV=homolog

change_maven 3

export TOMCAT_HOME=/Users/makoto/Development/apache-tomcat-7.0.19
export MYSQL_HOME=/usr/local/mysql

PATH=/usr/local/git/bin:$PATH

export PATH=$MYSQL_HOME/bin:$ANT_HOME/bin:$M2:$ACTIVEMQ_HOME/bin:$DYLD_LIBRARY_PATH:$PATH

#export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

#export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true -XX:CompileCommand=exclude,org/apache/velocity/runtime/directive/Foreach,render"
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true -XX:CompileCommand=exclude,org/apache/velocity/runtime/directive/Foreach,render"

export JAVA_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m -XX:ReservedCodeCacheSize=128m -Dsun.lang.ClassLoader.allowArraySyntax=true -ea"

export DBMIGRATE_HOME="/Users/makoto/Development/workspace5/wine-utils/dbmigrate2"
export PATH=$PATH:$DBMIGRATE_HOME/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
