# CHANGELOG

## 2021-02-22
- Added
    - `bin/demyx-entrypoint`
    - `bin/demyx-logrotate`
- Changed
    - Renamed src to bin.
    - Renamed entrypoint.sh to demyx-entrypoint.
    - Renamed logrotate.sh to demyx-logrotate.
    - `bin/demyx-entrypoint`
        - Remove full paths to binaries.
    - `bin/demyx-logrotate`
        - Remove full paths to binaries.
    - `Dockerfile`
        - Remove full paths to binaries.
        - Rearrange RUN commands.
        - Update bash PS1.
        - Update COPY directory.
- Removed

## 2020-12-20
### Changed
- Set default path in Dockerfile
- Set logrotate interval through environment variable

## 2020-11-22
### Changed
- Rename variables and support old ones
- Use full paths to binaries/scripts
- Use -E flag for sudo to keep environment variables

## 2020-04-13
### Added
- sudo
- RUN to configure sudo
- Created new folder for source files
### Changed
- Format LABEL and ENV entries
- Update finalize RUN commands
- Update entrypoint
- Move Updates & Support section to the bottom
- Add notice in Usage section
- Travis-CI
    - Update script commands
    - Update version commands
    - Output versions to a file
    - Commit version file first before committing the rest
### Removed
