# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-text-editor', 'custom:split-search-horz', ->
  atom.workspace
    .getActivePane()
    .splitDown(copyActiveItem: false)
    .activate()

  atom.workspaceView.trigger 'fuzzy-finder:toggle-file-finder'


atom.commands.add 'atom-text-editor', 'custom:split-search-vert', ->
  atom.workspace
    .getActivePane()
    .splitRight(copyActiveItem: false)
    .activate()

  atom.workspaceView.trigger 'fuzzy-finder:toggle-file-finder'

atom.packages.onDidActivatePackage (pack) ->
  if pack.name == 'ex-mode'
    Ex = pack.mainModule.provideEx()
    Ex.registerCommand 'only', -> atom.workspaceView.trigger 'pane:close-other-items'
