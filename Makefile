SHELL := /bin/bash

.PHONY: help verify syntax scan fixtures

help:
	@printf '%s\n' \
		'Genome-agent prompts public harness' \
		'' \
		'Targets:' \
		'  make verify    Run safety scan and fixture checks' \
		'  make syntax    Check shell script syntax' \
		'  make scan      Check for private identifiers and private artifacts' \
		'  make fixtures  Check public fixtures are synthetic and lightweight'

verify: syntax scan fixtures

syntax:
	@scripts/check_shell_syntax.sh

scan:
	@scripts/check_no_private_content.sh

fixtures:
	@scripts/check_fixtures.sh
