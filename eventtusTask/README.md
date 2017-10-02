# Readme

This is the backend for the gem. The main features are:

  - Create, Read, Update and Delete packages along with their dependencies.
  - Search and return the packages's dependencies.


### Installation

Below are the steps to run the project:

```sh
$ clone the project "git clone git@bitbucket.org:omarsafwany/eventtus-task.git"
$ cd "eventtus-task"
$ rake db:migrate RAILS_ENV=development
$ bundle install
$ rails server
```

Open "http://localhost:3000" and it should display the list of available packages.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sys_libs.