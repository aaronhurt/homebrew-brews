homebrew-brews
====================

Hopefully you find these as beneficial as I did when creating them.

| Formulae                                     | Description                        |
-----------------------------------------------|------------------------------------|
| [freeradius-server3](freeradius-server3.rb)  | The latest [FreeRADIUS][] releases |
| ~~pacparser~~                                | ~~Pacparser library and tester~~   |
| ~~consul-backinator~~                        | ~~My consul-backinator utility~~   |

Moved to core
-------------
* [consul-backinator](https://github.com/Homebrew/homebrew-core/blob/master/Formula/consul-backinator.rb)
* [pacparser](https://github.com/Homebrew/homebrew-core/blob/master/Formula/pacparser.rb)

How do I install these formulae?
--------------------------------
Just `brew tap leprechau/homebrew-brews` and then `brew install <formula>`.

If the formula conflicts with one from mxcl/master or another tap, you can `brew install leprechau/homebrew-brews/<formula>`.

You can also install individual formula directly via:

```bash
brew install https://raw.github.com/leprechau/homebrew-brews/master/<formula>.rb
```

Docs
----
`brew help`, `man brew`, or the Homebrew [wiki][].


[FreeRADIUS]:https://github.com/FreeRADIUS/freeradius-server
[wiki]:http://wiki.github.com/mxcl/homebrew
