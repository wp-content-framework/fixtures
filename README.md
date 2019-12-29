# Fixtures

[![CodeFactor](https://www.codefactor.io/repository/github/wp-content-framework/fixtures/badge)](https://www.codefactor.io/repository/github/wp-content-framework/fixtures)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/technote-space/jquery.marker-animation/blob/master/LICENSE)

<!-- START doctoc -->
<!-- END doctoc -->

## Example
```
  "scripts": {
    "prepare": [
      "mkdir -p ./fixtures/.git",
      "chmod -R +w ./fixtures/.git && rm -rdf ./fixtures",
      "rm -f ./phpcs.xml ./phpmd.xml",
      "git clone --depth=1 https://github.com/wp-content-framework/fixtures.git fixtures",
      "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/prepare.sh"
    ],
    "test": "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/test.sh",
    "phpcs": "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/php/phpcs.sh",
    "phpmd": "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/php/phpmd.sh",
    "phpcbf": "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/php/phpcbf.sh",
    "packages": "WORKSPACE=$(cd $(dirname $0); pwd) bash ./fixtures/bin/packages.sh"
  }
```

## Author
[GitHub (Technote)](https://github.com/technote-space)  
[Blog](https://technote.space)
