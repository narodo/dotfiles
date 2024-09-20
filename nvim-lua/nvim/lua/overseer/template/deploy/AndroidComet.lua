return {
      name = "DeployAndroidComet",
      builder = function()
        return {
          cmd = { "./deploy.sh" },
          args = { "comet" },
          components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
        }
      end,
}
