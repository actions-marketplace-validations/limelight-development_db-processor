# Limelight - DB Processor
```
#================================================================
# Limelight - DB Processor
#================================================================
# SYNOPSIS
#   ./db-processor
#   ./db-processor [[input-maps]INPUT_MAPS] ...
#
# DESCRIPTION
#    This script is used to process INSERT statements
#    based on a key-value mapping into a database.
#    
#    Processing includes escaping the values (prepared-statements).
#
#    The script can work with arguments or env variables.
#    If no arguments are provided, you must export the required
#    environment variables prior to running it.
#
# ARGUMENTS
#       [[input-maps]INPUT_MAPS]    Set the key-value map
#                                   The default value is env INPUT_MAPS
#                                   Format: String
#       [[input-host]INPUT_HOST]    Set the mysql host
#                                   The default value is env INPUT_HOST
#                                   Format: String|IP
#       [[input-port]INPUT_PORT]    Set the mysql port
#                                   The default value is env INPUT_PORT
#                                   Format: String|Integer
#       [[input-user]INPUT_USER]    Set the mysql username
#                                   The default value is env INPUT_USER
#                                   Format: String
#       [[input-pass]INPUT_PASS]    Set the mysql password
#                                   The default value is env INPUT_PASS
#                                   Format: String
#       [[input-tabl]INPUT_TABL]    Set the mysql table, eg: db.tbl
#                                   The default value is env INPUT_TABL
#                                   Format: String
#       [[input-debug]INPUT_DEBUG]  Toggle the debug mode
#                                   The default value is env INPUT_DEBUG
#                                   or false
#                                   Format: Boolean/Integer
#
# EXAMPLES
#    ./db-processor "column1=value1;column2=value2" ...
#
#================================================================
#- IMPLEMENTATION
#-    version         1.0.0
#-    author          Steven Agyekum <s-8@posteo.mx>
#-    copyright       Copyright (c) Limelight Gaming Ltd.
#-    license         MIT License
#-
#================================================================
#================================================================
```
---

## Requirements

- MySQL client
- PHP 7 with PDO extension enabled

---

## Use Case

We use this product in our CD workflows for tracking some commit messages.

---

## Usage

### Standalone

``chmod +x ./db-processor``

```
./db-processor <args>
```

or 

```
./db-processor
``` 

when using environment variables.

### Docker

```
docker run -e MAPS="" -e INPUT_HOST="" -e INPUT_PORT="" -e INPUT_USER="" -e INPUT_PASS="" -e INPUT_TABL="" -e INPUT_DEBUG=true
```

### Github Actions

You can run this action by using the ``with:`` block

```
  steps:
  - uses: actions/checkout@v1
  - name: Insert to database
    uses: limelight-development/db-processor@1.0
    with:
      maps: column1=value1;column2=value2;
      host: ${{ secrets.MYSQL_HOST }}
      port: ${{ secrets.MYSQL_PORT }}
      user: ${{ secrets.MYSQL_USER }}
      pass: ${{ secrets.MYSQL_PASS }}
      tabl: ${{ secrets.MYSQL_TABL }}
      debug: true
```

or by using the ``env:`` block for environment variables

```
  steps:
  - uses: actions/checkout@v1
  - name: Insert to database
    uses: limelight-development/db-processor@1.0
    env:
      INPUT_MAPS: column1=value1;column2=value2;
      INPUT_HOST: ${{ secrets.MYSQL_HOST }}
      INPUT_PORT: ${{ secrets.MYSQL_PORT }}
      INPUT_USER: ${{ secrets.MYSQL_USER }}
      INPUT_PASS: ${{ secrets.MYSQL_PASS }}
      INPUT_TABL: ${{ secrets.MYSQL_TABL }}
      INPUT_DEBUG: true
```

**Full example:**

```
name: CI

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Insert to database
      uses: limelight-development/db-processor@1.0
      with:
        maps: column1=value1;column2=value2;
        host: ${{ secrets.MYSQL_HOST }}
        port: ${{ secrets.MYSQL_PORT }}
        user: ${{ secrets.MYSQL_USER }}
        pass: ${{ secrets.MYSQL_PASS }}
        tabl: ${{ secrets.MYSQL_TABL }}
        debug: true

```
---

Check synopsis above to get an example.
