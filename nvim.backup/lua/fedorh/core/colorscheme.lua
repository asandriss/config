local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("Color scheme could not be loaded")
    return
end
