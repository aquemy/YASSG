#!/bin/bash

function display_help {
    echo 'USAGE:'
    echo 'docker run -ti [--rm] --mount source=$(pwd)/src,destination=/tmp/builder,type=bind,readonly <image_id|image_name[:image_tag]> [help | bash | /bin/bash | build | pytest [pytest options] [file_or_dir] [...] | lint | deploy ]'
    echo
    echo 'OPTIONS:'
    echo '  help              - Prints this help and exits.'
    echo '  bash | /bin/bash  - Allows to access bash console of the container.'
    echo '  deploy            - Deploy the output folder.'
    echo '  test              - Runs pytest.'
    echo '  build             - Build the website.'
    echo '  lint              - Runs pylint.'
}

function display_mounting_error {
    echo "Mount echr_process directory into /tmp/echr_process in order to run test process properly."
    echo "Use the following snippet in docker run command:"
    echo '--mount src="$(pwd)"/src,dst=/tmp/echr_process/src,type=bind,readonly\n'
}

function build {
  python3 ./generate.py ${@:2}
}

function deploy {
  echo "non-implemented yet :)"
}

function lint_source_code {
    python3 -m pylint --rcfile=.pylintrc *.py
}

function handle_input {
    if [[ "$#" -eq 0 ]] ; then
        display_help
    else
        coverage_output_path="./coverage_data/coverage.xml"
        if [[ "$1" = 'bash' || "$1" = '/bin/bash' ]] ; then
            /bin/bash
        elif [[ "$1" = "build" ]] ; then
          build $@
        elif [[ "$1" = "deploy" ]] ; then
          deploy $@
        elif [[ "$1" = "test" ]] ; then
            python3 -m pytest -v -c ./.pytest.ini --disable-warnings
            python3 -m pytest --cov-report xml:cov.xml  --cov-report html:cov_html --cov-report term-missing --cov=echr tests/
            return
        elif [[ "$1" = 'lint' ]] ; then
            lint_source_code
        else
          display_help
        fi
    fi
}

function main() {
    handle_input $@
    status_code=$?
    exit ${status_code}
}

main $@