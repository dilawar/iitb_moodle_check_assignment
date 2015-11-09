# iitb_moodle_check_assignment
Use code-sniffer on downloaded zip file from MOODLE.

- Download this (DO NOT USE download zip button). You will not get the
  submodule. Use `git` as follows to download these scripts.

        git clone --recursive https://github.com/dilawar/iitb_moodle_check_assignment
  
  Option `--recursive` is rather important. If you miss it, run `./bootstrap`.

- Download assignments from MOODLE. It is a single zip file. Right? Let's call
  it assignment.zip. Save it somewhere, let's say `~/Downloads/assignment.zip`
- Change the `config` file in this directory to your taste. Check the format of
  this file [here](https://github.com/dilawar/sniffer/wiki/Usage). The file is
  pretty self-explanatory.
- Run `./check_moodle_zip.sh ~/Downloads/assignment.zip` in terminal.
- Wait and watch. 
- Collect the results in `_result` directory. (provided that you have not
  changed the `database` parameter in `config` file.
