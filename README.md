# Azkar - Mobile App [![Azkar build status](https://api.codemagic.io/apps/62a708160a17ac1e12401903/62a708160a17ac1e12401902/status_badge.svg)](https://codemagic.io/apps/62a708160a17ac1e12401903/62a708160a17ac1e12401902/latest_build)

<img src="/readme/appLogo.png" align="left"
width="200" hspace="10" vspace="10">

Azkar is Muslims App that allows you to remember the Zikr of allah by allowing you to set a periodic Alaram for every
Zikr that you wish to be reminded of.

Azkar is available on the Google Play Store.

<p align="left">
<a href="https://play.google.com/store/apps/details?id=com.khair.azkar">
    <img alt="Get it on Google Play"
        height="80"
        src="https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png" />
</a></p>

## About

Azkar is Muslims App that allows you to remember the Zikr of allah by allowing you to set a periodic Alaram for every
Zikr that you wish to be reminded of.


## Features

The android app lets you:
- Showing Prayer times.
- Display Azkar List.
- Enable and disable Alarm about a Selected Zikr.
- Notifications on special religious events such as Eid and Special days.

## Screenshots

[<img src="readme/1.jpeg" align="left"
width="200"
    hspace="10" vspace="10">](/readme/1.jpeg)
[<img src="/readme/2.jpeg" align="center"
width="200"
    hspace="10" vspace="10">](/readme/2.jpeg)
[<img src="/readme/3.jpeg" align="center"
width="200"
    hspace="10" vspace="10">](/readme/3.jpeg)
[<img src="/readme/4.jpeg" align="center"
width="200"
    hspace="10" vspace="10">](/readme/4.jpeg)
[<img src="/readme/5.jpeg" align="center"
width="200"
    hspace="10" vspace="10">](/readme/5.jpeg)
[<img src="/readme/6.jpeg" align="center"
width="200"
    hspace="10" vspace="10">](/readme/6.jpeg)

## Permissions

On Android versions prior to Android 6.0, Azkar requires the following permissions:
- Full Network Access.
- Location access to get accurate Prayer times.



## Contributing

Azkar app is a free and open source project developed by volunteers. Any contributions are welcome. Here are a few ways you can help:
 * [Report bugs and make suggestions.](https://github.com/wdelawed/azqarApp/issues)
 * Write some code. Please follow the code style used in the project to make a review process faster. 


 # Making Changes

We follow a simple workflow. master branch is the only long running branch and shouldn't be committed into directly. To make changes follow these steps:

0. if you are not a contributor ask the repository admin to add you as a contributor then Follow these steps

1.  checkout to another branch from master

```sh
# checkout the master branch
$ git checkout master
# make sure you have the latest changes
$ git pull --ff-only
# create and checkout a new branch (my-feature)
$ git checkout -b my-feature
```

There's no unified naming scheme, just use a descriptive name for your branch and write meaningful commit messages.

2. After finishing your changes and committing them, run the dart formatter and check the analyzer for any errors, then push your branch and create a pull request.

```sh
# run the flutter analyzer (must be inside an app's directory)
$ flutter analyze
# to run the formatter
$ dartfmt --fix -w .
# or alternatively
$ flutter format .
```

commit the formatted code if any using `git commit -m "<message here>"`. If this is just a formatting fix, the message can be "fix formatting".

3. Push your branch

```sh
$ git push -u origin my-feature
```

4. Open Github, create the pull request and fill the template PR body. After creating the PR, the workflow should kick off soon after, wait for it to finish.

5. Review your changes. Make sure you have included only the relevant changes in your PR, and that the changes are all intended.

6. If your changes are significant and you feel the need for your changes to be reviewed, request a review from one of the developers. If you don't know who you should request for review, Github suggests a reviewer depending on the code you changed and who wrote it.

7. After getting the green light and **all the checks succeed** merge your branch.

## License

This application is released under GNU GPLv3 (see [LICENSE](LICENSE)).
Some of the used libraries are released under different licenses.
