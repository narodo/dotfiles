local Path = require "plenary.path"

return {
  'stevearc/overseer.nvim',
  opts = {
      templates = {"builtin", "scripts.curDir"}
  },

  init = function()
        vim.api.nvim_create_user_command("Deploy", function(params)

        local script= "deploy.sh"
        local panelTypeArg = ""

        -- split arguments
        for argVal in string.gmatch(params.args, "%S+") do
            print(argVal)
            if argVal == "hawaii" then
                script= "deploy-hawaii.sh"
            end
            if argVal == "comet" then
                panelTypeArg = "comet"
            end
        end

        local scriptPath = Path.new(script)
        if not Path.exists(scriptPath) then
            print("Could not find deploy script in directory: ", Path.expand(scriptPath))
            return
        end


        local task = require("overseer").new_task({
          cmd = {"./" .. Path.expand(scriptPath)},
          args = {panelTypeArg},
          components = {
            { "on_output_quickfix", open_on_exit = "failure", open_height = 8 },
            "default",
          },
        })
        task:start()

        end, {
          desc = "Deploy artifacts to HW",
          nargs = "*",
          bang = true,
          complete = function() return {"hawaii", "comet"} end
        })
  end
}
