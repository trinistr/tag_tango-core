# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2023-09-28

### Added

- `rubocop-performance` dependency.

### Fixed

- `LoadError` was not being rescued in `spec_helper` when requiring `pry`.

## [0.1.2] - 2023-09-24

### Added

- `spec_helper` usable by other parts of TagTango.

### Fixed

- `Initializable.param` always creating a private reader.

## [0.1.1] - 2023-09-24

### Added

- GitHub action workflow `main`.

### Changed

- `bundle exec rake` now also runs `undercover`.

## [0.1.0] - 2023-09-24

### Added

- Dependencies on `dry-initializer`, `dry-monads` and `zeitwerk`.
- `Callable` module.
- `Initializable` module.
- Base `.rubocop.yml` and `spec_helper.rb` files.
