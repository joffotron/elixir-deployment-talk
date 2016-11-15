use Mix.Releases.Config,
    default_release: :default,
    default_environment: :prod


environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"Lp!UZ:|ko<jC6hBzv6?J?{NV0F^)t_^vF4kkTv^O<T,],i_AAX@+[qUI>_jTa6Mc"
end

release :deploy_talk do
  set version: current_version(:deploy_talk)
end

