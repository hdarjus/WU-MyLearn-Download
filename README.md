WU-MyLearn-Download
===================

These scripts make it possible to bulk download Checkbox or Assignment submissions from Learn.
The main use case is when parallel courses are managed on a weekly basis from a repository and one does not want to click on all courses every week to access student submissions.

Requirements
------------
The scripts are written in `bash` so they mostly work on Linux.
Prerequisites are
1. Checkbox: `wget`, `xmllint`, and `R` packages `tidiverse` and `rvest`.
  All are available from the OS's usual package management systems.
2. Assignments (Learning activities): `wget` and `unzip`, both available by default on most Linux installations.

Login page
----------
The main difficulty was to get through the Learn login page.
That was sloved by the following steps:
1. Login to Learn in a usual browser, e.g. Firefox
2. Fill in the values of the 4 cookies that are listed in `learncookie.txt`.
  In the current version of `learncookie.txt` they are filled with A, B, C, and D dummy values.
  Those are so-called session cookies, it's _dangerous_ to share them with anyone.
  That's why the last step is crucial to follow as well.
3. `wget` in the scripts uses he session cookies to be able to access your sites on Learn and to download stuff
4. After the scripts are done, logout from Learn in Firefox.
  That ends your session.

How to use this?
----------------
One needs to personalise the script first by recognizing patterns in Learn's URLs.
In order to use the scripts one needs to examine the URLs that belong to the course and copy paste the right things to the end of the `wget` command.

Demo
----
### Checkbox
Checkbox URLs have a naming convention that ends with `prep-survey` and a number n.
```
./download_checkbox_submissions.sh 5
```
is the code for n=5.

### Assignments
Works for individual assignments as well that are managed in the Learning activities.
The shortname of the Assignment is used.
If the shortname is `ses4` then the code below could be helpful:
```
./download_group_submissions.sh ses4
```

Security
--------
While developing the scripts I had them run many many times and I did not do any harm to the courses.
`wget` just sends queries, nothing is going to happen there.

Make sure to logout from Learn in Firefox after (successfully) using the script.

Maintenance
-----------
The scripts come without any warranty.
Please use them carefully.
