#Linux Philosophies
* **Treat all users with respect** (The Prime Directive)
* Treat all users equally
* Allow all users the maximum amount of power (complete control)
* Preventing a user from doing stupid things also prevents them from doing clever things

#VPS (Virtual Private Server)
A VPS is a virtual machine (VM) that serves a webpage. It is different from a traditional server in that it is not a dedicated physical machine, but acts like one. It runs a copy of an operating system. It is a small section of memory on a larger device that acts like a dedicated server.

##Advantages
* Cheaper
* Safer (if you accidentally mess something up you can start over easily without destroying an expensive machine)
* Better control (complete root accessibility)
* Efficient use of resources
* Increased stability and dependability
* Scalable - pay only for what you need

##Disadvantages
* Performance may be lower

#Reasons Why Not to Run Programs as Root User on Linux
* Hackers/viruses that blindly attack a system will look for access through root, a known entry point if logins are not disabled
* Security failures will have access to the entire system
* Accountability -- if multiple people have access, and everyone runs root, there's no way to know who made what changes (applies less in a single-user environment, but that's a bad excuse for poor security practice)
* Everyone makes mistakes. You could accidentally irreparably damage your machine, but if you're not on root, you can be reasonably sure that you didn't mess up its ability to operate
* Bugs. If a bug exists that causes damage, it will have less of an effect if you aren't on root user
* You just don't need to most of the time
