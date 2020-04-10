#!/bin/bash

if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed: run `brew install swiftlint`"
fi
