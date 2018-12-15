# Changelog

All notable changes to this project will be documented in this file.

For more information about changelogs, check
[Keep a Changelog](http://keepachangelog.com) and
[Vandamme](http://tech-angels.github.io/vandamme).

## 3.0.0 - 12/14/18 Fri

-   [breaking change] - Stringifier module API updated to allow maps nested within lists to have their keys "stringified".

## 2.0.1 - 12/12/18 Wed

-   [BUG FIX] - Stringifier module updated to allow an atom not to be atomized, with respect to maps

## 2.0.0 - 12/6/18 Thurs

-   [breaking change] - Atomizer module updated to apply #atomize to lists (including char lists).
-   [breaking change] - CamelCaser module updated to apply #camel_case to lists
-   [breaking change] - Dasher module updated to apply #dasherize to lists
-   [breaking change] - LowerCaser module updated to apply #lowercase_first to lists
-   [breaking change] - SnakeCaser module updated to apply #snake_case to lists
-   [breaking change] - Stringifier module updated to apply #stringify to lists
-   [breaking change] - UpperCaser module updated to apply #upcase_first to lists

## 1.0.0 - 2/17/18 Sat

-   [breaking change] Atomizer#atomize now expects a symbol :atomize instead of a string if you want to "atomize" a data type
-   [breaking change] Stringifier#stringify now expects a symobl :stringify instead of a string if you want to "stringify" a data type

## 0.5.0 - 11/19/17 Sun

-   [ENHANCEMENT] Atomizer module updated to use protocols
-   [ENHANCEMENT] Stringifier module updated to use protocols
-   [ENHANCEMENT] Floating point keys are now handled by the various protocols
    (see tests)

## 0.4.0 - 11/12/17 Sun

-   [FEATURE] CamelCaser module to camelize nested (and non-nested) map keys
-   [FEATURE] UpperCase module to upcase the first letter of nested (and non-nested) map keys
-   [FEATURE] LowerCase module to lowercase the first letter of nested (and non-nested) map keys
-   [FEATURE] Dasher module to dasherize the underscored nested (and non-nested) map keys

## 0.3.0 - 11/9/17 Thurs

-   [FEATURE] Module to underscore nested (and non-nested) map keys

## 0.2.0 - 9/13/17 Weds

-   [FEATURE] Module to convert nested (and non-nested) map keys to "stringified" keys

## 0.1.0 - 9/12/17 Tues

-   [FEATURE] Module to convert nested (and non-nested) map keys to "atomized" keys
