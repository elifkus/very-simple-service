-- Modified code at http://czerasz.com/2015/07/19/wrk-http-benchmarking-tool-example/
-- Module instantiation
local cjson = require "cjson"
local cjson2 = cjson.new()
local cjson_safe = require "cjson.safe"

local url = require "socket.url"

-- Load URL paths from the file
function load_post_data_from_file(file)
  local data = {}
  local content

  -- Check if the file exists
  -- Resource: http://stackoverflow.com/a/4991602/325852
  local f=io.open(file,"r")
  if f~=nil then
    content = f:read("*all")
    io.close(f)
  else
    -- Return the empty array
    return lines
  end

  -- Translate Lua value to/from JSON
  data = cjson.decode(content)

  return data
end

-- load post data from file
--requests = load_request_objects_from_file("/data/requests.json")
post_data = load_post_data_from_file("data/postdata.json")

-- Check if at least one path was found in the file
if #post_data <= 0 then
  print("multiplerequests: No requests found.")
  os.exit()
end

print("multiplerequests: Found " .. #post_data .. " requests")

-- Initialize the requests array iterator
counter = 1

request = function()
  -- Get the next requests array element
  local single_post_data = post_data[counter]

  -- Increment the counter
  counter = counter + 1

  -- If the counter is longer than the requests array length then reset it
  if counter > #single_post_data then
    counter = 1
  end
  print("Post datum is " .. url.escape(single_post_data))
  -- Return the request object with the current URL path
  wrk.method = "POST"
  wrk.body = "text=" .. url.escape(single_post_data)
  wrk.headers["Content-Type"] = "application/x-www-form-urlencoded"

  return wrk.format(nil, "/save")
end