# @hidden
default:
    @just --list

pin-deps:
    python3.13 -m piptools compile --generate-hashes requirements.in

sync-deps:
    python3.13 -m piptools sync requirements.txt

upgrade-deps:
    python3.13 -m piptools compile --upgrade requirements.in
    python3.13 -m piptools sync requirements.txt

outdated-deps:
    python3.13 -m piptools compile --outdated

generate-pdf notebook:
    jupyter nbconvert --to pdf notebooks/{{notebook}}.ipynb --output ../reports/{{notebook}}.pdf

generate-html notebook:
    jupyter nbconvert --to html notebooks/{{notebook}}.ipynb --output ../reports/{{notebook}}.html
