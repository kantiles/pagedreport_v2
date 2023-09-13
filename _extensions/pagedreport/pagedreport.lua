----------------------------
-- Pagedreport lua filter --
----------------------------
-- Author: Thomas Vroylandt
-- Mail: contact@kantiles.com

-- License: see license.md
----------------------------

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

  -- read and add css to the current one
  local current_css = meta['header-includes']
  
  current_css[#current_css + 1] = pandoc.MetaBlocks(pandoc.RawBlock("html", pagedreport_css))
  meta['header-includes'] = current_css

  -- return metadata
  return (meta)
end

-- return objects
return {
  { Meta = addPagedreportVars }
}
