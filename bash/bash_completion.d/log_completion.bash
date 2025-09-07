#!/bin/bash

_log_completions()
{
	local cur prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	
	if [ "$prev" = "log" ]; then
		COMPREPLY=( $(compgen -W "$(ls -l $XDG_DATA_HOME/log | awk 'NF>=9 {print $9}')" -- ${cur}) )
		return 0
	fi

	if [[ $cur == -* ]]; then
		COMPREPLY=( $(compgen -W "-h --help -l --late -s --seperate" -- ${cur}) )
		return 0
	fi
}

complete -F _log_completions log
