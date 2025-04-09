-- Function to get the word under the cursor
local function get_cursor_word()
  return vim.fn.expand("<cword>") or "Component"
end

-- Replace the word under the cursor with a React component
local function replace_with_react_component()
  local componentName = get_cursor_word()
  local componentTemplate = string.format([[
const %s = () => {
  return <div>%s Component</div>;
};

export default %s;
]], componentName, componentName, componentName)

  -- Delete the word under cursor
  vim.cmd("normal! viw\"_d")

  -- Insert the component at the cursor position
  vim.api.nvim_put(vim.split(componentTemplate, "\n"), "l", true, true)
end

-- Create a new file with the component
local function create_new_component_file()
  local componentName = get_cursor_word()
  local filename = componentName .. ".tsx"

  vim.cmd("edit " .. filename) -- Open a new file
  vim.defer_fn(function()
    replace_with_react_component() -- Insert the component template
  end, 100)
end

-- Wrap word in JSX tag
local function wrap_in_tag()
  local componentName = get_cursor_word()
  vim.cmd(string.format('normal! viw"zdi<<%s>"zpa>', componentName)) -- Wrap word in JSX tag
end

-- Main function to display action list
local function react_code_actions()
  local actions = {
    { "Replace with React Component", replace_with_react_component },
    { "Create New Component File", create_new_component_file },
    { "Wrap in JSX Tag", wrap_in_tag },
  }

  local choices = {}
  for _, action in ipairs(actions) do -- FIX: Use `_, action` instead of `action`
    table.insert(choices, action[1])
  end

  vim.ui.select(choices, { prompt = "Choose React Action:" }, function(choice)
    if choice then
      for _, action in ipairs(actions) do
        if action[1] == choice then
          action[2]() -- Call the selected function
          break
        end
      end
    end
  end)
end

-- Set the keymap
vim.keymap.set("n", "<leader>rc", react_code_actions, { noremap = true, silent = true })
