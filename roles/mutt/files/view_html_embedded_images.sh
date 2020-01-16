#!/bin/bash

pushd $(mktemp -d)

cat > msg

ripmime -i msg --name-by-type

for f in $(ls .); do
  if [ "$(file -bi $f | cut -d ';' -f1)" = "text/html" ]; then
    cat $f | sed 's|src="cid:\([[:alnum:]]*\.[[:alpha:]]*\)@[[:alnum:]]*\.[[:alnum:]]*"|src="\1"|g' > mail.html
    xdg-open mail.html
    exit
  fi
done

popd
