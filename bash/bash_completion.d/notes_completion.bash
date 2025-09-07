#!/bin/bash

_notes_completions()
{
	local cur prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	
	if [ "$prev" = "notes" ]; then
		COMPREPLY=( $(compgen -W "$(ls -l $HOME/notes | awk 'NF>=9 {print $9}')" -- ${cur}) )
		return 0
	fi
}

complete -F _notes_completions notes
