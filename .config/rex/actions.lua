local M = {}

local consts = {
  SHELL = "com.superlogical.terminal.shell",
}

local function get_session_id(label)
  local session_list, err = rex.call("session.list")
  if not session_list then
    return nil, err
  end
  for _, session in ipairs(session_list.sessions or {}) do
    if session.label == label then
      return session.session_id, nil
    end
  end
  return nil, nil
end

function M.cs(ctx, args)
  local dir = args.dir
  if not dir then
    return
  end

  local label = dir:match("([^/]+)$") or dir

  local session_id, session_err = get_session_id(label)
  if session_err then
    error(session_err)
  end

  if not session_id then
    local created, create_err = rex.call("session.create", {
      label = label,
      initial_windows = {
        {
          window_label = label,
          layout = {
            block = {
              flavor = consts.SHELL,
              options = { cwd = dir },
            },
          },
        },
      },
    })

    if not created or create_err then
      error(create_err)
    end
    session_id = created.session_id
  end

  rex.client.queue("session.select", {
    session_id = session_id,
  })
end

return M
