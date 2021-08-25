local M = {}

M.config = function()
  local status_ok, texmagic = pcall(require, "texmagic")
  if not status_ok then
    return
  end

  texmagic.setup {
    -- Run setup and specify two custom build engines
    engines = {
      pdflatex = { -- This has the same name as a default engine but would
        -- be preferred over the same-name default if defined
        executable = "latexmk",
        args = {
          "-pdflatex",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-outdir=.build",
          "-pv",
          "%f",
        },
        isContinuous = false,
      },
      lualatex = { -- This is *not* one of the defaults, but it can be
        -- called via magic comment if defined here
        executable = "latexmk",
        args = {
          "-pdflua",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-pv",
          "%f",
        },
        isContinuous = false,
      },
    },
  }
end

return M
