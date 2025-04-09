-- List of favorite files/marks per project
return {
    "ThePrimeagen/harpoon",
     branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        -- Set a vim motion to <Shift>m to mark a file with harpoon
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
        vim.keymap.set("n", "M", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    end
}
