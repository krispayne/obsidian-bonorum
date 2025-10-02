-- Lua filter to add page break before bibliography header
-- Usage: pandoc --lua-filter=bibliography-pagebreak.lua input.md -o output.docx

function Pandoc(doc)
    local new_blocks = {}
    
    for i, block in ipairs(doc.blocks) do
      -- Look for bibliography div
      if block.tag == "Div" and block.identifier == "refs" then
        -- Check if the previous block is a header (likely the "References" title)
        local prev_block = doc.blocks[i-1]
        
        if prev_block and prev_block.tag == "Header" then
          -- We found Header + Bibliography div pattern
          -- Remove the header from new_blocks (it was just added)
          table.remove(new_blocks)
          
          -- Add page break, then header, then bibliography
          local pagebreak = pandoc.RawBlock('openxml', 
            '<w:p><w:pPr><w:pageBreakBefore/></w:pPr></w:p>')
          table.insert(new_blocks, pagebreak)
          table.insert(new_blocks, prev_block)  -- Re-add the header
          table.insert(new_blocks, block)       -- Add the bibliography
        else
          -- No header found, just add page break before div
          local pagebreak = pandoc.RawBlock('openxml', 
            '<w:p><w:pPr><w:pageBreakBefore/></w:pPr></w:p>')
          table.insert(new_blocks, pagebreak)
          table.insert(new_blocks, block)
        end
      else
        table.insert(new_blocks, block)
      end
    end
    
    return pandoc.Pandoc(new_blocks, doc.meta)
  end
  
  -- Alternative: More robust approach looking ahead
  function Pandoc_v2(doc)
    local new_blocks = {}
    local i = 1
    
    while i <= #doc.blocks do
      local block = doc.blocks[i]
      local next_block = doc.blocks[i+1]
      
      -- Check if current block is a header and next block is bibliography
      if block.tag == "Header" and 
         next_block and 
         next_block.tag == "Div" and 
         next_block.identifier == "refs" then
        
        -- Found the pattern: Header followed by bibliography div
        local pagebreak = pandoc.RawBlock('openxml', 
          '<w:p><w:pPr><w:pageBreakBefore/></w:pPr></w:p>')
        
        table.insert(new_blocks, pagebreak)
        table.insert(new_blocks, block)      -- Header
        table.insert(new_blocks, next_block) -- Bibliography div
        
        i = i + 2  -- Skip the next block since we already processed it
      else
        table.insert(new_blocks, block)
        i = i + 1
      end
    end
    
    return pandoc.Pandoc(new_blocks, doc.meta)
  end
  
  -- Debug version to see the structure
  function Debug_Pandoc(doc)
    print("=== Document structure ===")
    for i, block in ipairs(doc.blocks) do
      if block.tag == "Header" then
        print(i .. ": Header (level " .. block.level .. "): " .. pandoc.utils.stringify(block.content))
      elseif block.tag == "Div" then
        print(i .. ": Div (id: " .. (block.identifier or "none") .. ", classes: " .. table.concat(block.classes or {}, ", ") .. ")")
      else
        print(i .. ": " .. block.tag)
      end
    end
    print("========================")
    return doc
  end