# Fixtures

[![CodeFactor](https://www.codefactor.io/repository/github/wp-content-framework/fixtures/badge)](https://www.codefactor.io/repository/github/wp-content-framework/fixtures)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/technote-space/jquery.marker-animation/blob/master/LICENSE)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Example](#example)
- [Author](#author)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Example
```
  "scripts": {
    "prepare": [
      "mkdir -p ./fixtures/.git",
      "chmod -R +w ./fixtures/.git && rm -rdf ./fixtures",
      "rm -f ./phpcs.xml ./phpmd.xml ./phpunit.xml",
      "git clone --depth=1 https://github.com/wp-content-framework/fixtures.git fixtures",
      "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/prepare.sh"
    ],
    "test": "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/test.sh",
    "phpcs": "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/php/phpcs.sh",
    "phpmd": "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/php/phpmd.sh",
    "phpcbf": "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/php/phpcbf.sh",
    "packages": "WORKSPACE=${WORKSPACE:-$(cd $(dirname $0); pwd)} bash ./fixtures/bin/packages.sh"
  }
```

## Author
[GitHub (Technote)](https://github.com/technote-space)  
[Blog](https://technote.space)
