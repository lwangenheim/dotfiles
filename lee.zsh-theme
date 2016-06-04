# Lee - created from Crunch.
# Initially hacked from the Dallas theme. Thanks, Dallas Reedy.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info.  Instead, only the 
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
# 
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

LEE_BRACKET_COLOR="%{$fg[white]%}"
LEE_TIME_COLOR="%{$fg[yellow]%}"
LEE_RVM_COLOR="%{$fg[magenta]%}"
LEE_DIR_COLOR="%{$fg[cyan]%}"
LEE_GIT_BRANCH_COLOR="%{$fg[green]%}"
LEE_GIT_CLEAN_COLOR="%{$fg[green]%}"
LEE_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
#ZSH_THEME_GIT_PROMPT_PREFIX="$LEE_BRACKET_COLOR:$LEE_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_PREFIX="$LEE_BRACKET_COLOR:$LEE_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="$LEE_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY="$LEE_GIT_DIRTY_COLOR✗"

# Our elements:
LEE_TIME_="$LEE_BRACKET_COLOR{$LEE_TIME_COLOR%T$LEE_BRACKET_COLOR}%{$reset_color%}"
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  LEE_RVM_="$LEE_BRACKET_COLOR"["$LEE_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$LEE_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    LEE_RVM_="$LEE_BRACKET_COLOR"["$LEE_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$LEE_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
LEE_DIR_="$LEE_DIR_COLOR%20<...<%~%<<%(!.#.$)"
LEE_PROMPT="$LEE_BRACKET_COLOR:~$"

# Put it all together!
PROMPT="$LEE_RVM_$LEE_DIR_$(git_prompt_info)$LEE_PROMPT%{$reset_color%}"
