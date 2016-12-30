# Changelog

## 1.2.6
date: 2013-10-21

- Remind users about regenerating binstubs "in case of problems", merge #11

## 1.2.5
date: 2013-10-12

-  first try to create the bin dir then check if it is writable, update #9, update wayneeseguin/rvm#2277

## 1.2.4
date: 2013-10-10

- raise exception if can not write to bindir, fix #9

## 1.2.3
date: 2013-09-24

- fix detecting program name and system process title, fix #8, update #7, update #5

## 1.2.2
date: 2013-09-23

- change process title only when supported by Process, fix #7, update #5

## 1.2.1
date: 2013-09-22

 - fix installing wrapper when first time installing the gem, fix #6

## 1.2.0
date: 2013-09-17

 - fix full program name with params, fix #5
 - RG 2.1 introduces find_latest_files
 - add license to gemspec, fix #4

## 1.1.0
date: 2013-07-11

 - fix hooks for older rubygems versions
 - add regenerating wrappers on gem installation, closes #2
 - fix uninstaller
 - honor the program suffix, fix #3
 - add a warning for custom custom_shebang, fix #1

## 1.0.0
date: 2013-07-10

 - extracted hooking to rubygems executables from https://github.com/mpapis/rubygems-bundler
