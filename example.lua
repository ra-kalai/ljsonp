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
