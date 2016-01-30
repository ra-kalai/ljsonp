LJSONP ( a simple Lpeg JSON Parser)
=====================================
 

Requirement
-----------

  * LPeg ( tested only with lpeg 1.0.0 )
  * Lua ( tested with lua 5.3 / 5.1 )

Usage
-----

Import the module using something like

    local ljsonp = require 'ljsonp'

This set the *ljsonp* variable to a table with 4 exported property:

* __stringify(in, pp)__

    return a JSON string to represent the *in* variable.

    If *pp* argument is equal 1; then returned JSON string will be a little bit pretty printed.

    *warning* current implementation is not yet fully complete ( string escape code is missing )

* __parse(in (string))__

    parse a JSON string and return a table or *nil* if passed *in* JSON  string is invalid.

* __null__

    A table used to represent JSON *null* kind the *__len* metamethod of this table return -1 (#null == -1)

* __object({...} or nil)__

    function to allow representing empty object ( {} )
    the returned object / table has his *__len*  metamethod returning -2 (#ret == -2)


Example
-------

    (example.lua)


    local ljsonp = require 'ljsonp'
    
    local json = ljsonp.parse('{"foo":"bar", "barfoo":null, "foobar": {"a": [1, "2" , 3]}}')
    
    print(ljsonp.stringify(json, 1))
    --
    -- output
    --
    -- {
    -- "foo":"bar",
    -- "barfoo":null,
    -- "foobar":{
    --   "a":[
    --     1,
    --     "2",
    --     3
    --   ]
    -- }
    -- }
    --
    
    
    
    print(ljsonp.stringify({
      a=ljsonp.object({}),
      b={},
      c={1,2,3,nil,{d=1}}
      }))
    
    --
    -- output
    --
    -- {"c":{"1":1,"2":2,"3":3,"5":{"d":1}},"b":[],"a":{}}
    --
    
    
    print(ljsonp.stringify({
      a=ljsonp.object({}),
      b={},
      c={1,2,3,ljsonp.null,{d=1}}
      }))
    
    
    --
    -- output
    --
    -- {"c":[1,2,3,null,{"d":1}],"b":[],"a":{}}
    --             |                        | 
    --             |                        | ljsonp.object allow creation of empty object.
    --             |
    --             | ljsonp.null output a proper null value.
    --
    
    
    print(#ljsonp.null)
    
    --
    -- output
    --
    -- -1



License
-------

  Three clause BSD license


Contact
-------

Please send bug reports, patches and feature requests to me <ra@apathie.net>.
