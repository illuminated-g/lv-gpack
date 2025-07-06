# GPack User Guide

GPack is a command-line invoked tool (with GUIs) for managing dependencies for LabVIEW projects. It performs actions such as automatically detecting dependent repositories from LabVIEW Projects (`.lvproj`) in a repository and making it easy to install dependencies for new projects and new copies of the repository.

## Installation

GPack is currently distributed via GitHub releases in the GPack repository:
[GPack Releases](https://github.com/illuminated-g/lv-gpack/releases)

You should always download the latest version for the best support. You can unzip the build anywhere on your system. Once unzipped, you must run `bin/setup/gp-env.exe` as an administrator to ensure GPack is configured for use on your system. This ensures the location you placed GPack in is added to the path. Once you've run `gp-env.exe` you will need to close any terminals/applications that need to use GPack and relaunch them for the setup to take effect.

New updates can be unpacked without needing to run `gp-env.exe` as long as you've used the same location. If you try running the setup again it will simply alert you that GPack is already available for use.

## Usage

GPack is run from the command line with `gp <action> [options]`. GPack creates a `.gpack` file in the repository folder to store information about the repo and its dependencies.

## Actions

### init
Creates a basic .gpack file with no dependencies listed to start working with GPack tooling in the repository.

#### Options

- --license &lt;license expression&gt;
  - Specifies the [SPDX license](https://spdx.org/licenses/) identifier that the repository uses or can be a relative path starting with `./` to point to a license file, such as `./LICENSE`. Regardless of platform, always use forward slashes `/` for paths.

<hr>

### add
Adds a dependency to the repository that does not exist on disk yet. The dependency can be any source that GPack supports but works best when that source also contains a .gpack file as it will install all the nested dependencies of that source.

### Options

- --git &lt;repository URL&gt;
  - Specifies the source as a git repository source and the repository to add as a dependency.
  - Supports the --branch option
- --branch &lt;branch name&gt;
  - Specifies the branch to checkout from the source, if the source supports branches.
  - If not specified, the latest commit of the default branch is used which is the default behavior of SCC tooling.

<hr>

### depend
Automatically updates dependencies listed in the .gpack file based on what is found in LabVIEW Project files in the repository. This action does not remove any dependency listings.

GPack checks every file used in the .lvproj file and checks to see if the file path is supported as a source (such as being contained within a different Git repository). GPack will save the source type, location, relative path, and more information to the .gpack file so that subsequent install actions can restore the dependency properly.

This depend action should be run anytime SCC operations are performed on any dependencies to ensure the information stored in the .gpack file is kept up to date.

### Options

- --allproj
  - Looks at all .lvproj files in the repository to determine dependencies.
  - Cannot be combined with the --project option.
- --project &lt;relative .lvproj path&gt;
  - Updates dependencies based on a specific project within the repository.
  - Cannot be combined with the --allproj option.

<hr>

### install
Downloads all dependencies listed in the .gpack file.