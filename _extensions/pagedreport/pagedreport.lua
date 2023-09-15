----------------------------
-- Pagedreport lua filter --
----------------------------
-- Author: Thomas Vroylandt
-- Mail: contact@kantiles.com

-- License: see license.md
----------------------------

-- read file function
-- from https://stackoverflow.com/questions/11201262/how-to-read-data-from-a-file-in-lua
local open = io.open

local function read_file(path)
  local file = open(path, "rb")  -- r read mode and b binary mode
  if not file then return nil end
  local content = file:read "*a" -- *a or *all reads the whole file
  file:close()
  return content
end

-- function to create CSS variables with custom values
function addPagedreportVars(meta)
  -- get meta param
  local pagedreport = meta['pagedreport']

  -- add default values if missing (nil)
  if pagedreport['color'] == nil then
    pagedreport['color'] = "orange"
  end

  if pagedreport['font'] == nil then
    pagedreport['font'] = "Lato"
  end

  -- write CSS
  pagedreport_css = [[
      <style>
    :root{
       --back-color: ]] .. pandoc.utils.stringify(pagedreport['color']) .. [[;
       --main-font: ]] .. pandoc.utils.stringify(pagedreport['font']) .. [[;
      }
      </style>
      ]]

  -- get theme content
  theme_css = [[
    <style> ]]
      .. read_file("_extensions/pagedreport/resources/css/" .. pandoc.utils.stringify(pagedreport['theme']) .. ".css") ..
      [[
      </style>
  ]]

  -- read and add css to the current one
  local current_css = meta['header-includes']

  -- add variables
  current_css[#current_css + 1] = pandoc.MetaBlocks(pandoc.RawBlock("html", pagedreport_css))
  -- add theme
  current_css[#current_css + 1] = pandoc.MetaBlocks(pandoc.RawBlock("html", theme_css))

  meta['header-includes'] = current_css

  -- return metadata
  return (meta)
end

-- return objects
return {
  { Meta = addPagedreportVars }
}
