return {
      name = "DeployAndroidNova",
      builder = function()
        return {
          cmd = { "./deploy.sh" },
          args = {  },
          components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
        }
      end,
}
