# idrtemplates

this is the source for idrtemplates (I dont remember templates). the goal of this project/plugin is to fulfill the following:

- it detects the current language in buffer and loads corresponding templates
- reads (.idrtemplates) as snippets for common code
- extendable for key mappings
- no dependencies

# usage

to use

```
:IDRhelp              # will load default full list of code for detected language into new split buffer

:IDRarray             # add snippet for current language - array
:IDRif                # add snippet for current language - if elseif else
:IDRclass             # add snippet for current language - class
:IDRconstant          # add snippet for current language - constant
:IDRecho              # add snippet for current language - echo print
:IDRfunction          # add snippet for current language - function
:IDRloop              # add snippet for current language - while for loop
:IDRswitch            # add snippet for current language - switch case
:IDRregex             # add snippet for current language - regular expression
:IDRvar               # add snippet for current language - variable string int
```
