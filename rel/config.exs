use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :prod


environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"?j:ZM)$$@>FA6]$w>lc(?<JvD5E97lxWXSbpBUp6p]Vs:%X*i*iZSeX^CM<g4OD>"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"{qr!2Qu|N0jEa]u,1;X(LieG}dRWMP~_J(&U?`%I~1OBSAV9&8zDI)9m|I|a=2,g"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :logger_server do
  set version: current_version(:logger_server)
  set applications: [
    :runtime_tools
  ]
end
