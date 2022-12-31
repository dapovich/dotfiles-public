local status, orgmode = pcall(require, "orgmode")
if (not status) then return end

orgmode.setup_ts_grammar()

orgmode.setup({
  org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED', 'ALMOSTDONE'},
  org_todo_keyword_faces = {
    WAITING = ':foreground #ce95b8 :weight bold',
    DELEGATED = ':foreground #98c379 :weight bold',
    DONE = ':foreground #98c379 :weight bold',
    ALMOSTDONE = ':foreground #9cad8f :weight bold',
    TODO = ':foreground #f75f5f :weight bold'
  },
  org_agenda_files = {'~/notes/org/*'},
  org_default_notes_file = '~/notes/org/refile.org',
})
