homebrew-brews
====================

Hopefully you find these as beneficial as I did when creating them.

| Formulae                                    | Description                        |
----------------------------------------------|------------------------------------|
| [freeradius-server3](freeradius-server3.rb) | The latest [FreeRADIUS][] releases |
| [pacparser](pacparser.rb)                   | The [Pacparser][] library          |

How do I install these formulae?
--------------------------------
Just `brew tap leprechau/homebrew-brews` and then `brew install <formula>`.

If the formula conflicts with one from mxcl/master or another tap, you can `brew install leprechau/homebrew-brews/<formula>`.

You can also install via URL:

```bash
brew install https://raw.github.com/leprechau/homebrew-brews/master/<formula>.rb
```

Docs
----
`brew help`, `man brew`, or the Homebrew [wiki][].


[FreeRADIUS]:https://github.com/FreeRADIUS/freeradius-server
[Pacparser]:http://pacparser.manugarg.com
[wiki]:http://wiki.github.com/mxcl/homebrew