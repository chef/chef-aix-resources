# chef-aix-resources

`chef-aix-resources` is a public, community-maintainable before-state snapshot
of the AIX-specific Chef Infra Client resources and providers that were
previously bundled with Chef.

This gem is **optional**. Chef does not depend on this gem, and it is never
discovered or loaded by the premium platform loader. Applications that need
the snapshot must explicitly require it:

```ruby
require "chef"
require "chef_aix_resources"
```

Requiring `chef_aix_resources` also loads Chef when Chef has not already been
loaded. The entrypoint is idempotent and leaves an already-defined AIX
implementation in place.

## Official support boundary

Official support for AIX nodes is a premium Chef offering delivered through
Target Mode by `agentless-aix-extensions` for licensed AIX users. This
repository is not that supported offering; it is an optional,
community-maintainable local-mode compatibility snapshot.

## Included AIX implementation

The snapshot supplies the AIX-specific implementations for:

- `cron`
- `group`
- `ifconfig`
- `mount`
- `package` and `bff_package`
- SRC `service`
- AIX init-script `service`
- `user` and `aix_user`

The source is kept close to the Chef implementation from which it was copied.
Its local command execution behavior and Chef resource/provider declarations
are intentionally preserved. The copied `target_mode` declarations are kept
for compatibility with the source version; this gem is not the private
premium Target Mode implementation.

## Snapshot provenance

The initial snapshot was copied from Chef Infra Client `19.4.40` before the
AIX implementation extraction. Later changes to Chef do not automatically flow
into this repository; updates should be intentional community-maintained
snapshot revisions.

## Compatibility and limitations

- The gem currently targets Chef `>= 19.0, < 20.0`.
- Its gem metadata permits Ruby `>= 3.0.3` to retain the lowest Ruby version
  accepted by the AIX branch of the current Chef packaging. Chef currently
  requires Ruby `>= 3.1.0` on non-AIX platforms.
- AIX Ruby distributions and native Ruby dependencies are not consistently
  packaged across current AIX environments. Installation and execution of the
  full Chef dependency set on AIX have not been promised or validated by this
  snapshot.
- The unit suite uses mocked command results and can run on a non-AIX host.
  Functional resource execution still requires an AIX host, appropriate
  privileges, and the native AIX commands (`installp`, `lssrc`, `lsfs`,
  `mkgroup`, and others).
- This repository does not modify Chef core. If a Chef release already defines
  one of these AIX classes, the entrypoint does not replace it.

This is a community starting point rather than an official support promise.
There is no guaranteed maintenance schedule, compatibility guarantee for future
Chef releases, or commitment to repair unsupported AIX Ruby packaging. Issues
and fixes are welcome from the community.

The private `agentless-aix-extensions` project is the premium extension to
Chef that makes Target Mode functionality available to licensed AIX users. It
is not included here and should be treated as the authoritative implementation
when it is explicitly loaded for premium Target Mode use.

## Development

Use a released Chef gem by default:

```sh
bundle install
bundle exec rspec
```

To test against a local Chef checkout:

```sh
CHEF_PATH=/path/to/chef bundle install
CHEF_PATH=/path/to/chef bundle exec rspec
```

The same focused suite is available through:

```sh
bundle exec rake spec
```

Build and inspect the gem locally with:

```sh
gem build chef-aix-resources.gemspec
gem check chef-aix-resources-*.gem
```

## License

Copyright notices for the copied source remain with their original authors.
The project is distributed under the Apache License, Version 2.0; see
[`LICENSE`](LICENSE).
