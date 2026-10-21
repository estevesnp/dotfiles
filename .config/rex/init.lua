local utils = require("utils")

rex.action({
  name = "cs",
  title = "switch project",
  run = function(ctx, args)
    local dir = args.dir
    if not dir then
      return
    end

    local label = dir:match("([^/]+)$") or dir

    local session_id, err = utils.get_session_id(label)
    if err then
      error(err)
    end

    if not session_id then
      local created, create_err = rex.call("session.create", {
        label = label,
        initial_windows = {
          {
            window_label = label,
            layout = {
              block = {
                flavor = utils.SHELL,
                options = { cwd = dir },
              },
            },
          },
        },
      })

      if not created then
        error(create_err, 0)
      end
      session_id = created.session_id
    end

    rex.client.queue("session.select", {
      session_id = session_id,
    })
  end,
})
