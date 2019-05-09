# dn-cleaner
Quick USB wiper

## Getting Started

These instructions will get you a copy of the project up and running on your local machine. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

 * A Linux based machine with Bash 4.0 or later
 * Git installed on your Linux machine 
 
```
For Ubuntu/Debian based distributions: sudo apt install git

For RHEL/Fedora/CentOS based distributions: sudo yum install git
```

### Installing

A step by step series of examples that tell you how to get up and running

Clone this repository to your system:

```
$ git clone https://github.com/cascadeth/dn-cleaner.git
```
Change to the new directory: 
```
$ cd dn-cleaner
```

Set permissions if necessary:
```
$ chmod +x clean.sh
```

## Running 

### Super User Rights

The actions taken by this script require su level privileges. Therefore, you will need su rights to run this script effectively. 
```
$ sudo ./clean.sh
```

### Usage

1. Before running the script, leave all USB devices that you wish to wipe **disconnected** from the system. 
2. Once ready, run the script as shown above (with sudo). 
2a. The script will pause and wait for USB drives to be plugged into the machine. 
3. Insert all USB drives to be wiped (some drives may have an LED activity indicator - wait for this to stop flashing)
4. Once all drives have been inserted, press the Return/Enter key. A list of the newly connected drives will be shown, and a final prompt to wipe them.
5. Press `y` or `n` to make your selection. 

## License

This project is licensed under the GNU General Public License Version 3 - see the [LICENSE](LICENSE) file for details

