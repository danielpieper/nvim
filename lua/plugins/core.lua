return {
  {
    "williamboman/mason.nvim",
    enabled = function()
      return (vim.loop.os_uname().sysname ~= "Linux") -- won't work on nixos
    end,
  },
}
