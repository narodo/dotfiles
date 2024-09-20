return {
      name = "DeployHawaii",
      builder = function()
        return {
          cmd = { "./deploy-hawaii.sh" },
          args = {  },
          components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
        }
      end,
}
