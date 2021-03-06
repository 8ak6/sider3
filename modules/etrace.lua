-- Event tracer
-- prints event and context info, reacting to various events

local m = {}

local function t2s(t)
    local parts = {}
    for k,v in pairs(t) do
        parts[#parts + 1] = string.format("%s=%s", k, v)
    end
    table.sort(parts) -- sort alphabetically
    return string.format("{%s}", table.concat(parts,", "))
end

-- utility function to log message with a timestamp
local function tlog(...)
    local msg = string.format(...)
    log(string.format("%s | %s", os.date("%Y-%m-%d %H:%M:%S"), msg))
end

function m.set_home(ctx, id)
    tlog("home team: %d", id)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_away(ctx, id)
    tlog("away team: %d", id)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_match_time(ctx, minutes)
    tlog("match time: %d", minutes)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_tid(ctx, tid)
    tlog("tournament_id: %d", tid)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_stadium_choice(ctx, stadium_id, initial)
    tlog("stadium_choice: %s (initial: %s)", stadium_id, initial)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_stadium(ctx, options)
    tlog("stadium: %s", options.stadium)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_conditions(ctx, options)
    tlog("conditions: %s", t2s(options))
    tlog("ctx: %s", t2s(ctx))
end

function m.after_set_conditions(ctx)
    tlog("after_set_conditions: ctx: %s", t2s(ctx))
end

function m.set_stadium_for_replay(ctx, options)
    tlog("replay-stadium: %s", options.stadium)
    tlog("ctx: %s", t2s(ctx))
end

function m.set_conditions_for_replay(ctx, options)
    tlog("replay-conditions: %s", t2s(options))
    tlog("ctx: %s", t2s(ctx))
end

function m.after_set_conditions_for_replay(ctx)
    tlog("after_set_conditions_for_replay: ctx: %s", t2s(ctx))
end

function m.enter_edit_mode(ctx)
    tlog("Entered EDIT mode")
    tlog("ctx: %s", t2s(ctx))
end

function m.exit_edit_mode(ctx)
    tlog("Exited EDIT mode")
    tlog("ctx: %s", t2s(ctx))
end

function m.enter_replay_gallery(ctx)
    tlog("Entered REPLAY gallery")
    tlog("ctx: %s", t2s(ctx))
end

function m.exit_replay_gallery(ctx)
    tlog("Exited REPLAY gallery")
    tlog("ctx: %s", t2s(ctx))
end

function m.init(ctx)
   ctx.register("set_home_team", m.set_home)
   ctx.register("set_away_team", m.set_away)
   ctx.register("set_tournament_id", m.set_tid)
   ctx.register("set_match_time", m.set_match_time)
   ctx.register("set_stadium_choice", m.set_stadium_choice)
   ctx.register("set_stadium", m.set_stadium)
   ctx.register("set_conditions", m.set_conditions)
   ctx.register("after_set_conditions", m.after_set_conditions)
   ctx.register("set_stadium_for_replay", m.set_stadium_for_replay)
   ctx.register("set_conditions_for_replay", m.set_conditions_for_replay)
   ctx.register("after_set_conditions_for_replay", m.after_set_conditions_for_replay)
   ctx.register("enter_edit_mode", m.enter_edit_mode)
   ctx.register("exit_edit_mode", m.exit_edit_mode)
   ctx.register("enter_replay_gallery", m.enter_replay_gallery)
   ctx.register("exit_replay_gallery", m.exit_replay_gallery)
end

return m
